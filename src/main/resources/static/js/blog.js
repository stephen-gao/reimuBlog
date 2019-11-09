$(document).ready(function() {

    // 控制返回顶部按钮的显示和消失
    $(window).scroll(function () {
        if ($(window).scrollTop() >300) {
            $('.back-top').fadeIn(200);
        } else {
            $('.back-top').fadeOut(200);
        }
    })
    // 点击返回顶部按钮，使得页面返回顶部
    $(".back-top").click(function () {
        scrollTo(0, 0);
    });
})