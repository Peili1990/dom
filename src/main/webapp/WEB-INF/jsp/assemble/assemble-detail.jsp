<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default">
	<div class="card" id="newspaper-content">
			
	</div>	
	

	<ul class="am-comments-list am-comments-list-flip" id="speech-list">

	</ul>
		
</div>

<script type="text/javascript">
var replaceList;
var playerInfo = ${playerInfoStr}

function getNewspaperDetail(newspaperId,newspaperNo){
	$("#newspaper-content").empty();
	$("#speech-list").empty();
	setCache("cur_newspaper_id",newspaperId);
	var url = getRootPath() + "/getAssembleDetail";
	var options = {
			newspaperId : newspaperId
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		newspaperDetail = data.newspaperDetail;
		var builder = new StringBuilder();
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
		adjustContainerHeight(getCurActPage());
		if(newspaperDetail.type == 2){	
			$.each(data.speechList,function(index,speech){
				appendSpeech(speech);
			});
			if(newspaperDetail.status == 1 && playerInfo){
				$("#nv-footer").addClass("invisible");
				$("#nv-chatbar").removeClass("invisible");
				$("#show-emotion").addClass("invisible");
				$("#use-gesture").removeClass("invisible");
				if(data.replaceList == null && playerInfo.isMute == 1 && playerInfo.isLife == 1){
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
				if(playerInfo.isLife == 0 && !(playerInfo.characterId==5 && playerInfo.isSp == "1")){
					$("#nv-chatbar .messages").attr("disabled","disabled").text("禁言中");
					$("#send-message").attr("disabled","disabled");
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
			} else {
				$("#nv-chatbar").addClass("invisible");
				$("#nv-footer").removeClass("invisible");
			}
			redspot = $("#newspaper-list .card:eq("+ newspaperNo +") .badge");
			if(!redspot.hasClass("invisible")){
				newspaperSpeech = getCache("nv_newspaper"+newspaperId);
				setCache("nv_offline_speech",getCache("nv_offline_speech")-parseInt(newspaperSpeech));
				delCache("nv_newspaper"+newspaperId);
				redspot.addClass("invisible");
				setRedspot();
			}
		}		
		activeScrollNav();
		$("#container").css({"height":$("#pageB .default").height()+100>$("html").height()?$("#pageB .default").height()+100+"px":$("html").height() });
		if(GetQueryString("scroll")){
			scrollTobottom();	
		}
		changeURL(getRootPath()+"/assemble");			
	});
}

function sumbitSpeech(newspaperId,index){
	var content = $("#nv-chatbar .messages").val().trim();
	if(content == ""){
		return;
	}
	if(!$("#use-gesture").hasClass("am-btn-danger") && index != null && replaceList[index].isMute == 1){
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
		builder.append(playerInfo && speech.playerId == playerInfo.playerId ? '<li class="am-comment-flip">':'<li class="am-comment">');
		builder.appendFormat('<input type="hidden" value="{0}">',speech.id);
		builder.appendFormat('<a ><img src="{0}{1}" class="am-comment-avatar"></a>',picServer,speech.avatar);
		builder.append('<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">');
		builder.appendFormat('<a class="am-comment-author">{0}</a><time>{1}</time></div></header>',speech.characterName,speech.createTime);
		if(speech.type == 1){
			builder.appendFormat('<div class="am-comment-bd">{0}</div></div></li>',speech.content)
		}else if(speech.type == 2){
			builder.appendFormat('<div class="am-comment-bd gesture-style">{0}</div></div></li>',speech.content)
		}
	}
	$("#speech-list").append(builder.toString());
	adjustContainerHeight(getCurActPage());
}

function deleteSpeech(content){
	$.each($("#speech-list li"),function(index,speech){
		if($(speech).find("input[type='hidden']").val() == content.speechId){
			$(speech).remove();
			return false;
		}
	})
	adjustContainerHeight(getCurActPage());
}

function wordCount(){
	$("#icon-options").dropdown('close');
	if($("#nv-chatbar").is(":hidden")){
		myAlert("未检测到输入框");
		return;
	}
	var url = getRootPath() + "/wordCount";
	var options = {
		newspaperId : getCache("cur_newspaper_id"),
		content : $("#nv-chatbar .messages").val()
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		myInfo("今日已用："+data.used+"字<br>"+"该发言共计：" + data.wordCount + "字");		
	})
}
</script>