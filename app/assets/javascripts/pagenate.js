/*global $*/
/*global scrollHeight */
/*global scrollPosition */
$(document).on('turbolinks:load',function() {
  $(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
      $('.jscroll').jscroll({
        contentSelector: '.scroll-list',
        nextSelector: 'span.next:last a'
      });
    }
  });
});