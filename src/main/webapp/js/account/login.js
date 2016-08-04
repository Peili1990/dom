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

$("#loginForm").css({"padding-top":$("body").height()*0.6+"px"});
$(".bg-bottom").css({"height":$("body").width()*0.24+"px"});
$(".bg-top").css({"height":$("body").width()*0.84+"px"});
