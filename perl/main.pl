#!/usr/bin/perl

use strict;
use warnings;
use Polystring;

if ($ENV{ LANG }) {
	$Polystring::identifier = $ENV{ LANG };
}

# Usage

my $greetings = Polystring->new("fr\\Bonjour\0  it\\Ciao\0  Hello");

print $greetings, " -- ", $Polystring::identifier, "\n";
print $greetings->to("fr"), "\n";
print $greetings->to("it"), "\n";
print $greetings->to("en"), "\n";

print "raw: ", $greetings->raw, "\n";
