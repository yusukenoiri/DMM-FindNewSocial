/*global $*/
$(document).on('turbolinks:load', function () {
  $(function () {
    $('.js-text_field').on('keyup', function () {
      //  キーボードを入力したタイミングで以下の処理を実行する
      var title = $.trim($(this).val());
      // console.log(title); // 検索窓の値が取れているか確認
      // console.log("キーボードを入力した時に発生");
      $.ajax({
        type: 'GET', // リクエストのタイプ
        url: '/posts/searches', // リクエストを送信するURL
        data:  { title: title }, // サーバーに送信するデータ
        dataType: 'json' // サーバーから返却される型
      })
      .always(function (data) {
        // console.log(data);
        $('.js-posts li').remove();
        $(data).each(function (i, post) {
          $('.js-posts').append('<li class="post"><a href="/posts/' + post.id + '">' + post.title + '</a></li>');
          });
        })
      });
    });
  });