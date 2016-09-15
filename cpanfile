requires 'perl', '5.010001';

requires 'Encode';
requires 'File::ShareDir';
requires 'Text::Mecabist', '0.02';

on 'test' => sub {
    requires 'Test::More', '0.98';
};
