#!/usr/bin/perl

use strict;
use warnings;

package IAS::HelloRepoLayout;

sub hello
{
	print "Hello, IAS Repo!\n"
}
1;

sub new
{
	my $type = shift;
	my $self = {};
	return bless $self, $type;
}

