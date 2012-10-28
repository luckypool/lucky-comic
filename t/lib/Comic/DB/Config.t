use strict;
use warnings;

use Test::More;
use Test::MockObject;

BEGIN {
    use_ok 'Comic::DB::Config';
};

subtest q/constant/ => sub {
    ok Comic::DB::Config::DB_MAIN;
};

done_testing;
