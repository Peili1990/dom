
function submitPrivilege(){
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageB').css({'display' : 'block'});
    $("#container").css({"height":$('#pageB .default').height()+90+"px"});
}

function submitAction(){
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageC').css({'display' : 'block'});
    $("#container").css({"height":$('#pageC .default').height()+90+"px"});
}