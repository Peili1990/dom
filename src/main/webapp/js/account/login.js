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
	var url = "loginAction";
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
			window.location = getRootPath() + "/index";
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