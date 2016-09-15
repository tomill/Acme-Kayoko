package Acme::Kayoko;
use 5.010001;
use strict;
use warnings;

our $VERSION = "0.01";

use Exporter 'import';
use Encode;
use File::ShareDir qw/dist_file/;
use Text::Mecabist;

our @EXPORT_OK = qw/kayoko/;

sub kayoko {
    my $text = shift || "";
    my $parser = Text::Mecabist->new({
         userdic => dist_file('Acme-Kayoko', Text::Mecabist->encoding->name .'.dic'),
    });

    return $parser->parse($text, sub {
        my $node = shift;
        return if not $node->readable;
        
        my $word = $node->extra1 or return;
        
        if ($node->prev and $node->prev->extra1) {
            $word = ' ' . $word;
        }
        elsif (not $node->prev) {
            $word = ucfirst($word);
        }

        $node->text($word);
    })->stringify();
}

1;
__END__

=encoding utf-8

=head1 NAME

Acme::Kayoko - Kayoko Ann Patterson wants ZARA

=head1 SYNOPSIS

    use Acme::Kayoko qw/kayoko/;

    print kayoko('ここからは私のパーソナルサービス！');
    # => "ここからは私のpersonal service！"

=head1 DESCRIPTION

Acme::Kayoko is ...

L<http://kayoko.koneta.org/>

L<http://connpass.com/event/39794/>

=head1 AUTHOR

Naoki Tomita E<lt>tomita@cpan.orgE<gt>

=head1 LICENSE

Copyright (C) Naoki Tomita.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=for stopwords kayoko

=cut
