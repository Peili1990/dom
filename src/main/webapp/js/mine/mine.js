function logout(btn) {
	var url = getRootPath() + "/account/logoutAction";
	var common = new Common();
	common.callAction(null, url, function(data) {
		delCookie("nv_account");
		delCookie("nv_password");
		myInfo("登出成功！", function() {
			window.location = getRootPath() + "/login";
		});
	})
}
