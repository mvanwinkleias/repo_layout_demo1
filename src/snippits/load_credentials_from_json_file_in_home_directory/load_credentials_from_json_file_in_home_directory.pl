#!/usr/bin/perl

use strict;
use warnings;

use JSON;
use Data::Dumper;
use Getopt::Long;

my $OPTIONS_VALUES = {
	'ipam-credentials-file' => glob('~/.config/IAS/some-awesome-project/ipam_credentials.json'),
};

my @OPTIONS = (
	'ipam-credentials-file=s'
);

GetOptions(
	$OPTIONS_VALUES,
	@OPTIONS,
)
or die "Bad options.\n";

print Dumper(load_json_file($OPTIONS_VALUES->{'ipam-credentials-file'}));

exit;

sub load_json_file
{
	my ($filename) = @_;
	use IO::File;
	my $fh = IO::File->new($filename)
		or die "Can't open $filename for reading: $!";
	my $contents;
	{
		local $/;
		$contents = <$fh>;
	}
	$fh->close();
	return JSON::decode_json($contents);
}
