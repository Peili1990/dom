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
				setRedspot();
				if(window.location.href.indexOf("assemble")>0){
					setRedspotOnpaper();
				}
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
	
	function setRedspot(){
		var offlineSpeech = getCache("nv_offline_speech") ? getCache("nv_offline_speech") : 0;
		if(offlineSpeech>0){
			$("#nv-footer .am-icon-bell .badge").text(offlineSpeech).removeClass("invisible");
		} else {
			$("#nv-footer .am-icon-bell .badge").addClass("invisible");
		}
	}

  </script>
