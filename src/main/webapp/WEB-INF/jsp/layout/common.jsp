<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" type="text/css" href="${baseUrl}css/jquery.emojiarea.css" />
<link rel="stylesheet" type="text/css" href="${baseUrl}css/jscrollpane1.css" />
<link rel="stylesheet" type="text/css" href="${baseUrl}assets/css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="${baseUrl}css/common.css">
<link rel="stylesheet" type="text/css" href="${baseUrl}mobiscroll/css/mobiscroll.custom-2.6.2.min.css">
<link rel="shortcut icon" href="${baseUrl}img/nv-logo.png"/>
<link rel="bookmark" href="${baseUrl}img/nv-logo.png"/>
<link rel="apple-touch-icon" href="${baseUrl}img/nv-logo.png"/>
<script src="${baseUrl}js/common/jquery-3.0.0.min.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/reconnecting-websocket.js" type="text/javascript"></script>
<script src="${baseUrl}assets/js/fastclick.min.js" type="text/javascript"></script>
<script src="${baseUrl}assets/js/amazeui.min.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/common.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/jquery.emojiarea.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/frame.min.js" type="text/javascript"></script>
<script src="${baseUrl}mobiscroll/js/mobiscroll.custom-2.6.2.min.js" type="text/javascript"></script>


<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
  <div class="am-modal-dialog">
    <div class="am-modal-hd"></div>
    <div class="am-modal-bd">
      <span class="am-icon-warning"></span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd"></div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>

<div class="am-modal-actions" id="my-actions">
  <div class="am-modal-actions-group">
    <ul class="am-list">
      <li class="am-modal-actions-header">...</li>
      
    </ul>
  </div>
  <div class="am-modal-actions-group">
    <button class="am-btn am-btn-secondary am-btn-block" data-am-modal-close>取消</button>
  </div>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd"></div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>      
    </div>
  </div>
</div>

<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-loading">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">正在加载...</div>
    <div class="am-modal-bd">
      <span class="am-icon-spinner am-icon-spin"></span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="avatar-detail">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">维多利亚的噩梦</div>
		<div class="am-modal-bd"></div>
		<div class="am-modal-footer">
  			<span class="am-modal-btn" data-am-modal-cancel>关闭</span>
		</div>
	</div>
</div>

<div class="dw-hidden" role="alert"></div>

<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default invisible" id="nv-chatbar">
	<div class="talk_word">
		<textarea class="messages"></textarea>
		<div class="btn-box">
			<input type="button" class="am-btn am-btn-default" value="动作" id="use-gesture"/>
			<input type="button" class="am-btn am-btn-default" value="表情" id="show-emotion"/>
			<input type="button" class="am-btn am-btn-default" value="发送" id="send-message"/>
		</div>
	</div>
</div>

<script type="text/javascript">
	var picServer="${picServer}";
	var emoji;

	$(function(){
		//FastClick.attach(document.body);
	})
	
	$.get('${baseUrl}file/emoji-list.json',function(data){
		emoji = data;
		$('.messages').emojiarea(getRootPath()+"/img/packs/basic",emoji,{
			wysiwyg: false,
			button: $("#show-emotion")
		});
	})
	
	function showInfoMessage(){
		myInfo(getCache("nv_info_message"));
	}

	$("#nv-chatbar .messages").keyup(function(){ 
		if($("#nv-chatbar .messages")[0].scrollHeight>=50){
			$("#nv-chatbar .messages").css({"height":"auto"}).css({"height":$("#nv-chatbar .messages")[0].scrollHeight+"px"});
			$("#nv-chatbar .talk_word").css({"height":$("#nv-chatbar .messages").height()+32+"px"});
			$("#nv-chatbar").css({"height":$("#nv-chatbar .messages").height()+32+"px"});
			if(calLines()==1&&recoverTag($("#nv-chatbar .messages").val()).indexOf("<br>")<0){
				$("#nv-chatbar .messages").css({"height":"auto"}).css({"height":"34px"});
				$("#nv-chatbar .talk_word").css({"height":"49px"});
				$("#nv-chatbar").css({"height":"49px"});
			}
		}
	})
	
	function calLines(){
		var text = $("#nv-chatbar .messages").val();
		var areaWidth = $("#nv-chatbar .messages").width()-3;
		lines = parseInt(text.length*16/areaWidth)+1;
		return lines;
	}
	
	
	$("#use-gesture").on("click",function(){
		if($(this).hasClass("am-btn-danger")){
			$(this).removeClass("am-btn-danger").addClass("am-btn-default");
		}else{
			$(this).removeClass("am-btn-default").addClass("am-btn-danger");
		}
	})
	
	function showAvatarDetail(avatar){
		$("#avatar-detail .am-modal-hd").text(avatar.nickname);
		$("#avatar-detail .am-modal-bd").html('<img class="avatar-detail-img" src="'+picServer+avatar.avatar+'"><p>'+avatar.motto+'</p>');
		$("#avatar-detail").modal('open');
	}

</script>