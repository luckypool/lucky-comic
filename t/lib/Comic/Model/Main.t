use strict;
use warnings;

use Test::More;
use Test::MockObject;
use Data::Dumper;

use Comic::Test::DB qw/DB_MAIN/;

BEGIN {
    use_ok 'Comic::Model::Main';
};

subtest q/insert and search/ => sub {
    my $handler = Comic::Model::Main->new(role=>'m');
    ok $handler;
    my $res = $handler->db->insert('main', {
        title => 'hoge',
        author => 'piyo',
        publisher =>'ふが',
    });
    my $select_res = $handler->db->search('main', {
       id => 1
    })->first;
    my @expected_data = (
        id => 1,
        title => 'hoge',
        author => 'piyo',
        publisher =>'ふが',
    );
    my @got_data = map {$_=>$res->{row_data}->{$_}} qw/id title author publisher/;
    my @got_search_data = map {$_=>$select_res->{row_data}->{$_}} qw/id title author publisher/;
    is_deeply \@got_data, \@expected_data;
    is_deeply \@got_search_data, \@expected_data;
};

done_testing;
