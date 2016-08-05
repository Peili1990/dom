<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" type="text/css" href="${baseUrl }css/jscrollpane1.css" />
<link rel="stylesheet" type="text/css" href="${baseUrl}css/common.css">
<link rel="stylesheet" href="${baseUrl}assets/css/amazeui.min.css">
<link href="${baseUrl}mobiscroll/css/mobiscroll.custom-2.6.2.min.css" rel="stylesheet" type="text/css">
<script src="${baseUrl}js/common/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${baseUrl}assets/js/fastclick.min.js" type="text/javascript"></script>
<script src="${baseUrl}assets/js/amazeui.min.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/common.js" type="text/javascript"></script>
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

<div class="dw-hidden" role="alert"></div>

<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default invisible" id="nv-chatbar">
	<div class="talk_word">
		<textarea class="messages"></textarea>
		<input type="button" class="am-btn am-btn-default" value="动作" id="use-gesture"/>
		<input type="button" class="am-btn am-btn-default" value="发送" id="send-message"/>
	</div>
</div>

<script type="text/javascript">

	$("#nv-chatbar .messages").keydown(function(){
			
		  $("#nv-chatbar .messages").css({"height":"auto"}).css({"height":$("#nv-chatbar .messages")[0].scrollHeight-6+"px"});
		  $("#nv-chatbar .talk_word").css({"height":$("#nv-chatbar .messages").height()+25+"px"});
		  $("#nv-chatbar").css({"height":$("#nv-chatbar .messages").height()+25+"px"});
	})
	
	
	$("#use-gesture").on("click",function(){
		if($(this).hasClass("am-btn-danger")){
			$(this).removeClass("am-btn-danger").addClass("am-btn-default");
		}else{
			$(this).removeClass("am-btn-default").addClass("am-btn-danger");
		}
	})

</script>