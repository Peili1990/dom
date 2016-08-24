<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default">
	<div class="card" id="newspaper-content">
			
	</div>	
	

	<ul class="am-comments-list am-comments-list-flip" id="speech-list">
<!-- 	<li class="am-panel am-panel-default"> -->
<!--  	 <div class="am-panel-hd">面板标题<time>2016-07-02 15:41</time></div> -->
<!--   	<div class="am-panel-bd"> -->
<!--    	 面板内容 -->
<!--   	</div> -->
<!-- 	</li> -->
<!-- 		<li class="am-comment"> -->
<!-- 			<a href=""><img src="http://q.qlogo.cn/qqapp/100229475/C06A0F683914D5FEEE6968887DDCF0AB/100" class="am-comment-avatar"></a> -->
<!-- 		<div class="am-comment-main"> -->
<!-- 			<header class="am-comment-hd"> -->
<!-- 				<div class="am-comment-meta"> -->
<!-- 					<a href="" class="am-comment-author">莫利</a> -->
<!-- 					<time>2016-07-02 15:41</time> -->
<!-- 				</div> -->
<!-- 			</header> -->
<!-- 			<div class="am-comment-bd">小偷立功偷到杀手，点赞。 -->
<!-- 				公告看出昨天威廉被传染禁言为真，艾尔威身份可信度上升。 -->
<!-- 				科尔比今天被禁，和威廉身份没法讨论，可晚些再议。哈代无所事事，证明身份非民非偷咯。 -->
<!-- 				今天没新凶器范围，照旧昨天，这边重点怀疑对象不变，依然为叶妹和马克唐，特别是马克唐，两天卖萌。</div> -->
<!-- 		</div> -->
<!-- 		</li> -->
<!-- 		<li class="am-comment-flip"> -->
<!-- 			<a href=""><img src="http://app.qlogo.cn/mbloghead/e354d099f1137970f9e0/50" class="am-comment-avatar"></a> -->
<!-- 		<div class="am-comment-main"> -->
<!-- 			<header class="am-comment-hd"> -->
<!-- 				<div class="am-comment-meta"> -->
<!-- 					<a href="" class="am-comment-author">莫利</a> -->
<!-- 					<time>2016-07-02 15:41</time> -->
<!-- 				</div> -->
<!-- 			</header> -->
<!-- 			<div class="am-comment-bd gesture-style">*莫利在集会上欢快的跳了起来</div> -->
<!-- 		</div> -->
<!-- 		</li> -->
	</ul>	
</div>

<script type="text/javascript">
var replaceList;
var playerInfo = ${playerInfoStr}

function getNewspaperDetail(newspaperId,newspaperNo){
	var url = getRootPath() + "/getAssembleDetail";
	var options = {
			newspaperId : newspaperId
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if(!data){
			return;
		}
		switch (data.status){
		case 1:
			newspaperDetail = data.newspaperDetail;
			var builder = new StringBuilder();
			$("#newspaper-content").empty();
			builder.appendFormat("<div class='card-header'><h2 class='card-title'>{0}</h2></div>",newspaperDetail.header);
			if(newspaperDetail.headline){
				builder.appendFormat("<div class='card-body'><h2 class='card-title'>{0}</h2>",newspaperDetail.headline);
			}
			if(newspaperDetail.headlineBody){
				builder.appendFormat("{0}</div>",newspaperDetail.headlineBody);
			}
			if(newspaperDetail.subedition){
				builder.appendFormat("<div class='card-body'>{0}</div>",newspaperDetail.subedition);
			}			
			if(newspaperDetail.importantNotice){
				if(newspaperDetail.headline||newspaperDetail.headlineBody||newspaperDetail.subedition){
					builder.append("<hr data-am-widget='divider' class='am-divider am-divider-default' />");
				}
				builder.appendFormat("<div class='card-body'><h2 class='card-title'>重要公告</h2>{0}</div>",newspaperDetail.importantNotice);
			}
			if(newspaperDetail.seatTable){
				if(newspaperDetail.headline||newspaperDetail.headlineBody||newspaperDetail.subedition||newspaperDetail.importantNotice){
					builder.append("<hr data-am-widget='divider' class='am-divider am-divider-default' />");
				}
				builder.append("<div class='card-body' id='seat-table'><h2 class='card-title'>座位表</h2></div>");	
			}
			$("#newspaper-content").append(builder.toString());
			if(newspaperDetail.seatTable){
				$("#seat-table").append(newspaperDetail.seatTable);
			}
			adjustContainerHeight("#pageB");
			if(newspaperDetail.type == 2){
				$("#speech-list").empty();
				$.each(data.speechList,function(index,speech){
					appendSpeech(speech);
				});
				if(newspaperDetail.status == 1){
					$("#nv-footer").addClass("invisible");
					$("#nv-chatbar").removeClass("invisible");
					$("#show-emotion").addClass("invisible");
					if(data.replaceList == null && playerInfo.isMute == 1){
						$("#nv-chatbar .messages").attr("disabled","disabled").text("禁言中");
						$("#send-message").attr("disabled","disabled");
						$("#use-gesture").on("click",function(){
							if($(this).hasClass("am-btn-danger")){
								$("#nv-chatbar .messages").removeAttr("disabled").text("");
								$("#send-message").removeAttr("disabled");	
							}else{
								$("#nv-chatbar .messages").attr("disabled","disabled").text("禁言中");
								$("#send-message").attr("disabled","disabled");
							}
						})
					}
					$("#send-message").on("click",function(){
						if(data.replaceList != null){
							replaceList = data.replaceList;
							$('#my-actions .am-list').empty().append("<li class='am-modal-actions-header'>请选择发言角色</li>");
							$.each(replaceList,function(index,ele){
								$('#my-actions .am-list').append("<li onclick='sumbitSpeech("+newspaperId+","+index+")'>"+ele.characterName+"</li>");
							})
							$('#my-actions').modal('open');
						} else {
							sumbitSpeech(newspaperId);
						}
					})
					redspot = $("#newspaper-list .card:eq("+ newspaperNo +") .badge");
					if(!redspot.hasClass("invisible")){
						newspaperSpeech = getCache("nv_newspaper"+newspaperId);
						setCache("nv_offline_speech",getCache("nv_offline_speech")-parseInt(newspaperSpeech));
						delCache("nv_newspaper"+newspaperId);
						redspot.addClass("invisible");
						setRedspot();
					}
				} else {
					$("#nv-chatbar").addClass("invisible");
					$("#nv-footer").removeClass("invisible");
				}
			}
			$("#container").css({"height":$("#pageB .default").height()+100>$("html").height()?$("#pageB .default").height()+100+"px":$("html").height() });
			return;
		case 0:
			timeoutHandle();
			return;
		default:
			myAlert(data.message);
			return;
		}		
	});
}

