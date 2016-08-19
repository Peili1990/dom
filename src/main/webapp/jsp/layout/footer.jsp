<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default "
      id="nv-footer">
      <ul class="am-navbar-nav am-cf am-avg-sm-4">
          <li >
            <a href="${ baseUrl }index" class="">
                  <span class="am-icon-table"></span>
                <span class="am-navbar-label">主页</span>
            </a>
          </li>
          <li >
            <a href="${ baseUrl }assemble" class="">
                  <span class="am-icon-bell">
                  	<span class="badge badge-alert badge-rounded invisible">1</span>
                  </span>
                <span class="am-navbar-label">集会</span>
            </a>
          </li>
          <li>
            <a href="${ baseUrl }rule" class="">
                  <span class="am-icon-thumb-tack"></span>
                <span class="am-navbar-label">规则</span>
            </a>
          </li>
          <li >
            <a href="${ baseUrl }chat" class="">
                  <span class="am-icon-comment">
                  	<span class="badge badge-alert badge-rounded invisible">1</span>
                  </span>
                <span class="am-navbar-label">私聊</span>
            </a>
          </li>
          <li >
            <a href="${ baseUrl }mine" class="">
                  <span class="am-icon-dashboard"></span>
                <span class="am-navbar-label">我的</span>
            </a>
          </li>
      </ul>
  </div>
  
  <script type="text/javascript">
  	var userId = ${user.id};
  	var db = getCurrentDb(userId);
  	var webSocket = new ReconnectingWebSocket( 'ws://'+'${chatServer}'+'/websocket/'+userId);
  	
  	webSocket.onerror = function(event) {
		myAlert(event.data);
	};

	webSocket.onopen = function(event) {
		refresh = getCookie("refresh");
		if(!refresh){
			getOfflineMessage();
		} else {
			setRedspot();
		}
	}

	webSocket.onmessage = function(event) {
		content = JSON.parse(event.data);
		switch(content.message){
		case "speech":
			dealSpeech(content);
			break;
		case "delete":
			dealDelete(content);
			break;
		case "chat":
			dealChat(content);
		default:
			break;
		}
	};
	
	$(window).bind('unload', function(e) {
		setCookie("refresh",true,"5s");
	});
	
	function getOfflineMessage(){
		var url = getRootPath() + "/getOfflineMessage";
		var common = new Common();
		common.callAction(null, url, function(data) {
			if(!data){
				return;
			}
			switch (data.status){
			case 1:
				totalSpeech = 0;
				$.each(data.offlineSpeech,function(index,offline){
					setCache("nv_newspaper"+offline.newspaperId,parseInt(offline.num));
					totalSpeech+=parseInt(offline.num);
				})
				setCache("nv_offline_speech",parseInt(totalSpeech));
				if(window.location.href.indexOf("assemble")>0){
					setRedspotOnpaper();
				}
				totalChat = getCache("nv_offline_chat"+userId);
				setCache("nv_offline_chat"+userId,totalChat > 0 ? parseInt(totalChat)+parseInt(data.offlineChat.length) : parseInt(data.offlineChat.length));
				$.each(data.offlineChat,function(index,chat){
					chatMessage = getCache("nv_chat"+chat.chatId);
					setCache("nv_chat"+chat.chatId, chatMessage > 0 ? ++chatMessage : 1);
					db.transaction(function (trans) {
			            trans.executeSql("insert into chat_record_"+userId+"(chatId,userId,content,createTime) values(?,?,?,?) ", [chat.chatId, chat.fromUserId, chat.content, chat.createTime], function (ts, data1) {
			            }, function (ts, message) {
			                myAlert(message);
			            });
			        });
				})
				if(window.location.href.indexOf("chat")>0){
					createChatList();
					adjustContainerHeight("#pageA");
					if(!$("#nv-chatbar").hasClass("invisible")){
						getChatDetail(activeToUserId);	
					}
				}
				setRedspot();
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
	
	function dealSpeech(content){
		if(window.location.href.indexOf("assemble")>0 && 
				!$("#nv-chatbar").hasClass("invisible")){
			appendSpeech(content);
			scrollTobottom();
		} else {
			newspaperId = content.newspaperId;
			newspaperSpeech = getCache("nv_newspaper"+newspaperId);
			setCache("nv_newspaper"+newspaperId,newspaperSpeech ? ++newspaperSpeech : 1);
			unreadSpeech = getCache("nv_offline_speech");
			setCache("nv_offline_speech",unreadSpeech ? ++unreadSpeech : 1); 
			setRedspot();
			saveOfflineSpeech(content);
			if(window.location.href.indexOf("assemble")>0){
				setRedspotOnpaper(newspaperId);
			}
		}	
	}
	
	function dealDelete(content){
		if(window.location.href.indexOf("assemble")>0 && 
				!$("#nv-chatbar").hasClass("invisible")){
			deleteSpeech(content);
		} else {
			newspaperId = content.newspaperId;
			setCache("nv_newspaper"+newspaperId,parseInt(getCache("nv_newspaper"+newspaperId))-1);
			setCache("nv_offline_speech",parseInt(getCache("nv_offline_speech"))-1);
			setRedspot();
			if(window.location.href.indexOf("assemble")>0){
				setRedspotOnpaper();
			}
		}	
	}
	
	function saveOfflineSpeech(content){
		var url = getRootPath() + "/saveOfflineSpeech";
		var common = new Common();
		var options = {
				speechId : content.id,
				newspaperId : content.newspaperId
		};
		common.callAction(options, url, function(data) {
			
		})
	}
	
	function dealChat(content){
		db.transaction(function (trans) {
            trans.executeSql("insert into chat_record_"+userId+"(chatId,userId,content,createTime) values(?,?,?,?) ", [content.chatId, content.fromUserId, content.content, content.createTime], function (ts, data1) {
            }, function (ts, message) {
                myAlert(message);
            });
        });
		if(activeToUserId == content.fromUserId){
			appendChatDetail(content,false);
			scrollTobottom();
		} else {
			chatId = content.chatId;
			chatMessage = getCache("nv_chat"+chatId);
			setCache("nv_chat"+chatId,chatMessage ? ++chatMessage : 1);
			unreadChat = getCache("nv_offline_chat"+userId);
			setCache("nv_offline_chat"+userId,unreadChat ? ++unreadChat : 1); 
			setRedspot();
			if(window.location.href.indexOf("chat")>0){
				createChatList();
			}
		}	
	}
	
	function setRedspot(){
		var offlineSpeech = getCache("nv_offline_speech") ? getCache("nv_offline_speech") : 0;
		if(offlineSpeech>0){
			$("#nv-footer .am-icon-bell .badge").text(offlineSpeech).removeClass("invisible");
		} else {
			$("#nv-footer .am-icon-bell .badge").addClass("invisible");
		}
		var offlineChat = getCache("nv_offline_chat"+userId) ? getCache("nv_offline_chat"+userId) : 0;
		if(offlineChat>0){
			$("#nv-footer .am-icon-comment .badge").text(offlineChat).removeClass("invisible");
		} else {
			$("#nv-footer .am-icon-comment .badge").addClass("invisible");
		}
	}

  </script>
