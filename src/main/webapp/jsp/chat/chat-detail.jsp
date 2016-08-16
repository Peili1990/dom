<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">

	<ul class="am-comments-list am-comments-list-flip" id="chat-detail-list">

	</ul>
	
</div>

<script type="text/javascript">

	function getChatDetail(toUserId){
		var chatId = userId > toUserId ? toUserId+"-"+userId : userId+"-"+toUserId;
		db.transaction(function (trans) {
            trans.executeSql("select * from chat_record_"+userId+" where chatId = ? order by createTime desc limit 10 ", [chatId], function (ts, webData) {
            	if(webData){
            		for(var i=0;i<webData.rows.length;i++){ 
           				
           			}
            	}
            }, function (ts, message) {
                myAlert(message);
            });
        });
	}
	
	function appendChatDetail(){}

</script>