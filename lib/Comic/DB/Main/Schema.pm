package Comic::DB::Main::Schema;
use strict;
use warnings;
use DBIx::Skinny::Schema;

install_table main => schema {
    pk 'id';
    columns qw/id title author magazine publisher number updated_on/;
};
install_table reading_title => schema {
    pk 'id';
    columns qw/id title main_id updated_on/;
};
install_table reading_author => schema {
    pk 'id';
    columns qw/id author main_id updated_on/;
};
install_utf8_columns qw/tite author magazine publisher/;
1;

__END__

DROP TABLE if EXISTS main;
CREATE TABLE main (
    id int unsigned auto_increment NOT NULL,
    title varchar(64) NOT NULL,
    author varchar(64) NOT NULL,
    magazine varchar(64),
    publisher varchar(64) NOT NULL,
    number smallint,
    updated_on timestamp NOT NULL,
    PRIMARY KEY (id),
    INDEX idx_title (title(5)),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE if EXISTS readings_title;
CREATE TABLE readings_title (
    id int unsigned auto_increment NOT NULL,
    title varchar(255) NOT NULL,
    main_id int unsigned NOT NULL,
    updated_on timestamp NOT NULL,
    PRIMARY KEY (id),
    INDEX idx_main_id (main_id),
    INDEX idx_title (title(5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE if EXISTS readings_author;
CREATE TABLE readings_author (
    id int unsigned auto_increment NOT NULL,
    author varchar(255) NOT NULL,
    main_id int unsigned NOT NULL,
    updated_on timestamp NOT NULL,
    PRIMARY KEY (id),
    INDEX idx_main_id (main_id),
    INDEX idx_author (author(5)),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

