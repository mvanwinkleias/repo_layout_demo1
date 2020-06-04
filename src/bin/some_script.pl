#!/usr/bin/perl

use strict;
use warnings;

use lib '/opt/IAS/lib/perl5';

use FindBin qw($RealBin);
use lib "$RealBin/../lib/perl5";

use IAS::HelloRepoLayout;

IAS::HelloRepoLayout::hello();

# We can also do OO easily:

my $app = IAS::HelloRepoLayout->new();
$app->hello();
