/**
 * 
 */

function submitForm(btn){
	$(btn).attr("disabled","disabled");
	var account = $("#userName").val().trim();
	var password = $("#userPwd").val().trim();
	$("#userPwd").val("");
	if(account==""||password==""){
		myAlert("用户名或密码不能为空");
		$(btn).removeAttr("disabled").blur();
		return false;
	}
	//登陆验证
	var url = "loginAction";
	var options = {
		account : account,
		password : password
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
			setCookie("nv_account",account,"30d");
			setCookie("nv_password",password,"30d");
			window.location = getRootPath() + "/index";
			return;
		case -3:
			myInfo("该邮箱还未验证，点击确定立即验证",function(){
				gotoemail(data.email);
				$(btn).removeAttr("disabled").blur();
			})
			return;
		default:
			myAlert(data.message);
			$(btn).removeAttr("disabled").blur();
			return;
		}
	});
}

function register(){
	window.location = getRootPath() + "/register";
}

function resendEmail(email){
	var url = getRootPath() + "/resendmail";
	var options = {
			email : email
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("邮件发送成功，点击确定立即验证",function(){
				gotoemail(data.email);
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}

$(function(){
	$(".page-container").css({"padding-top":$("body").height()*0.6+"px"});
})
$(".bg-bottom").css({"height":$("body").width()*0.24+"px"});
$(".bg-top").css({"height":$("body").width()*0.84+"px"});
