<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">


    <div class="loading-box">
      <span class="am-icon-spinner am-icon-spin"></span>
    </div>
	<ul class="am-comments-list am-comments-list-flip" id="chat-detail-list">

	</ul>
	
</div>

<script type="text/javascript">
	var activeToUserId = 0;
	var pageNum = 0;

	function getChatDetail(toUserId){
		if(toUserId == 0 ){
			return;
		}
		$("#chat-detail-list").empty();
		var chatId = userId > toUserId ? toUserId+"-"+userId : userId+"-"+toUserId;
		activeToUserId = toUserId;
		pageNum = 0;
		var url = getRootPath() + "/getChatRecord";
		var options = {
				chatId : chatId,
				pageNum : pageNum
		}
		var common = new Common();
		common.callAction(options,url,function(data){
			if(!data){
				return;
			}
			switch(data.status){
			case 1:
				$.each(data.chatDetails,function(index,detail){
					appendChatDetail(detail,true);
				})
				$(window).scrollTop($(window).height());
            	$("#nv-footer").addClass("invisible");
				$("#nv-chatbar").removeClass("invisible");
				$("#use-gesture").addClass("invisible");
				$("#show-emotion").removeClass("invisible");
				$("#send-message").unbind("click").click(function(){
					sendMessage(chatId,toUserId);
				})
				redspot = $("#"+chatId+" .badge")
				if(!redspot.hasClass("invisible")){
					chatMessage = getCache("nv_chat"+chatId);
					setCache("nv_offline_chat"+userId,getCache("nv_offline_chat"+userId)-parseInt(chatMessage));
					delCache("nv_chat"+chatId);
					redspot.addClass("invisible");
					setRedspot();
				}	
				$(window).scroll(function(){
					if($(window).scrollTop()==0){
						loadchatRecord(chatId);
					}
				});
				return;
			case 0:
       			timeoutHandle();
       			return;
       		default:
       			myAlert(data.message);
       			return;
       		}
		})
		
	}
	
	function appendChatDetail(chatDetail,prepend){
		var builder = new StringBuilder();
		builder.append(chatDetail.fromUserId == userId ? '<li class="am-comment-flip">':'<li class="am-comment">');
		builder.appendFormat('<a href=""><img src="{0}" class="am-comment-avatar"></a>',chatDetail.fromUserId == userId ? picServer+$("#user-avatar").val() : $("#"+chatDetail.chatId+" img").attr("src"));
		builder.append('<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">');
		builder.appendFormat('<a href="" class="am-comment-author">{0}</a><time>{1}</time></div></header>',chatDetail.fromUserId == userId ? $("#user-nickname").val() : $("#"+chatDetail.chatId+" h3").text(),chatDetail.createTime);
		builder.appendFormat('<div class="am-comment-bd">{0}</div></div></li>',replaceEmoji(chatDetail.content,emoji));
		if(prepend){
			$("#chat-detail-list").prepend(builder.toString());
			adjustContainerHeight(getCurActPage());
		}else{
			$("#chat-detail-list").append(builder.toString());
			adjustContainerHeight(getCurActPage());
			scrollTobottom();
		}
	}
	
	function sendMessage(chatId,toUserId){
		var content = $("#nv-chatbar .messages").val().trim();
		if(content == ""){
			return;
		}
		var url = "http://" + "${chatServer}" + "/sendMessage";
		var options = {
				chatId : chatId,
				toUserId : toUserId,
				fromUserId : userId,
				content : recoverTag(content)
		}
		$("#nv-chatbar .messages").val("").keyup();
		var common = new Common();
		common.callAction(options, url, function(data) {
			if (!data) {
				return;
			}
			switch (data.status) {
			case 1:
				appendChatDetail(data.chatDetail,false);
				return;
			default:
				myAlert(data.message);
				return;
			}
		})
	}
	
	function loadchatRecord(chatId){
		pageNum++;
		var url = getRootPath() + "/getChatRecord";
		var options = {
				chatId : chatId,
				pageNum : pageNum
		}
		var common = new Common();
		myLoading();
		common.callAction(options,url,function(data){
			if(!data){
				return;
			}
			switch(data.status){
			case 1:			
				$.each(data.chatDetails,function(index,detail){
					appendChatDetail(detail,true);
				})				
				myLoadingClose();
				return;
			case 0:
       			timeoutHandle();
       			return;
       		default:
       			myLoadingClose();
       			return;
       		}
		})
	}

</script>