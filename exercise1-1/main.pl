use strict;
use warnings;
use utf8;
use FindBin::libs;

use TemplateEngine;

my $template = TemplateEngine->new( file => 'templates/main.html' );

print $template->render({
  title   => 'タイトル',
  content => 'これはコンテンツです',
}); 
