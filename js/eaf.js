$(document).ready(function() {
    $(".annotation").each(function(idx) {
        var tiers = ["1ort", "2ort", "1meta", "2meta", "META"];
        for (var i = 0; i < tiers.length; i++) {
            var curr_tier = tiers[i];
            if ($(this).hasClass(curr_tier)) $(this).appendTo("#" + curr_tier);
        }
    });
});
