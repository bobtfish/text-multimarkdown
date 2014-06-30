use strict;
use warnings;
use Test::More tests => 2;

use_ok( 'Text::MultiMarkdown');

my $instr = <<TXT;
A trivial block[^block] of text with footnote containing self_url.

[^block]:  See http://example.com

TXT

my $m = Text::MultiMarkdown->new(
    self_url => 'self_url.html',
);
my $outstr = <<TXT;
<p>A trivial block<a href="self_url.html#fn:block" id="fnref:block" class="footnote">1</a> of text with footnote containing self_url.</p>

<div class="footnotes">
<hr />
<ol>

<li id="fn:block"><p>See http://example.com<a href="self_url.html#fnref:block" class="reversefootnote">&#160;&#8617;</a></p></li>

</ol>
</div>
TXT

is(
    $m->markdown($instr) => $outstr,
    'Markdown with self_url footnotes'
);
