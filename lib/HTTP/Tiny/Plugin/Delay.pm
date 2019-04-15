package HTTP::Tiny::Plugin::Delay;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::ger;

use Time::HiRes qw(sleep);

sub after_request {
    my ($self, $r) = @_;

    my $secs = $r->{config}{between_request} // 1;
    log_trace "Sleeping %.1f second(s) between HTTP::Tiny request ...", $secs;
    sleep $secs;
    1;
}

1;
# ABSTRACT: Delay/sleep between requests

=for Pod::Coverage .+

=head1 SYNOPSIS

 use HTTP::Tiny::Plugin 'Delay' => {
     between_request => 3, # optional, default 1
 };

 HTTP::Tiny::Plugin->new->get("http://www.example.com/");
 HTTP::Tiny::Plugin->new->get("http://www.example.com/"); # will sleep 3 seconds first


=head1 DESCRIPTION

This plugin inserts C<sleep()> between requests.


=head1 CONFIGURATION

=head2 between_requests

Ufloat. Default: 1.


=head1 SEE ALSO

L<LWP::UserAgent::Plugin::Delay>

L<HTTP::Tiny::Plugin>
