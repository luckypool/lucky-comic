package Comic::Model::Book::DB::Schema;
use strict;
use warnings;
use DBIx::Skinny::Schema;
use DateTime;
use DateTime::Format::Strptime;
use DateTime::Format::MySQL;

install_table book => schema {
    pk 'id';
    columns qw/id main_id number isbn10 updated_on/;
};

install_inflate_rule '^.+_on$' => callback {
    inflate {
        my $value = shift;
        my $dt = DateTime::Format::Strptime->new(
            pattern   => '%Y-%m-%d %H:%M:%S',
            time_zone => 'Asia/Tokyo',
        )->parse_date($value);
        return DateTime->from_object( object => $dt );
    };
    deflate {
        my $value = shift;
        return DateTime::Format::MySQL->format_date($value);
    };
};

1;

__END__

DROP TABLE if EXISTS book;
CREATE TABLE book (
    id int unsigned auto_increment NOT NULL,
    main_id int unsigned NOT NULL,
    number smallint NOT NULL,
    isbn10 varchar(10) NOT NULL,
    updated_on timestamp NOT NULL,
    PRIMARY KEY (id),
    INDEX idx_main_id (main_id),
    UNIQUE (isbn10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
