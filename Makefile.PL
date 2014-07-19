# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name            'Text-MultiMarkdown';
author          'Tomas Doran <bobtfish@bobtfish.net>';
license         'bsd';
all_from        'lib/Text/MultiMarkdown.pm';
resources repository => 'http://github.com/bobtfish/text-multimarkdown/';
resources bugtracker => 'http://github.com/bobtfish/text-multimarkdown/issues';

# Specific dependencies
perl_version    '5.008';
requires        'Digest::MD5'     => undef;
requires        'Text::Markdown'  => '1.0.26';
requires        'Encode'          => undef;
requires        'HTML::Entities'  => undef;
build_requires  'Test::More'      => '0.42';
build_requires  'Test::Exception' => undef;
build_requires  'List::MoreUtils' => undef;
build_requires  'FindBin'         => undef;

if ($Module::Install::AUTHOR) {
    system("pod2text lib/Text/MultiMarkdown.pm > README")
        and die $!;
}

install_script 'script/MultiMarkdown.pl';

WriteAll;
