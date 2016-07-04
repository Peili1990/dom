$(".am-header-title").find("a").text("新芝加哥日报");

function openAssemble(){
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageB').css({'display' : 'block'});
    $("#container").css({"height":$('#pageB .default').height()+120+"px"});
}