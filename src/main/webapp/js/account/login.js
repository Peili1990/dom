/**
 * 
 */

function submitForm(){
	var account = $("#userName").val().trim();
	var password = $("#userPwd").val().trim();
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; //邮箱验证正则表达式
	$("#userPwd").val("");
	if(account==""||password==""){
		myAlert("用户名或密码不能为空");
		return false;
	}
	//登陆验证
	var url = "loginAction.do";
	var options = {
		account : account,
		password : password,
		checkcode : checkcode,
		backUrl : getRootPath()
	};
	var common = new Common();
	common.callAction(options, url, function(data) {
		changeCheckcode();
		if (!data) {
			$("#errorMsg").css("display","block");
			$("#errorMsg").text("系统异常");
			return;
		}
		switch (data.status) {
		case 1:
			var backUrl = data.backUrl;
			backUrl = (backUrl == null || backUrl.length == 0) ? getRootPath() + "/index" : backUrl;
			window.location = backUrl;
			return;
		default:
			$("#errorMsg").css("display","block");
			$("#errorMsg").text(data.message);
			return;
		}
	});
}