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
<p>This is buggy<a href="#fn:bug" id="fnref:bug" class="footnote">1</a>.</p>

<div class="footnotes">
<hr />
<ol>

<li id="fn:bug"><p>Use <code>MYAPP_CONFIG_LOCAL_SUFFIX</code>.<a href="#fnref:bug" class="reversefootnote">&#160;&#8617;</a></p></li>

</ol>
</div>
OUTPUT

is($m->markdown($instr) => $expstr, 'underscores in code in footnotes');
