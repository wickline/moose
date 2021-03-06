use strict;
use warnings;

use Test::More;
use Test::Fatal;

use Moose::Meta::Class;

$SIG{__WARN__} = sub { die if shift =~ /recurs/ };

TODO:
{
    local $TODO
        = 'Loading Moose::Meta::Class without loading Moose.pm causes weird problems';

    my $meta;
    is( exception {
        $meta = Moose::Meta::Class->create_anon_class(
            superclasses => [ 'Moose::Object', ],
        );
    }, undef, 'Class is created successfully' );
}

done_testing;
