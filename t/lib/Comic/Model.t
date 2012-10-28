use strict;
use warnings;

use Test::More;
use Test::MockObject;

use Comic::DB::Config qw/DB_MAIN/;

BEGIN {
    use_ok 'Comic::Model';
};

subtest q/new ok/ => sub {
    my $db = Comic::Model->new(db_config=>DB_MAIN);
    ok $db;
};

done_testing;
