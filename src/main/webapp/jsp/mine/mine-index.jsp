<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="mine-box">
		<img src="http://app.qlogo.cn/mbloghead/e354d099f1137970f9e0/50"
			class="am-comment-avatar"> <span> 小风 </span>
		<p>我是安德安纳，猎人</p>
		<span class="am-icon-chevron-right"></span>
	</div>
	<h3>我的版杀</h3>
	<div class="mine-box" style="border-bottom:1px solid #dddddd">
		查看历史
		<span class="am-icon-chevron-right"></span>
	</div>
	<div class="mine-box">
		查看统计
		<span class="am-icon-chevron-right"></span>
	</div>
	<h3>我的笔记</h3>
	<div class="mine-box" style="border-bottom:1px solid #dddddd">
		版杀笔记
		<span class="am-icon-chevron-right"></span>
	</div>
	<div class="mine-box">
		复盘攻略
		<span class="am-icon-chevron-right"></span>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn"
				value="退出登录" onclick="logout(this)">
		</div>
	</div>
	
	<script type="text/javascript">
	
		function logout(btn){
			$(btn).attr("disabled","disabled");
			var url = getRootPath()+"/logoutAction";
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
					myInfo("登出成功！",function(){
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
	
	</script>	
</div>