package Comic::DB::Config;
use strict;
use warnings;

use parent qw/Exporter/;

my $constant;

BEGIN {
    $constant = {
        DB_MAIN => 'dbi:mysql:comic_main',
        DB_BOOK => 'dbi:mysql:comic_book',
        DB_MAGAZINE  => 'dbi:mysql:comic_magazine',
        DB_PUBLISHER => 'dbi:mysql:comic_publisher',
    };
};

use constant {
    CONSTANT => $constant,
    map { $_ => $constant->{$_} } keys %$constant,
};

our @EXPORT = keys %{CONSTANT()};
our @EXPORT_OK = keys %{CONSTANT()};

1;
