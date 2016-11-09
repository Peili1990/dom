<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="essay-box" id="essay-detail">
		<div class="author-info">
			<img src="" class="am-comment-avatar"> <span></span>
			<time></time>
		</div>
		<div class="essay-content">
			<h2></h2>
			<p></p>
		</div>
		<div class="operation-box invisible">
			<span>删帖</span>	
			<span>编辑</span>		
		</div>
	</div>
	<ul id="comment-list">
		
	</ul>
</div>



<script type="text/javascript">

function getEssayDetail(essayId){
	var url = getRootPath() + "/getEssayDetail";
	var options = {
			essayId : essayId
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if(!data){
			return;
		}
		switch (data.status){
		case 1:
			$("#nv-footer").addClass("invisible");
			$("#nv-chatbar").removeClass("invisible");
			$("#use-gesture").addClass("invisible");
			$("#send-message").on("click",function(){
				submitComment(essayId);
			})
			$("#essay-detail .author-info").find("img").attr("src",picServer+data.detail.avatar);
			$("#essay-detail .author-info").find("span").text(data.detail.nickname);
			$("#essay-detail .author-info").find("time").html("楼主    "+data.detail.createTime);
			$("#essay-detail .essay-content").html("<h2>"+data.detail.header+"</h2><p>"+data.detail.content+"</p>");
			if(userId==data.detail.userId){
				$(".operation-box").removeClass("invisible");
				$(".operation-box span:eq(0)").unbind("click").click(function(){
					myConfirm("一旦删除不可恢复，是否确认删帖？",'deleteEssay('+essayId+')')
				})
				$(".operation-box span:eq(1)").unbind("click").click(function(){
					pageSwitch(getCurActPage(),"#pageD",getCurActLevel(),2,'adjustTextArea('+essayId+')')
				})
			}
			$("#comment-list").empty();
			$.each(data.comments,function(index,comment){
				appendComment(parseInt(index)+2,comment);
			})
			adjustContainerHeight(getCurActPage());
			if(window.location.href.indexOf("essayId")<0){
				changeURL(window.location.href.indexOf("?")<0 ? 
						window.location.href+"?essayId="+essayId : window.location.href+"&essayId="+essayId);
			}
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


function appendComment(index,comment){
	var builder = new StringBuilder();
	builder.append("<li>");
	builder.appendFormat('<img src="{0}" class="am-comment-avatar"> <span> {1} </span>',picServer+comment.avatar,comment.nickname);
	builder.appendFormat('<time>{0}&nbsp&nbsp{1}</time>',index+"楼",comment.createTime);
	builder.appendFormat('<div class="commnet-content"><p>{0}</p></div>',comment.content);
	builder.append("</li>");
	$("#comment-list").append(builder.toString());
}

function submitComment(essayId){
	var content = $("#nv-chatbar .messages").val().trim();
	if(content == ""){
		return;
	}
	var url = getRootPath() + "/submitComment";
	var options = {
			essayId : essayId,
			content : recoverTag(content)
	}
	var common = new Common();
	$("#nv-chatbar .messages").val("").keyup();
	common.callAction(options, url, function(data) {
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("评论成功",function(){
				location.reload();
			})
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


</script>