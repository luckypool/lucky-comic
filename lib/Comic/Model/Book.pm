package Comic::Model::Book;
use strict;
use warnings;

use parent qw/Comic::Model/;
use Comic::DB::Config qw/DB_BOOK/;
use Comic::Model::Book::DB;

sub get_master_dbh{
    my $self = shift;
    Comic::Model::Book::DB->new({dsn=>DB_BOOK,username=>'comic_admin'});
}

sub get_slave_dbh{
    my $self = shift;
    Comic::Model::Book::DB->new({dsn=>DB_BOOK,username=>'readonly'});
}

1;
