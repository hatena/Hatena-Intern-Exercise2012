### 課題1-1
以下のような機能をもつ、テンプレートエンジンをPerlを用いて実装してください。

templates/main.html

    <html>
      <head>
       <title>{% title %}</title>
      </head>
      <body>
        <p>{% content %}</p>
      </body>
    </html>

main.pl

    use strict;
    use warnings;
    use TemplateEngine;

    my $template = TemplateEngine->new( file => ‘templates/main.html’ );

    print $template->render({
      title   => ‘タイトル’,
      content => ‘これはコンテンツです',
    }); 

実行結果

    $ perl main.pl
    <html>
      <head>
       <title>タイトル</title>
      </head>
      <body>
        <p>これはコンテンツです</p>
      </body>
    </html>
    $ perl main.pl > output.html

output.htmlを適当なWebブラウザで開いて正しく表示されることを確認してください。

実装に際しては、以下の条件を守ってください。

- 変数の置き換えが出来る
- HTMLのエスケープが適切になされる
- TemplateToolkit や XSlateなどの既存のテンプレートエンジンを利用しない

また、後述するリポジトリに含まれているテストを実行して、課題が正しく動作していることを確認してください。

### 課題1-2 (オプション)

課題1-1で作ったテンプレートエンジンの機能を拡張してみてください。機能を拡張した部分についてはt/template.t にテストを追加してください。具体的な機能については、既存のテンプレートエンジンを参考にしてください。

### 課題2-1

課題1-1と同じような機能をもつ、テンプレートエンジンをJavaScriptを用いて実装してください。

2-1.html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <script src="template.js"></script>
        <script src="2-1.js"></script>
        <body>
          <script id="template" type="text/x-template">
            <div>
              <h2>{% title %}</h2>
              <p>{% content %}</p>
            </div>
          </script>
          <h1>日記</h1>
          <div id="result">
            ここに結果が出力される
          </div>
        </body>
    </html>

2-1.js

    var main = function() {
    
        var source = document.getElementById('template').innerHTML;
        var template = new Template({
            source: source
        });
    
        document.getElementById('result').innerHTML = template.render({
            title: '6月25日の日記',
            content: 'ランチを食べすぎました'
        });
    };
    
    document.addEventListener('DOMContentLoaded', main);

template.js

    var Template = function(input) {
        // この関数を実装してください
    };
    
    Template.prototype = {
        render: function(variables) {
            // この関数を実装してください
        }
    };

template.jsにTemplateクラスを実装して、Webブラウザで2-1.htmlを開き、以下の正しい実行結果が表示されることを確認してください。

<img src="http://cdn-ak.f.st-hatena.com/images/fotolife/h/hitode909/20120709/20120709195437.png" />

正しい実行結果


実装に関しては、以下の条件を守ってください。

* 変数の置き換えが出来る
* HTMLの適切なエスケープなどを意識する
* jQuery などの既存のJavaScriptライブラリを利用しない


### 課題2-2(オプション)

課題2-1で作ったテンプレートエンジンを何か発展させてみてくさい。

たとえば機能を追加する、テンプレートエンジンを使ったアプリケーションを実装する、といったことが考えられます。
