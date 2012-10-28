package Comic::DB::Magazine::Schema;
use strict;
use warnings;
use DBIx::Skinny::Schema;

install_table magazine => schema {
    pk 'id';
    columns qw/id title author main_id updated_on/;
};
install_utf8_columns qw/tite author/;
1;

__END__

DROP TABLE if EXISTS magazine;
CREATE TABLE magazine (
    id int unsigned auto_increment NOT NULL,
    title varchar(64) NOT NULL,
    author varchar(64) NOT NULL,
    main_id int unsigned NOT NULL,
    updated_on timestamp NOT NULL,
    PRIMARY KEY (id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

