$(document).ready(function(){

    $(".tabs_refresh_page").click(function () {
        console.log("add");
        $("#tabContainer").load($(this).attr("data"));
    });

});