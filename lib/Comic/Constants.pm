package Comic::Constants;
use strict;
use warnings;

use parent qw/Exporter/;

my $constant;

BEGIN {
    $constant = {
        PUBLISHER_OF => {
            'SHUEISHA'       => '集英社',
            'KODANSHA'       => '講談社',
            'SHOGAKUKAN'     => '小学館',
            'AKITASHOTEN'    => '秋田書店',
            'HAKUSENSHA'     => '白泉社',
            'KADOKAWASHOTEN' => '角川書店',
            'FUTABASHA'      => '双葉社',
            'NIHONBUNGEISHA' => '日本文芸社',
            'TAKESHOBO'      => '竹書房',
            'SQUARE-ENIX'    => 'スクウェア・エニックス',
            'ICHIJINSHA'     => '一迅社',
            'OHZORA'         => '宙出版',
            'SHONENGAHO'     => '少年画報社',
            'ENTERBRAIN'     => 'エンターブレイン',
            'SHINSHOKAN'     => '新書館',
            'GENTOSHA'       => '幻冬舎',
            'HOBUNSHA'       => '芳文社',
            'LIBRE'          => 'リブレ出版',
            'FUJIMISHOBO'    => '富士見書房',
            'ASCIIMW'        => 'メディアワークス',
            'LEED'           => 'リイド社',
            'SHINCHOSHA'     => '新潮社',
            'TOKUMA'         => '徳間書店',
            'J-N'            => '実業之日本社',
            'MAG-GARDEN'     => 'マッグガーデン',
            'BYAKUYA-SHOBO'  => '白夜書房',
        },
    };
};

use constant {
    CONSTANT => $constant,
    map { $_ => $constant->{$_} } keys %$constant,
};

our @EXPORT_OK = keys %{CONSTANT()};

1;
