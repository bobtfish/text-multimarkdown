use strict;
use warnings;
use Test::More tests => 2;

use_ok('Text::MultiMarkdown');

my $m = Text::MultiMarkdown->new(
    disable_footnotes => 0
);

my $instr = <<MARKDOWN;
This is buggy[^bug].

[^bug]: Use `MYAPP_CONFIG_LOCAL_SUFFIX`.
MARKDOWN

my $expstr = <<OUTPUT;
<p>This is buggy<a class="footnote" href="#bug" id="fbug">1</a>.</p>

<div class="footnotes">
<hr/>

<ol>
<li id="bug">
<p>Use <code>MYAPP_CONFIG_LOCAL_SUFFIX</code>.<a class="reversefootnote" href="#fbug">&#xA0;&#x21A9;</a></p>
</li>
</ol>
</div>
OUTPUT

is($m->markdown($instr) => $expstr, 'underscores in code in footnotes');
