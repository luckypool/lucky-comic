use strict;
use warnings;

use Test::More;
use Test::MockObject;
use Data::Dumper;

use Comic::Test::DB qw/DB_BOOK/;

BEGIN {
    use_ok 'Comic::Model::Book';
};

subtest q/insert and search/ => sub {
    my $handler = Comic::Model::Book->new(role=>'m');
    ok $handler;
    my $res = $handler->db->insert('book', {
        main_id => 1,
        number  => 1,
        isbn10  => '1234567890',
    });
    my $select_res = $handler->db->search('book', {
       id => 1
    })->first;
    my @expected_data = (
        id      => 1,
        main_id => 1,
        number  => 1,
        isbn10  => '1234567890',
    );
    my @got_data = map {$_=>$res->{row_data}->{$_}} qw/id main_id number isbn10/;
    my @got_search_data = map {$_=>$select_res->{row_data}->{$_}} qw/id main_id number isbn10/;
    is_deeply \@got_data, \@expected_data;
    is_deeply \@got_search_data, \@expected_data;
};

done_testing;
