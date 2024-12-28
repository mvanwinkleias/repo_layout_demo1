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

sub new { return bless {}; }

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
		# print "Line: $line\n";
		my $record;
		eval
		{
			$record = $self->{json}->decode($line);
		};
		if (! $record )
		{
			warn "Unable to json decode: $line\n";
			next each_record;
		}

		$self->process_record($record);
	}
}

sub process_record
{
	my ($self, $record)  = @_;

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

my $program = ClassicRecordProcessing::Processor1->new();

$program->run();
