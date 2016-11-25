function logout(btn) {
	var url = getRootPath() + "/account/logoutAction";
	var common = new Common();
	common.callAction(null, url, function(data) {
		if (!data) {
			myAlert("系统或网络异常");
			return;
		}
		switch (data.status) {
		case 1:
			delCookie("nv_account");
			delCookie("nv_password");
			myInfo("登出成功！", function() {
				window.location = getRootPath() + "/login";
			});
			return;
		case 0:
			timeoutHandle();
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
}
