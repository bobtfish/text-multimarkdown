use strict;
use warnings;
use Test::More tests => 2;

use_ok('Text::MultiMarkdown');

my $m = Text::MultiMarkdown->new(
    disable_definition_lists => 0
);

my $instr = <<MARKDOWN;
Apple
:   Pomaceous fruit of plants of the genus Malus in 
    the family Rosaceae.
:   An american computer company.

Orange
:   The fruit of an evergreen tree of the genus Citrus.
MARKDOWN

my $expstr = <<OUTPUT;
<dl>
<dt>Apple</dt>
<dd>
Pomaceous fruit of plants of the genus Malus in 
the family Rosaceae.
</dd>
<dd>
An american computer company.
</dd>

<dt>Orange</dt>
<dd>
The fruit of an evergreen tree of the genus Citrus.
</dd>

</dl>
OUTPUT

is($m->markdown($instr) => $expstr, 'definition lists');
