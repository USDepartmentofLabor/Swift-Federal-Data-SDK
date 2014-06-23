function isTouchDevice() {
    return "ontouchstart" in window;
}

$(function (){
    var nav = $('.nav-wrapper');
    if (!nav || !nav.length) return;
    var top = nav.offset().top - parseFloat(nav.css('marginTop').replace(/auto/, 0));
    $(window).scroll(function (e) {
        console.log('hey')
        if (isTouchDevice()) {
            var topHeight = $(this).scrollTop();
            nav.css('top', topHeight);
        } 
        // if ($(window).width() > 920) {
        //         var y = $(this).scrollTop();
        //         if (y >= top) {
        //             $('.content').css('margin-top','66px');
        //             nav.addClass('fixed');
        //         } else {
        //             $('.content').css('margin-top','0px');
        //             nav.removeClass('fixed');
        //         }
        // }
    });

    $(window).bind( 'load resize', function () {
        $('body > .navigation').scrollSpy();
    });

    $('a.nav-toggle').click(function(e) {
        e.preventDefault();
        if ($('a.nav-toggle').hasClass('active')) {
            $('a.nav-toggle, .navigation').removeClass('active');
        } else {
            $('a.nav-toggle, .navigation').addClass('active');
        }
    });
});