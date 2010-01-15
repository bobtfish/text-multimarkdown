use strict;
use warnings;
use FindBin qw($Bin);
use Test::More tests => 2;
use Test::Exception;

my $filename = "$Bin/Text-MultiMarkdown.mdtest/Markdown_Documentation_-_Syntax";
unshift(@ARGV, "$filename.text");
open my $file, '<', "$filename.xhtml" or die "Couldn't open $filename: $!";
my $expected = do {local $/ = undef; <$file>};

lives_ok {
    require "$Bin/../script/MultiMarkdown.pl";
} 'require MultiMarkdown.pl works';
my $out = main();
is($out, $expected, 'MultiMarkdown.pl does the right thing with the syntax guide');
