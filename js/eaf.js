$(document).ready(function() {
    var full_width = $(document).width();
    $(".tier").css("width", full_width + "px");

    $(window).scroll(function() {
        $(".label").css({
            'left': $(this).scrollLeft()
        });
    });
});
