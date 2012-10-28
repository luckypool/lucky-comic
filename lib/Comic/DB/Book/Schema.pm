package Comic::DB::Book::Schema;
use strict;
use warnings;
use DBIx::Skinny::Schema;

install_table book => schema {
    pk 'id';
    columns qw/id main_id number isbn10 updated_on/;
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
