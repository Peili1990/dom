<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="default">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">你好，${ userInfo.userNickName }！</h2>
		</div>
			<c:choose>
				<c:when test="${ userInfo.userCurRole eq 'judger' }">
					<div class="card-body">
					你正在主持${ userInfo.gameDesc }
					<c:choose>
						<c:when test="${ userInfo.gameStatus == 1 }">
							<span style="float:right" onclick="pageSwitch('#pageA','#pageF',0,1,'getApplyingGames()')">报名进展 <span class="am-icon-chevron-right"></span></span>
						</c:when>
						<c:otherwise>
							<a href="${ baseUrl}assemble"><span style="float:right">去看看 <span class="am-icon-chevron-right"></span></span></a>
						</c:otherwise>				
					</c:choose>
					</div>
				</c:when>
				<c:when test="${ userInfo.userCurRole eq 'player' }">
					<div class="card-body">
					你正在参加${ userInfo.gameDesc }
					<c:choose>
						<c:when test="${ userInfo.gameStatus == 1 }">
							<span style="float:right" onclick="pageSwitch('#pageA','#pageF',0,1,'getApplyingGames()')">报名进展 <span class="am-icon-chevron-right"></span></span>
						</c:when>
						<c:otherwise>
							<a href="${ baseUrl}assemble"><span style="float:right">去看看 <span class="am-icon-chevron-right"></span></span></a>
						</c:otherwise>				
					</c:choose>
					</div>
				</c:when>
				<c:otherwise>
					<div class="card-body">
					你没有参加任何版杀
					<span style="float:right" onclick="pageSwitch('#pageA','#pageF',0,1,'getApplyingGames()')">去报名 <span class="am-icon-chevron-right"></span></span>
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
						<c:if test="${ playerInfo.signAvatar == null }">
							<span style="float:right;margin-left:-48px" onclick="pageSwitch('#pageA','#pageG',0,1,'getCharacterList(${userInfo.status})')">修改  <span class="am-icon-chevron-right"></span></span>
						</c:if>
						<c:choose>
							<c:when test="${ playerInfo.camp == 2 }">
								<img src="${picServer}${playerInfo.characterKillerAvatar}"
								class="am-comment-avatar character-avatar">
							</c:when>
							<c:otherwise>
								<img src="${picServer}${playerInfo.characterAvatar}"
								class="am-comment-avatar character-avatar">
							</c:otherwise>
						</c:choose>										
					</c:when>
					<c:otherwise>	
						还未选择
						<span style="float:right" onclick="pageSwitch('#pageA','#pageG',0,1,'getCharacterList(${userInfo.status})')">去选身份  <span class="am-icon-chevron-right"></span></span>
					</c:otherwise>
				</c:choose>
				<br>实际身份：
				<c:choose>
					<c:when test="${ playerInfo != null && playerInfo.sign != null && playerInfo.sign != 0}">
						${ playerInfo.identityDesc }
						<c:if test="${ playerInfo.signAvatar != null }">
							<img src="${picServer}${ playerInfo.signAvatar }" class="am-comment-avatar sign-avatar">
						</c:if>
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
						style="width: 100%" onclick="pageSwitch('#pageA','#pageB',0,1,'getOpreation(${playerInfo.characterName})')">
				</div>
			</div>
		</c:if>
	</c:if>
	
	<c:if test="${newspaper!=null }">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">${newspaper.header}</h2>
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
	
	<div id="essay-list">
	
	<c:forEach items="${ essayList }" var="essay">
		
		<div class="card">
			<div class="card-header">
				<span><h2>${essay.header}</h2>作者：${essay.nickname}
				<c:if test="${essay.badge != null && not empty essay.badge}">
					<c:set value="${ fn:split(essay.badge, ',') }" var="badges" />
					<c:forEach items="${ badges }" var="badge">
						<img src="${picServer}badgeAvatar/${badge }.png" class="user-badge">
					</c:forEach>
				</c:if>
				</span>
				
			</div>
			<div class="card-body essay-style">
				${essay.content }
			</div>
			<div class="card-footer"><a><span onclick="pageSwitch('#pageA','#pageC',0,1,'getEssayDetail(${essay.essayId})')">查看更多  <span class="am-icon-chevron-right"></span></span></a></div>
		</div>
	
	</c:forEach>
	
	</div>
	
	<div class="loadmore">
		上拉加载更多
	</div>
	
	<div class="nomore invisible">
		已无更多内容
	</div>
	
	<div class="loading-box">
      <span class="am-icon-spinner am-icon-spin"></span>
    </div>

</div>

<script type="text/javascript">
	var pageNum = 0;

	$(window).scroll(function(){
		if(($(window).scrollTop() + $(window).height()) == $(document).height()){
			getMoreEssay();
		}
	});
	
	function getMoreEssay(){
		if(!$(".nomore").hasClass("invisible")){
			return;
		}
		$(".loadmore").addClass("invisible");
		myLoading();
		pageNum++;
		var url = getRootPath() + "/getEssayList";
		var options ={
				userId : 0,
				offset : pageNum*10
		}
		var common = new Common();
		common.callAction(options,url,function(data){	
			myLoadingClose();
			if(data.essayList.length==0){
				$(".nomore").removeClass("invisible");
				adjustContainerHeight(getCurActPage());
			} else {
				$.each(data.essayList,function(index,essay){
					var builder = new StringBuilder();
					builder.append('<div class="card"><div class="card-header">');
					builder.appendFormat('<span><h2>{0}</h2>作者：{1}  ',essay.header,essay.nickname);
					if(essay.badge){
						$.each(essay.badge.split(","),function(index,badge){
							builder.appendFormat('<img src="{0}" class="user-badge">',picServer+"badgeAvatar/"+badge+".png");
						})	
					}
					builder.append('</span>');
					builder.appendFormat('</div><div class="card-body essay-style">{0}</div>',essay.content);
					builder.appendFormat('<div class="card-footer"><a><span onclick="pageSwitch({0},{1},0,1,{2})">查看更多  <span class="am-icon-chevron-right"></span></span></a></div></div>',"'#pageA'","'#pageC'","'getEssayDetail("+essay.essayId+")'")
					$("#essay-list").append(builder.toString());
				})				
				if(data.essayList.length<10){
					$(".nomore").removeClass("invisible");
				} else{
					$(".loadmore").removeClass("invisible");
				}				
				adjustContainerHeight(getCurActPage());
			}
		})
	}

</script>
