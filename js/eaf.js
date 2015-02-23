$(document).ready(function() {
    var full_width = $(document).width();
    $(".tier").css("width", full_width + "px");

    $(window).scroll(function() {
        $(".label").css({
            'left': $(this).scrollLeft()
        });
    });

    // start playing sound at corresponding position when annotation is clicked
    $(".annotation").click(function() {
        document.getElementById("wav").currentTime = parseInt($(this).attr("start") / 1000);
        document.getElementById("wav").play();
    });
});
