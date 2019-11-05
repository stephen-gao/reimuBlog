$(document).ready(function(){
    $("#tabContainer").load("/manage-main");

    $(".tabs_refresh_page").click(function () {
        loadPage($(this).attr("data"),$(this).attr("name"));
    });

});
function loadPage(path,name) {
    //面包屑导航
    $(".breadcrumb-next").remove();
    if('/manage-main' !== path){
        var names = name.split(",");
        for(var i=0;i<names.length;i++){
            if(i+1 === names.length){
                $("#breadcrumb-path").append('<li class="breadcrumb-next active">'+names[i]+'</li>');
            }else {
                $("#breadcrumb-path").append('<li class="breadcrumb-next"><a data-toggle="tab" href="#" class="tabs_refresh_page" data="'+path+'">'+names[i]+'</a></li>');
            }
        }
    }
    //加载页面
    $("#tabContainer").empty();
    $("#tabContainer").load(path);
}