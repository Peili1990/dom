
function submitPrivilege(){
	window.scroll(0,0);
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageB').css({'display' : 'block'});
    $("#container").css({"height":$('#pageB .default').height()+90+"px"});
    setGoback('#pageB');
}

function submitAction(){
	window.scroll(0,0);
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageC').css({'display' : 'block'});
    $("#container").css({"height":$('#pageC .default').height()+90+"px"});
    setGoback('#pageC');
}

function submitVote(){
	window.scroll(0,0);
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageD').css({'display' : 'block'});
    $("#container").css({"height":$('#pageD .default').height()+90>$("html").height()?$('#pageD .default').height()+90+"px":$("html").height() });
    setGoback('#pageD');
}

function submitSpeech(){
	window.scroll(0,0);
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageE').css({'display' : 'block'});
    $("#container").css({"height":$('#pageE .default').height()+120>$("html").height()?$('#pageE .default').height()+120+"px":$("html").height() });
    setGoback('#pageE');
}

function setGoback(page){
	$(".am-header-left").find("i").removeClass("am-icon-home").addClass("am-icon-chevron-left").click(function(){
		$('#pages').css({'-webkit-transform' : 'translate3d(0px, 0px, 0px)' , '-webkit-transition' : '300ms'});
		$(page).css({'display' : 'none'});
		$('#pageA').css({'display' : 'block'});
		$("#container").css({"height":$('#pageA .default').height()+90+"px"});
		$(".am-header-left").find("i").removeClass("am-icon-chevron-left").addClass("am-icon-home");
	})
	
}