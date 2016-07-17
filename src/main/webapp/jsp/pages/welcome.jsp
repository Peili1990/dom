<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">你好，${ userInfo.userNickName }！</h2>
			<input id="user-id" type="hidden" value="${ userInfo.userId }">
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
					<span style="float:right">去看看 》</span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="card-body">
					目前你没有参加任何版杀
					<span style="float:right" onclick="pageSwitch('#pageA','#pageF','getApplyingGames()')">去报名 》</span>
					</div>
				</c:otherwise>
			</c:choose>
	</div>
	
	<c:if test="${ userInfo.userCurRole eq 'player' }">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">角色信息</h2>
				<input id="player-id" type="hidden" value="${ userInfo.playerId }">
				<input id="game-id" type="hidden" value="${ userInfo.gameId }">
			</div>
			<div class="card-body">
				外在角色：
				<c:choose>
					<c:when test="${ playerInfo != null && playerInfo.characterId != null }">
						${ playerInfo.characterName }
						<span style="float:right">查看详情 》</span>
					</c:when>
					<c:otherwise>	
						还未选择
						<span style="float:right" onclick="pageSwitch('#pageA','#pageG','getCharacterList(${userInfo.status})')">去选身份 》</span>
					</c:otherwise>
				</c:choose>
				<br>实际身份：
				<c:choose>
					<c:when test="${ playerInfo != null && playerInfo.identity != 0 }">
						${ playerInfo.identity }
						<span style="float:right">查看详情 》</span>
					</c:when>
					<c:otherwise>
						还未发放
					</c:otherwise>
				</c:choose>
			</div>	
		</div>
	</c:if>
	
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">《新芝加哥日报》7月7日日刊</h2>
		</div>
		<div class="card-body">
			<h2 class="card-title">淘金人神秘失踪 小镇人心惶惶</h2>
			维多利亚讯 卡布莱修女被捕以后，人们都以为预告信事件能告一段落，
			然而今天淘金热F.哈代先生的失踪打碎了他们的幻想。哈代先生通常会一大清早就去雄猫酒馆畅饮啤酒，
			然而今天却迟迟没有出现。于是感到疑惑的朋友们前往哈代的木屋察看，排除了哈代睡懒觉的可能。
			由于哈代先生昨天言语如常，没有流露出想要离开小镇的想法，此次失踪便显得尤为蹊跷。
			镇长立刻派出警力对整个小镇进行搜查，却仍未发现哈代的踪迹。惊惶的镇民们自愿地前往法庭，要求镇长提供更加实际有效的安全保护。
			</div>
		<div class="card-footer">查看详情 》</div>
	</div>

	<div class="card">
		<div class="card-header">
			<h2 class="card-title">最新发言</h2>
		</div>
		<div class="card-body">安德安纳：跳警，签为手铐。首日验霍尔是好人，昨日查验被杀手干扰，无反馈。但我把自身的技能砸给了叶妹，反馈为平民/帮众，因此暂时可以不用纠结她了。
			以下为行动安排，拒不执行的视为杀手方：
			伊卡、欧内斯特如未被禁言，请继续给情报。布莱克请给我+1以便夜晚继续验人。赫本请疯我、马克唐、科尔比以及另外你觉得可疑的3人，得到新身份后及时公布。威廉姆斯的身份警方不确定，欢迎各种找他撕逼。
			</div>
		<div class="card-footer">查看更多 》</div>
	</div>

	<div class="group">
		<header class="group-header">请选择操作</header>
		<div class="group-body">
			<input type="button" class="am-btn am-btn-success" value="提交特权" onclick="pageSwitch('#pageA','#pageB')">
			<input type="button" class="am-btn am-btn-secondary" value="提交行动" onclick="pageSwitch('#pageA','#pageC')">
			<input type="button" class="am-btn am-btn-default" value="提交投票" onclick="pageSwitch('#pageA','#pageD')">
			<input type="button" class="am-btn am-btn-danger" value="提交发言" onclick="pageSwitch('#pageA','#pageE')">		
			<input type="button" class="am-btn am-btn-warning" value="身份抽取" onclick="pageSwitch('#pageA','#pageF')">
			<input type="button" class="am-btn am-btn-primary" value="查看特权">
		</div>
	</div>
</div>
