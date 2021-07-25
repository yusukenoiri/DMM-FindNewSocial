// 画像skipper機能
/*global $*/
$(document).on('turbolinks:load',function() {
  $(document).ready(function () {
   $("#theTarget").skippr({
    transition : 'fade',
    speed : 500,
    easing : 'easeOutQuart',
    navType : 'bubble',
    childrenElementType : 'div',
    arrows : false,
    autoPlay : true,
    autoPlayDuration : 2000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
 });
});