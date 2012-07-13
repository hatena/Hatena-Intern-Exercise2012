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