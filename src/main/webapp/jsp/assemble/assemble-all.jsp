<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div id="newspaper-list">
		<c:forEach items="${ newspaperList }" var="newspaper" varStatus="newspaperNo">
	 		<div class="card" onclick="pageSwitch('#pageA','#pageB',0,1,'getNewspaperDetail(${newspaper.newspaperId},${newspaperNo.index})')">
				<div class="card-header">
					<h2 class="card-title">${newspaper.header }</h2>
					<span class="badge badge-alert badge-rounded badge-card"></span>
					<input type="hidden" name="newspaper-id" value="${ newspaper.newspaperId }">
				</div>
			</div>
		</c:forEach>
		<c:if test="${ replayEssay!=null }">
			<div class="card" onclick="pageSwitch('#pageA','#pageC',0,1,'getEssayDetail(${replayEssay.essayId})')">
				<div class="card-header">
					<h2 class="card-title">${replayEssay.header }</h2>
				</div>
			</div>
		</c:if>
		<div class="nv-guide invisible">
			<img src="">
			<p>暂未参加任何版杀，你可以<br><a class="nv-link" onclick="getAllGames()">查看其他版杀</a></p>
		</div>
	</div>
	
	<div class="invisible" id="game-list">
	
	</div>
	
</div>

<script type="text/javascript">

$(function(){
	if($("#newspaper-list .card").length == 0){
		showNVguide();
	}
	setRedspotOnpaper();
	var newspaperId = GetQueryString("newspaperId");
	if(newspaperId){
		$.each($("#newspaper-list .card"),function(index,newspaper){
			if($(newspaper).find("input[name='newspaper-id']").val()==newspaperId){
				$(newspaper).click();
				return false;
			}
		})
	}
	var essayId = GetQueryString("essayId");
	if(essayId){
		pageSwitch("#pageA","#pageC",0,1,"getEssayDetail("+essayId+")");
	}
});

function setRedspotOnpaper(){
	$.each($("#newspaper-list .card"),function(index,newspaper){
		newspaperId = $(newspaper).find("input[type='hidden']").val();
		if(newspaperId){
			newspaperSpeech = getCache("nv_newspaper"+newspaperId);
			redspot = $(newspaper).find(".badge");
			if(newspaperSpeech>0){		
				redspot.text(newspaperSpeech).removeClass("invisible");
			}else{
				redspot.addClass("invisible");
			}
		}
	})
}

function getAllGames(){
	$("#icon-options").dropdown('close');
	$("#icon-arrow-1").click();
	if($("#game-list").children().length > 0){
		return;
	}
	var url = getRootPath() + "/game/getAllGames";
	var common = new Common();
	common.callAction(null,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			$(".nv-guide").addClass("invisible");			
			$.each(data.games,function(index,game){
				var builder = new StringBuilder();
				builder.append('<div class="card"><div class="card-header"><h2 class="card-title">版杀信息</h2></div>');
				builder.append('<div class="card-body">');
				builder.appendFormat('{0}<br>开版时间：{1}<br>当前状态：{2}',game.gameDesc,game.startDate,game.gameStatusDesc);
				if(game.finalResult){
					builder.appendFormat('<br>最终结果：{0}',game.finalResultDesc);
				}
				builder.append('</div>');
				builder.appendFormat('<div class="card-footer"><a href="'+getRootPath()+'/assemble?gameId={0}"><span>查看更多  <span class="am-icon-chevron-right"></span></span></a></div></div>',game.id);
				$("#game-list").append(builder.toString());
			})
			$("#newspaper-list").addClass("invisible");
			$("#game-list").removeClass("invisible");
			adjustContainerHeight(getCurActPage());
		}
	})
}

</script>

