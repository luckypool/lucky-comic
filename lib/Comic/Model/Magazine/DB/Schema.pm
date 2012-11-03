package Comic::Model::Magazine::DB::Schema;
use strict;
use warnings;
use DBIx::Skinny::Schema;
use DateTime;
use DateTime::Format::Strptime;
use DateTime::Format::MySQL;

install_table magazine => schema {
    pk 'id';
    columns qw/id title author main_id updated_on/;
};

install_utf8_columns qw/tite author/;

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

DROP TABLE if EXISTS magazine;
CREATE TABLE magazine (
    id int unsigned auto_increment NOT NULL,
    title varchar(64) NOT NULL,
    author varchar(64) NOT NULL,
    main_id int unsigned NOT NULL,
    updated_on timestamp NOT NULL,
    PRIMARY KEY (id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

