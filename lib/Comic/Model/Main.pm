package Comic::Model::Main;
use strict;
use warnings;

use parent qw/Comic::Model/;
use Comic::DB::Config qw/DB_MAIN/;
use Comic::Model::Main::DB;
use Comic::Model::Main::DB::Schema;

sub get_master_dbh{
    my $self = shift;
    Comic::Model::Main::DB->new({dsn=>DB_MAIN,username=>'comic_admin'});
}

sub get_slave_dbh{
    my $self = shift;
    Comic::Model::Main::DB->new({dsn=>DB_MAIN,username=>'readonly'});
}

1;
