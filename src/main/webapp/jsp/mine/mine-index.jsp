<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="default">
	<div class="mine-box"> 
		<img src="${picServer}${user.avatar}"
			class="am-comment-avatar"> <span> ${ user.nickname } </span>
			<div id="equiped-badges">
				<c:if test="${user.badge != null && not empty user.badge}">
				<c:set value="${ fn:split(user.badge, ',') }" var="badges" />
					<c:forEach items="${ badges }" var="badge">
					<img src="${picServer}badgeAvatar/${badge }.png" class="user-badge">
				</c:forEach>
				</c:if>
			</div>
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
	<div class="mine-box" style="border-bottom:1px solid #dddddd">
		版杀徽章
		<span class="am-icon-chevron-right mine-arrow" onclick="pageSwitch('#pageA','#pageI',0,1,'getAllBadge()')"></span>
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
	
	</script>	
</div>