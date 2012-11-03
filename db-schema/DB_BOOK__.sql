CREATE DATABASE comic_book;
USE comic_book;

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

