$(document).ready(function(){
    var leftnum = 0;
    $("#left").click(function(){
        //跳转到最后一张
        if(leftnum == 0) {
            $("#imgbox").animate({left:leftnum = -3360},700);
        }
        else {
            $("#imgbox").animate({left:leftnum += 840},500);
        }
    });
    $("#right").click(function(){
        if(leftnum == -3360) {
            $("#imgbox").animate({left:leftnum = 0},700);
        }
        else {
            $("#imgbox").animate({left:leftnum = leftnum - 840},500);
        }
    });

    $("#user_menu").hover(function() {
        if($(this).find("li").length > 0){
            $(this).children("ul").slideDown(100)
        }
    },function() {
        $(this).children("ul").slideUp("fast");
    });


});

