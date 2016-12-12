<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="mine-box"> 
		<img src="${picServer}${user.avatar}"
			class="am-comment-avatar"> <span> ${ user.nickname } </span>
		<p id="user-motto">${ user.motto }</p>
		<span class="am-icon-chevron-right mine-arrow" onclick="pageSwitch('#pageA','#pageC',0,1)"></span>
	</div>
	<h3>我的版杀</h3>
	<div class="mine-box" style="border-bottom:1px solid #dddddd">
		查看历史
		<span class="am-icon-chevron-right mine-arrow"></span>
	</div>
	<div class="mine-box">
		查看统计
		<span class="am-icon-chevron-right mine-arrow" onclick="pageSwitch('#pageA','#pageF',0,1,'getPlayerData()')"></span>
	</div>
	<h3>我的私货</h3>
	<div class="mine-box" style="border-bottom:1px solid #dddddd">
		版杀卡片
		<span class="am-icon-chevron-right mine-arrow" onclick="pageSwitch('#pageA','#pageH',0,1,'getUserCardList()')"></span>
	</div>
	<div class="mine-box">
		复盘攻略
		<span class="am-icon-chevron-right mine-arrow" onclick="pageSwitch('#pageA','#pageD',0,1,'getEssayList()')"></span>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn"
				value="退出登录" onclick="logout()">
		</div>
	</div>
	
	<script type="text/javascript">
	
		$(".am-comment-avatar").click(function(){
			$("#file").click();
		})
		$(".christmas-header").click(function(){
			$("#file").click();
		})
	
	</script>	
</div>