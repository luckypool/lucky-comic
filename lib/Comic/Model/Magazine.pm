package Comic::Model::Magazine;
use strict;
use warnings;

use parent qw/Comic::Model/;
use Comic::DB::Config qw/DB_MAGAZINE/;
use Comic::Model::Magazine::DB;
use Comic::Model::Magazine::DB::Schema;

sub get_master_dbh{
    my $self = shift;
    Comic::Model::Magazine::DB->new({dsn=>DB_MAGAZINE,username=>'comic_admin'});
}

sub get_slave_dbh{
    my $self = shift;
    Comic::Model::Magazine::DB->new({dsn=>DB_MAGAZINE,username=>'readonly'});
}

1;
