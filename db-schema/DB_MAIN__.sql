USE comic_main;

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

