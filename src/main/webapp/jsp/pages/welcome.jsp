<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">你好，${ userInfo.userNickName }！</h2>
		</div>
			<c:choose>
				<c:when test="${ userInfo.userCurRole eq 'judger' }">
					<div class="card-body">
					目前你正在主持${ userInfo.gameDesc }
					<span style="float:right">去看看 》</span>
					</div>
				</c:when>
				<c:when test="${ userInfo.userCurRole eq 'player' }">
					<div class="card-body">
					目前你正在参加${ userInfo.gameDesc }
					<a href="${ baseUrl}assemble"><span style="float:right">去看看 <span class="am-icon-chevron-right"></span></span></a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="card-body">
					目前你没有参加任何版杀
					<span style="float:right" onclick="pageSwitch('#pageA','#pageF','getApplyingGames()')">去报名 <span class="am-icon-chevron-right"></span></span>
					</div>
				</c:otherwise>
			</c:choose>
	</div>
	
	<c:if test="${ userInfo.userCurRole eq 'player' }">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">角色信息</h2>
			</div>
			<div class="card-body">
				外在角色：
				<c:choose>
					<c:when test="${ playerInfo != null && playerInfo.characterId != null }">
						<c:if test="${ playerInfo.isSp == 1 }">
						sp
						</c:if>
						${playerInfo.characterName }
						<c:choose>
							<c:when test="${ playerInfo.camp == 1 }">
								<img src="${picServer}${playerInfo.characterAvatar}"
								class="am-comment-avatar character-avatar">
							</c:when>
							<c:otherwise>
								<img src="${picServer}${playerInfo.characterKillerAvatar}"
								class="am-comment-avatar character-avatar">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>	
						还未选择
						<span style="float:right" onclick="pageSwitch('#pageA','#pageG','getCharacterList(${userInfo.status})')">去选身份  <span class="am-icon-chevron-right"></span></span>
					</c:otherwise>
				</c:choose>
				<br>实际身份：
				<c:choose>
					<c:when test="${ playerInfo != null && playerInfo.sign != 0 }">
						${ playerInfo.identityDesc }
						<img src="${picServer}${ playerInfo.signAvatar }" class="am-comment-avatar sign-avatar">
					</c:when>
					<c:otherwise>
						还未发放
					</c:otherwise>
				</c:choose>
			</div>	
		</div>
		<c:if test="${ userInfo.gameStatus >= 3 && userInfo.gameStatus <= 4 }">
			<div class="group">
				<div class="group-body">
					<input type="button" class="am-btn am-btn-primary" value="提交操作"
						style="width: 100%" onclick="pageSwitch('#pageA','#pageB','getOpreation()')">
				</div>
			</div>
		</c:if>
	</c:if>
	
	<c:if test="${newspaper!=null }">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">《新芝加哥日报》${newspaper.header}</h2>
		</div>
		<div class="card-body">
			<h2 class="card-title">${newspaper.headline}</h2>
			${newspaper.headlineBody}
			</div>
		<div class="card-footer" ><a href="${baseUrl}assemble?newspaperId=${newspaper.newspaperId}">查看详情  <span class="am-icon-chevron-right"></span></a></div>
	</div>
	</c:if>
	
	<c:if test="${speech!=null }">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">最新发言</h2>
		</div>
		<div class="card-body">
			<c:choose>
			<c:when test="${speech.type == 1}">
				${speech.characterName }：${speech.content }
			</c:when>
			<c:otherwise>
				${speech.content }
			</c:otherwise>
			</c:choose>
		</div>
		<div class="card-footer"><a href="${baseUrl}assemble?newspaperId=${speech.newspaperId}&scroll=true">查看更多  <span class="am-icon-chevron-right"></span></a></div>
	</div>
	</c:if>

	
</div>