function sumbitSpeech(newspaperId,index){
	var content = $("#nv-chatbar .messages").val().trim();
	if(content == ""){
		return;
	}
	if(index != null && replaceList[index].isMute == 1){
		myInfo("该发言称呼被禁言:(");
		return;
	}
	var options = {
		newspaperId : newspaperId,
		gameId : playerInfo.gameId,
		playerId : playerInfo.playerId,
		characterName : index != null ? replaceList[index].characterName : playerInfo.characterName,
		avatar : index != null ? replaceList[index].characterAvatar : playerInfo.characterAvatar,
		isMute : index != null ? replaceList[index].isMute : playerInfo.isMute,
		content : recoverTag(content),
		type : $("#use-gesture").hasClass("am-btn-danger") ? 2 : 1
	}
	$('#my-actions').modal('close');
	$("#nv-chatbar .messages").val("").keyup();
	var url = "http://" + "${chatServer}" + "/sumbitSpeech";
	var common = new Common();
	common.callAction(options, url, function(data) {
		
	})
}

function appendSpeech(speech){
	var builder = new StringBuilder();
	if(speech.type == 3){
		builder.append('<li class="am-panel am-panel-default">');
		builder.appendFormat('<input type="hidden" value="{0}">',speech.id);
		builder.appendFormat('<div class="am-panel-hd">游戏公告<time>{0}</time></div>',speech.createTime);
		builder.appendFormat('<div class="am-panel-bd">{0}</div></li>',speech.content);	
	} else {
		builder.append(speech.playerId == playerInfo.playerId ? '<li class="am-comment-flip">':'<li class="am-comment">');
		builder.appendFormat('<input type="hidden" value="{0}">',speech.id);;
		builder.appendFormat('<a href=""><img src="{0}" class="am-comment-avatar"></a>',speech.avatar);
		builder.append('<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">');
		builder.appendFormat('<a href="" class="am-comment-author">{0}</a><time>{1}</time></div></header>',speech.characterName,speech.createTime);
		if(speech.type == 1){
			builder.appendFormat('<div class="am-comment-bd">{0}</div></div></li>',speech.content)
		}else if(speech.type == 2){
			builder.appendFormat('<div class="am-comment-bd gesture-style">{0}</div></div></li>',speech.content)
		}
	}
	$("#speech-list").append(builder.toString());
	adjustContainerHeight("#pageB");
}

function deleteSpeech(content){
	$.each($("#speech-list li"),function(index,speech){
		if($(speech).find("input[type='hidden']").val() == content.speechId){
			$(speech).remove();
			return false;
		}
	})
	adjustContainerHeight("#pageB");
}
</script>