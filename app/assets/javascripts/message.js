$(function(){
	$('#layer_board_area').layerBoard();
})

// <--//動きやアクセス回数を制御する場合は以下のように記述して数値を変える-->
$(document).on('turbolinks:load',function() {
  /*global $*/
  $(function(){
  	$('#layer_board_area').layerBoard({
  		delayTime: 200,
  		// <!--//表示までの待ち時間-->
  		fadeTime : 500,
  		// <!--//表示開始から表示しきるまでの時間-->
  		alpha : 0.8,
  		// <!--//背景レイヤーの透明度-->
  		limitMin : 0,
  		// <!--//何分経過後に再度表示するか/分（0で再表示なし）-->
  		easing: 'linear',
  		// <!--//イージング-->
  		limitCookie : 0	,
  		// <!--//cookie保存期間/日（0で開くたび毎回表示される）-->
  		countCookie : 1000
  		// <!--//何回目のアクセスまで適用するか(cookie保存期間でリセット)-->
  	});
  })
}: