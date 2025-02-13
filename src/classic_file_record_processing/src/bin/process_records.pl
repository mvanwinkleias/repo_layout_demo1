#!/usr/bin/perl

use strict;
use warnings;

package ClassicRecordProcessing::Processor1;

use IO::File;
use JSON;
use Data::Dumper;
use Getopt::Long;

our $OPTIONS = [
	'dump-self',
];
our %OPTIONS_VALUES;


sub new
{
	my $type = shift;
	my $self = {};

	bless $self, $type;

	$self->initialize_status();

	return $self;
}

sub sig_handler
{
	my ($self, $sig) = @_;

	if ($sig eq 'USR1')
	{
		return $self->get_status_report();
	}
}
sub initialize_status
{
	my ($self) = @_;

	my $status = $self->{'status'} = {};
	my $record_counts = $status->{'record_counts'} = {};
	$record_counts->{'read'} = 0;
	$record_counts->{'processed'} = 0;
	$record_counts->{'skipped'} = 0;
	$record_counts->{'errors'} = 0;
}


sub get_status_report
{
	my ($self) = @_;

	my $status_report;
	$status_report = join("\n",
		$self->get_status_record_count_report($self->{status}->{record_counts}),
	);

	return $status_report;

}

sub get_status_record_count_report
{
	my ($self, $record_counts) = @_;

	return join("\n\t", "Record Counts:",
		map { join(":\t", $_, $record_counts->{$_}) } sort keys %$record_counts
	);
}
sub process_options 
{
	my ($self) = @_;

	my $self_options = { %OPTIONS_VALUES };

	GetOptions($self_options, @$OPTIONS)
		or die "Bad options.\n";

	$self->{options} = $self_options;

	if ($self->{options}->{'dump-self'})
	{
		print Dumper($self),$/;
		exit;
	}
}

sub setup
{
	my ($self) = @_;
	$self->{json} = JSON->new()->allow_nonref();
}

sub process_files
{
	my ($self) = @_;

	if ( scalar (@ARGV) )
	{
		prepare_file_handle: foreach my $filename (@ARGV)
		{
			my $fh = IO::File->new("<$filename");
			if (! $fh)
			{
				warn "Unable to open $filename for reading: $!\n";
				next prepare_file_handle;
			}
			
			$self->process_file($fh);
			$fh->close();
		}
	}
	else
	{
		$self->process_file(\*STDIN);
	}

}

sub process_file
{
	my ($self, $fh) = @_;
	
	my $line;
	each_record: while ( defined ($line = <$fh>))
	{
		$self->{status}->{record_counts}->{read}++;
		# print "Line: $line\n";
		my $record;
		eval
		{
			$record = $self->{json}->decode($line);
		};
		if (! $record )
		{
			warn "Unable to json decode: $line\n";
			$self->{status}->{record_counts}->{errors}++;
			next each_record;
		}

		$self->process_record($record);
	}
}

sub process_record
{
	my ($self, $record)  = @_;

	# Increment this if the record was correctly processed:
	$self->{status}->{record_counts}->{processed}++;

	# Or, if the record was skipped, increment this:
	$self->{status}->{record_counts}->{skipped}++;

	my $output;
	$output .=  "Name: " . $record->{name} . ".  ";
	$output .= "Tests: " . join(',', @{$record->{tests}});
	print $output, $/;
}

sub run
{
	my ($self) = @_;
	$self->process_options();
	$self->setup();
	$self->process_files();
}



package main;

my @SIG_HANDLER_OBJECTS = ();

sub sig_handler
{
	my ($sig) = @_;

	# print "Sig: $sig\n";

	my @results;

	foreach my $handler_object ( @SIG_HANDLER_OBJECTS )
	{
		 push @results, $handler_object->sig_handler($sig);
	}

	if ($sig eq 'USR1')
	{
		print STDERR join("\n", @results),$/;
	}
}

my $program = ClassicRecordProcessing::Processor1->new();
$SIG{'USR1'} = \&sig_handler;
push @SIG_HANDLER_OBJECTS, $program;

$program->run();
