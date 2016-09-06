<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="mine-box"> 
		<img src="${picServer}${user.avatar}"
			class="am-comment-avatar"> <span> ${ user.nickname } </span>
		<p id="user-motto">${ user.motto }</p>
		<span class="am-icon-chevron-right" onclick="pageSwitch('#pageA','#pageC')"></span>
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
	
		$(".am-comment-avatar").click(function(){
			$("#file").click();
		})
	
	</script>	
</div>