$(document).ready(function(){
    $("#tabContainer").load("/manage-main");

    $(".tabs_refresh_page").click(function () {
        //面包屑导航
        $(".breadcrumb-next").remove();
        if('/manage-main' !== $(this).attr("data")){
            var name = $(this).attr("name");
            var names = name.split(",");
            for(var i=0;i<names.length;i++){
                if(i+1 === names.length){
                    $("#breadcrumb-path").append('<li class="breadcrumb-next active">'+names[i]+'</li>');
                }else {
                    $("#breadcrumb-path").append('<li class="breadcrumb-next"><a data-toggle="tab" href="#" class="tabs_refresh_page" data="'+$(this).attr("data")+'">'+names[i]+'</a></li>');
                }
            }
        }
        //加载页面
        $("#tabContainer").empty();
        $("#tabContainer").load($(this).attr("data"));
    });

});