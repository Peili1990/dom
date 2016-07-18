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
	$("#userPwd").val("");
	if(account==""||password==""){
		myAlert("用户名或密码不能为空");
		$(btn).removeAttr("disabled");
		return false;
	}
	//注册
	var url = "registerAction";
	var options = {
		account : account,
		password : password,
		nickname : nickname
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
			myInfo("恭喜，注册成功！",function(){
				window.location = getRootPath() + "/login";
			});
			return;
		default:
			myAlert(data.message);
			$(btn).removeAttr("disabled");
			return;
		}
	});
}

$("#registerForm").css({"padding-top":$("body").height()*0.6+"px"});

