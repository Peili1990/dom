<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" id="user-nickname" value="${user.nickname}">
<input type="hidden" id="user-avatar" value="${user.avatar}">
<div class="default" id="chat-list">

<!-- 	<div class="card"> -->
<!-- 			<div class="card-body"> -->
<!-- 			<img src="http://q.qlogo.cn/qqapp/100229475/C06A0F683914D5FEEE6968887DDCF0AB/100" class="am-comment-avatar avatar"> -->
<!-- 			<div class="chat-content"> -->
<!-- 				<h3>主编</h3> -->
<!-- 				<p>反馈：死亡请留遗言反馈：死亡请留遗言反馈：死亡请留遗言反馈：死亡请留遗言反馈：死亡请留遗言</p> -->
<!-- 			</div> -->
<!-- 			<span class="badge badge-alert badge-rounded invisible">1</span> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
</div>

<script type="text/javascript">
	var chatList = [];

	$(function(){
		createChatList();
	})
	
	function createChatList(){
        var url = getRootPath() + "/getChatInfo";
        var common = new Common();
        common.callAction(null, url, function(data) {
        	$("#chat-list").empty();
           	$.each(data.chatList,function(index,chatInfo){
           	   	chatList.push(chatInfo.chatId);
           	   	setChatPosition(chatInfo,false);
           	})
           	setRedspotOnChat();     			
          })
	}
	
	function setChatPosition(chatInfo,preAppend){
		var builder = new StringBuilder();
		builder.appendFormat('<div class="card" id="{0}" onclick="pageSwitch({1},{2},0,1,{3})"><div class="card-body">',chatInfo.chatId,"'#pageA'","'#pageB'","'getChatDetail("+chatInfo.toUserId+")'");
		builder.appendFormat('<img src="{0}{1}" class="am-comment-avatar avatar">',picServer,chatInfo.toUserAvatar);
		builder.appendFormat('<div class="chat-content"><h3>{0}</h3><span>{1}</span></div>',chatInfo.toUserNickname,replaceEmoji(chatInfo.latestContent,emoji));
		builder.append('<span class="badge badge-alert badge-rounded invisible"></span>');
		builder.appendFormat('<input type="hidden" name="chat-id" value="{0}"></div></div>',chatInfo.chatId);
		if(preAppend){
			$("#chat-list").prepend(builder.toString());
		} else {
			$("#chat-list").append(builder.toString());
		}
		adjustContainerHeight(getCurActPage());
	}
	
	function setRedspotOnChat(){
		$.each($("#chat-list .card"),function(index,chat){
			chatId = $(chat).find("input[type='hidden']").val();
			chatMessage = getCache("nv_chat"+chatId);
			redspot = $(chat).find(".badge");
			if(chatMessage>0){		
				redspot.text(chatMessage).removeClass("invisible");
			}else{
				redspot.addClass("invisible");
			}
		})
	}	

</script>