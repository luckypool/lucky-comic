CREATE DATABASE comic_magazine;
USE comic_magazine;

DROP TABLE if EXISTS magazine;
CREATE TABLE magazine (
    id int unsigned auto_increment NOT NULL,
    title varchar(64) NOT NULL,
    author varchar(64) NOT NULL,
    main_id int unsigned NOT NULL,
    updated_on timestamp NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

