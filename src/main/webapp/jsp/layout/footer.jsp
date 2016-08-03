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
            <a href="https://github.com/allmobilize/amazeui" class="">
                  <span class="am-icon-comment"></span>
                <span class="am-navbar-label">反馈</span>
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
  	var userId = ${user.id}
  	var webSocket = new WebSocket( 'ws://'+'${chatServer}'+'/websocket/'+userId);
  	
  	webSocket.onerror = function(event) {
		myAlert(event.data);
	};

	webSocket.onopen = function(event) {
		var url = getRootPath() + "/getOfflineMessage";
		var common = new Common();
		common.callAction(null, url, function(data) {
			if(!data){
				return;
			}
			switch (data.status){
			case 1:
				$.each(data.offlineMessages,function(index,message){
					if(message.type == 1){
						offlineSpeech = message.num;
						unreadSpeech = getCache("nv_unread_speech");
						speech = unreadSpeech ? parseInt(offlineSpeech) + parseInt(unreadSpeech) : offlineSpeech;
						if(speech>0){
							$("#nv-footer .am-icon-bell .badge").text(speech).removeClass("invisible");
						}
					}
				})
				return;
			case 0:
				timeoutHandle();
				return;
			default:
				myAlert(data.message);
				return;
			}	
		});
	};

	webSocket.onmessage = function(event) {
		content = JSON.parse(event.data);
		switch(content.message){
		case "speech":
			if(window.location.href.indexOf("assemble")>0 && 
					!$("#nv-chatbar").hasClass("invisible")){
				appendSpeech(content);
			} else {
				badge = $("#nv-footer .am-icon-bell .badge");
				if(badge.hasClass("invisible")){
					badge.text("1").removeClass("invisible");;
					setCache("nv_unread_speech",badge.text());
				} else {
					badge.text(badge.text()-1+2);
					unreadSpeech = getCache("nv_unread_speech");
					setCache("nv_unread_speech",unreadSpeech ? unreadSpeech-1+2 : 1); 
				}
			}	
			break;
		default:
			break;
		}
	};

  </script>
