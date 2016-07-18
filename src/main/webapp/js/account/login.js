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
		$(btn).removeAttr("disabled");
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
			$(btn).removeAttr("disabled");
			return;
		}
		switch (data.status) {
		case 1:
			setCookie("nv_account",account,"d30");
			setCookie("nv_password",password,"d30");
			window.location = getRootPath() + "/index";
			return;
		default:
			myAlert(data.message);
			$(btn).removeAttr("disabled");
			return;
		}
	});
}

function register(){
	window.location = getRootPath() + "/register";
}

$("#loginForm").css({"padding-top":$("body").height()*0.6+"px"});

