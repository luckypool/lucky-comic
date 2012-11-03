use strict;
use warnings;

use Test::More;
use Test::MockObject;
use Data::Dumper;

use Comic::Test::DB qw/DB_MAGAZINE/;

BEGIN {
    use_ok 'Comic::Model::Magazine';
};

subtest q/insert and search/ => sub {
    my $handler = Comic::Model::Magazine->new(role=>'m');
    ok $handler;
    my $res = $handler->db->insert('magazine', {
        main_id => 1,
        title   => 'title dummy',
        author  => 'ダミーauthor',
    });
    my $select_res = $handler->db->search('magazine', {
       id => 1
    })->first;
    my @expected_data = (
        id      => 1,
        main_id => 1,
        title   => 'title dummy',
        author  => 'ダミーauthor',
    );
    my @got_data = map {$_=>$res->{row_data}->{$_}} qw/id main_id title author/;
    my @got_search_data = map {$_=>$select_res->{row_data}->{$_}} qw/id main_id title author/;
    is_deeply \@got_data, \@expected_data;
    is_deeply \@got_search_data, \@expected_data;
};

done_testing;
