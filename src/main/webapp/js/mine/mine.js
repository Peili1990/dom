function logout(btn) {
	$(btn).attr("disabled", "disabled");
	var url = getRootPath() + "/logoutAction";
	var common = new Common();
	common.callAction(null, url, function(data) {
		if (!data) {
			myAlert("系统或网络异常");
			$(btn).removeAttr("disabled");
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
			$(btn).removeAttr("disabled");
			return;
		}
	})
}

function photoClipInterfaceInit(headPortraitWrapper,fileInput,photoClipView,photoClipOkBtn){
	$(headPortraitWrapper).click(function() {
		$(fileInput).click();// 显示头像修改菜单（相机和文档），File控件在标准浏览器中是不允许通过代码进行触发的，只能手动点击触发。
	});
	
	var body_width = $(window).width();
	
	var objPhotoClip = new bjj.PhotoClip("#clipArea", {
		size: [260, 260],
		outputSize: [640, 640],
		file: fileInput,
		view: "#view",
		ok: "#clipBtn",
		loadStart: function() {
			console.log("照片读取中");
		},
		loadComplete: function() {
			console.log("照片读取完成");
		},
		clipFinish: function(dataURL) {
			console.log(dataURL);
		}
	});
}