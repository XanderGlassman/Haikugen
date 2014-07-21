// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    $(".vote").click(function(event) {
        var that = $(this);
        console.log(that);
        console.log("that is above");
        event.preventDefault();
        console.log("click on button talks to js");
        var count = parseInt($(this).attr("foo")) + 1;

        var url = "poems/vote/" + $(this).attr("id");
        $.ajax({
            url: url,
            type: "POST",
            success: function(result) {
                console.log("The count is " + count)
                console.log("works");
                console.log(result);
                console.log(url);
                $(that).css("display", "none");
                $(that).append(count);
                $(that).next().text(count)
                $("." + $(that).attr("id")).text(count);
            }
        });
    });
});
