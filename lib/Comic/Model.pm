package Comic::Model;
use strict;
use warnings;

use parent qw/Class::Accessor::Fast/;

use Comic::DB;
use Params::Validate;

__PACKAGE__->mk_accessors(qw/mastere slave/);

sub new {
    my $class = shift;
    my $params = Params::Validate::validate(@_,{
        db_config => 1,
    });
    my $self = {
        master => Comic::DB->new({
            dsn => $params->{db_config},
            username => 'comic_admin',
        }),
        slave => Comic::DB->new({
            dsn => $params->{db_config},
            username => 'readonly',
        }),
    };
    return bless $self, $class;
}

1;
