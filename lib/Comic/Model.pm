package Comic::Model;
use strict;
use warnings;

use Params::Validate;

use parent qw/Class::Accessor::Fast/;
__PACKAGE__->mk_accessors(qw/db/);

sub new {
    my $class = shift;
    my $params = Params::Validate::validate(@_,{
        role => {
            type => Params::Validate::SCALAR,
            regex => qr/^(m|s)$/,
        },
    });
    my $db = $params->{role} eq 'm'
             ? $class->get_master_dbh()
             : $class->get_slave_dbh();
    my $self = {
        db => $db,
    };
    return bless $self, $class;
}

sub get_master_dbh { die qw/over ride me/; }
sub get_slave_dbh { die qw/over ride me/; }

1;
