$(document).ready(function() {
    var full_width = $(document).width();
    $(".tier").css("width", full_width + "px");

    $(window).scroll(function() {
        $(".label").css({
            'left': $(this).scrollLeft()
        });
    });

    // the following is needed (?) by Firefox -- seeking doesn't work on a
    // sound that hasn't been played yet (InvalidStateError)
    document.getElementById("wav").play();
    document.getElementById("wav").pause();

    // start playing sound at corresponding position when annotation is clicked
    $(".annotation").click(function() {
        document.getElementById("wav").currentTime = parseInt($(this).attr("start") / 1000);
        document.getElementById("wav").play();
    });
});
