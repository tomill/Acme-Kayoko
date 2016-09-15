use strict;
use warnings;
use utf8;
use Test::More;

use Acme::Kayoko qw/kayoko/;

is(kayoko('至急総理にミーティングよろしく'), '至急総理にmeetingよろしく');
is(kayoko('ここからは私のパーソナルサービス！'), 'ここからは私のpersonal service！');
is(kayoko('ゴジラと命名された。'), 'Godzillaと命名された。');

done_testing();
