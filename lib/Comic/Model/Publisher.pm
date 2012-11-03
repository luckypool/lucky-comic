package Comic::Model::Publisher;
use strict;
use warnings;

use parent qw/Comic::Model/;
use Comic::DB::Config qw/DB_PUBLISHER/;
use Comic::Model::Publisher::DB;
use Comic::Model::Publisher::DB::Schema;

sub get_master_dbh{
    my $self = shift;
    Comic::Model::Publisher::DB->new({dsn=>DB_PUBLISHER,username=>'comic_admin'});
}

sub get_slave_dbh{
    my $self = shift;
    Comic::Model::Publisher::DB->new({dsn=>DB_PUBLISHER,username=>'readonly'});
}

1;
