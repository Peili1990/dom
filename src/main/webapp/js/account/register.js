/**
 * 
 */

function login(){
	window.location = getRootPath() + "/login";
}

function register(btn){
	$(btn).attr("disabled","disabled");
	var account = $("#userName").val().trim();
	var password = $("#userPwd").val().trim();
	var nickname = $("#nickName").val().trim();
	var invitecode = $("#invCode").val().trim();
	$("#userPwd").val("");
	if(account==""){
		myAlert("邮箱不能为空");
		$(btn).removeAttr("disabled").blur();
		return false;
	}
	if(password==""){
		myAlert("密码不能为空");
		$(btn).removeAttr("disabled").blur();
		return false;
	}
	if(nickname==""){
		myAlert("昵称不能为空");
		$(btn).removeAttr("disabled").blur();
		return false;
	}
	//注册
	var url = "registerAction";
	var options = {
		account : account,
		password : password,
		nickname : nickname,
		invitecode : invitecode
	};
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			myAlert("系统或网络异常");
			$(btn).removeAttr("disabled").blur();
			return;
		}
		switch (data.status) {
		case 1:
			myInfo("恭喜，注册成功！",function(){
				window.location = getRootPath() + "/login";
			});
			return;
		default:
			myAlert(data.message);
			$(btn).removeAttr("disabled").blur();
			gotoStepOne();
			return;
		}
	});
}
$(function(){
	$(".page-container").css({"padding-top":$("body").height()*0.6+"px"});
})
$(".bg-bottom").css({"height":$("body").width()*0.24+"px"});
$(".bg-top").css({"height":$("body").width()*0.84+"px"});

function gotoStepTwo(){
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageA').css({'display' : 'none'});
	$('#pageB').css({'display' : 'block'});
	$(".page-container").css({"padding-top":$("body").height()*0.6+25+"px"});
}

function gotoStepOne(){
	$('#pages').css({'-webkit-transform' : 'translate3d(0px, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$('#pageB').css({'display' : 'none'});
	$('#pageA').css({'display' : 'block'});
	$(".page-container").css({"padding-top":$("body").height()*0.6+25+"px"});
}


