<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="essay-box" id="essay-detail">
		<div class="author-info">
			<img src="${picServer}${user.avatar}"
			class="am-comment-avatar"> <span> ${ user.nickname } </span>
			<time>2016-09-10</time>
		</div>
		<div class="essay-content">
			<h2>这游戏最让我恶心的就是英雄就是猎空</h2>
			<p>我好像遇到了所谓的瓶颈，从每天的练枪我就感觉到，感觉就是怪怪的，打快速和竞<br>技感觉没有以前那种手感了，极度不稳定，上赛季66，这赛季还可以，求告知一下我是怎么了，怎么找回自己！</p>
		</div>
	</div>
	<ul id="comment-list">
		<li>
			<img src="${picServer}${user.avatar}"
			class="am-comment-avatar"> <span> ${ user.nickname } </span>
			<time>2016-09-10</time>
			<div class="commnet-content">
				<p>我有不少主麦克雷的好友，这个英雄就两种风格，一种是我这种喜欢甩枪的，打人真的是随缘爆头，准的时候跟开挂一样。还有一种就是喜欢跟枪的，有时候我也观战，我认识的大部分人都是跟枪居多，跟枪的麦克雷比较稳定，鼠标灵敏也低。就这样，你可以加我Eason#55798</p>
			</div>
		</li>
		<li>
			<img src="${picServer}${user.avatar}"
			class="am-comment-avatar"> <span> ${ user.nickname } </span>
			<time>2016-09-10</time>
			<div class="commnet-content">
				<p>我有不少主麦克雷的好友，这个英雄就两种风格，一种是我这种喜欢甩枪的，打人真的是随缘爆头，准的时候跟开挂一样。还有一种就是喜欢跟枪的，有时候我也观战，我认识的大部分人都是跟枪居多，跟枪的麦克雷比较稳定，鼠标灵敏也低。就这样，你可以加我Eason#55798</p>
			</div>
		</li>
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
			$("#essay-detail .essay-content").html("<h2>"+data.detail.header+"</h2>"+data.detail.content);
			$("#comment-list").empty();
			$.each(data.comments,function(index,comment){
				appendComment(parseInt(index)+2,comment);
			})
			adjustContainerHeight("#pageC");
			if(window.location.href.indexOf("essayId")<0){
				changeURL(window.location.href+"?essayId="+essayId);
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