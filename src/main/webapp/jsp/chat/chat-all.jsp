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

	$(function(){
		createChatList();
	})
	
	function createChatList(){
		db.transaction(function (trans) {
            trans.executeSql("select chatId, content, max(createTime), count(distinct chatId) from chat_record_"+userId+" group by chatId", [], function (ts, webData) {
           		if(webData){
           			var chatIdList = [];
           			for(var i=0;i<webData.rows.length;i++){ 
           				chatIdList.push(webData.rows.item(i).chatId)
           			}
           			var url = getRootPath() + "/getChatInfo";
           			var common = new Common();
           			common.callAction(JSON.stringify(chatIdList), url, function(data) {
           				if(!data){
           					return;
           				}
           				switch (data.status){
           				case 1:
           					$("#chat-list").empty();
           					$.each(data.chatList,function(index,chatInfo){
           						var builder = new StringBuilder();
           						builder.appendFormat('<div class="card" id="{0}" onclick="pageSwitch({1},{2},{3})"><div class="card-body">',webData.rows.item(index).chatId,"'#pageA'","'#pageB'","'getChatDetail("+chatInfo.toUserId+")'");
           						builder.appendFormat('<img src="http://q.qlogo.cn/qqapp/100229475/C06A0F683914D5FEEE6968887DDCF0AB/100" class="am-comment-avatar avatar">');
           						builder.appendFormat('<div class="chat-content"><h3>{0}</h3><p>{1}</p></div>',chatInfo.toUserNickname,webData.rows.item(index).content);
           						builder.append('<span class="badge badge-alert badge-rounded invisible"></span>');
           						builder.appendFormat('<input type="hidden" name="chat-id" value="{0}"></div></div>',webData.rows.item(index).chatId);
           						$("#chat-list").append(builder.toString());
           					})
           					setRedspotOnChat();
           					adjustContainerHeight("#pageA");
           					return;
           				case 0:
           					timeoutHandle();
           					return;
           				default:
           					myAlert(data.message);
           					return;
           				}
           			},"application/json;charset=utf-8")
           		}
            }, function (ts, message) {myAlert(message)});
        });
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