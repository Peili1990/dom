<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">

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
		var chatId = userId > toUserId ? toUserId+"-"+userId : userId+"-"+toUserId;
		activeToUserId = toUserId;
		pageNum = 0;
		db.transaction(function (trans) {
            trans.executeSql("select * from chat_record_"+userId+" where chatId = ? order by createTime desc limit 10 ", [chatId], function (ts, webData) {
            	if(webData){
            		$("#chat-detail-list").empty();
            		for(var i=0;i<webData.rows.length;i++){ 
            			appendChatDetail(webData.rows.item(i),true);
           			}
            	}
            	scrollTobottom();
            	$("#nv-footer").addClass("invisible");
				$("#nv-chatbar").removeClass("invisible");
				$("#use-gesture").addClass("invisible");
				$("#send-message").on("click",function(){
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
				
				$(window).scroll(throttle(function(){
					if($(window).scrollTop()<=0){
						loadMoreChat(chatId)
					}
				},2000,false));
            }, function (ts, message) {
                myAlert(message);
            });
        });
	}
	
	function appendChatDetail(chatDetail,prepend){
		var builder = new StringBuilder();
		builder.append(chatDetail.userId == userId ? '<li class="am-comment-flip">':'<li class="am-comment">');
		builder.appendFormat('<a href=""><img src="{0}" class="am-comment-avatar"></a>',chatDetail.userId == userId ? $("#user-avatar").val() : $("#"+chatDetail.chatId+" img").attr("src"));
		builder.append('<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">');
		builder.appendFormat('<a href="" class="am-comment-author">{0}</a><time>{1}</time></div></header>',chatDetail.userId == userId ? $("#user-nickname").val() : $("#"+chatDetail.chatId+" h3").text(),chatDetail.createTime);
		builder.appendFormat('<div class="am-comment-bd">{0}</div></div></li>',chatDetail.content)
		if(prepend){
			$("#chat-detail-list").prepend(builder.toString());
			adjustContainerHeight("#pageB");
		}else{
			$("#chat-detail-list").append(builder.toString());
			adjustContainerHeight("#pageB");
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
				content : content
		}
		$("#nv-chatbar .messages").val("");
		var common = new Common();
		common.callAction(options, url, function(data) {
			if (!data) {
				return;
			}
			switch (data.status) {
			case 1:
				db.transaction(function (trans) {
	                trans.executeSql("insert into chat_record_"+userId+"(chatId,userId,content,createTime) values(?,?,?,?) ", [chatId, userId, content, data.chatDetail.createTime], function (ts, data1) {
	                }, function (ts, message) {
	                    myAlert(message);
	                });
	            });
				data.chatDetail.userId = userId;
				appendChatDetail(data.chatDetail,false);
				return;
			default:
				myAlert(data.message);
				return;
			}
		})
	}
	
	function loadMoreChat(chatId){
		pageNum++;
		db.transaction(function (trans) {
            trans.executeSql("select * from chat_record_"+userId+" where chatId = ? order by createTime desc limit "+10*pageNum+",10 ", [chatId], function (ts, webData) {
            	if(webData){
            		for(var i=0;i<webData.rows.length;i++){ 
            			appendChatDetail(webData.rows.item(i),true);
           			}
            	}
            }, function (ts, message) {
                myAlert(message);
            });
        });
	}

</script>