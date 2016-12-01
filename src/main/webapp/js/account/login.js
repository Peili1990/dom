/**
 * 
 */

function submitForm(){
	var account = $("#userName").val().trim();
	var password = $("#userPwd").val().trim();
	$("#userPwd").val("");
	if(account==""||password==""){
		myAlert("用户名或密码不能为空");
		return false;
	}
	//登陆验证
	var url = "account/loginAction";
	var options = {
		account : account,
		password : password
	};
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			myAlert("系统或网络异常");
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
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	});
}

function register(){
	window.location = getRootPath() + "/register";
}

function login(){
	window.location = getRootPath() + "/login";
}

$(function(){
	$(".page-container").css({"padding-top":$("body").height()*0.6+"px"});
})
$(".bg-bottom").css({"height":$("body").width()*0.24+"px"});
$(".bg-top").css({"height":$("body").width()*0.84+"px"});

function forgetpassword(){
	var url = "account/forgetpassword";
	var email = $("input[name='header']").val().trim();
	if(email==""){
		myAlert("邮箱地址不能为空！");
		return;
	}
	if(!email.isEmail()){
		myAlert("请填写正确的邮箱地址！");
		return;
	}
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
			myInfo("重置密码邮件已发送，点击前往验证",function(){
				gotoemail(data.email);
			});
			return;
		default:
			myAlert(data.message);
		}
	})
}

function resetPassword(){
	var account = $("#userName").val().trim();
	var password = $("#userPwd").val().trim();
	$("#userPwd").val("");
	if(account==""||password==""){
		myAlert("用户名或新密码不能为空");
		return false;
	}
	//登陆验证
	var url = "account/pwdResetAction";
	var options = {
		account : account,
		newPassword : password
	};
	var common = new Common();
	common.callAction(options, url, function(data) {
		if (!data) {
			myAlert("系统或网络异常");
			return;
		}
		switch (data.status) {
		case 1:
			myInfo("密码重置成功，请登录！",function(){
				window.location = getRootPath() + "/index";
			})
			return;
		default:
			myAlert(data.message);
			return;
		}
	});
}

