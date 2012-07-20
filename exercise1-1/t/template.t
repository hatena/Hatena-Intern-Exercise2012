use strict;
use warnings;

use Test::More;
use FindBin::libs;

use_ok 'TemplateEngine';

my $template = TemplateEngine->new( file => '../templates/main.html' );
isa_ok $template, 'TemplateEngine';

my $expected = <<'HTML';
<html>
  <head>
    <title>タイトル</title>
  </head>
  <body>
    <p>これはコンテンツです。&amp;&lt;&gt;&quot;</p>
  </body>
</html>

HTML

chomp $expected;

cmp_ok $template->render({
    title   => 'タイトル',
    content => 'これはコンテンツです。&<>"',
}), 'eq', $expected; 

done_testing();
