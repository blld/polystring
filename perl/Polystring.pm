
package Polystring;

use strict;
use warnings;

our $identifier = "en_US";

sub new {
	my ($class, $args) = @_;
	my $self = bless { raw => $args }, $class;
}

sub raw {
	my $self = shift;
	return $self->{ raw };
}

use overload '""' => sub { $_[0]->locale };

sub locale {
	my $self = shift;
	return $self->to($identifier);
}

sub to {
	my ($self, $target) = @_;
	my $text = $self->{ raw };
	
	for (;;) {
		my $separator = index($text, "\\");
		if ($separator < 0) {
			return $text;
		}
		
		my $end = index($text, "\0");
		if (substr($text, 0, $separator) eq substr($target, 0, $separator)) {
			return substr($text, $separator + 1, $end - $separator - 1);
		}
		
		$text = substr($text, $end + 1);
		while (substr($text, 0, 1) eq " ") {
			$text = substr($text, 1);
		}
	}
}

1;
