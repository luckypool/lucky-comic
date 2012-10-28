package Comic::DB::Config;
use strict;
use warnings;

use parent qw/Exporter/;

my $constant;

BEGIN {
    $constant = {
        DB_MAIN_MST => 'dbi:mysql:comic_main',
        DB_MAIN_SLV => 'dbi:mysql:comic_main',
        DB_MAGAZINE_MST => 'dbi:mysql:comic_magazize',
        DB_MAGAZINE_SLV => 'dbi:mysql:comic_magazize',
        DB_PUBLISHER_MST => 'dbi:mysql:comic_publisher',
        DB_PUBLISHER_SLV => 'dbi:mysql:comic_publisher',
        DB_BOOK_MST => 'dbi:mysql:comic_book',
        DB_BOOK_SLV => 'dbi:mysql:comic_book',
    };
};

use constant {
    CONSTANT => $constant,
    map { $_ => $constant->{$_} } keys %$constant,
};

our @EXPRT = keys %{CONSTANT()};
our @EXPRT_OK = keys %{CONSTANT()};

1;
