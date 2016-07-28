<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default">
	<div class="card" id="newspaper-content">
			
	</div>	
	

	<ul class="am-comments-list am-comments-list-flip">
		<li class="am-comment">
			<a href=""><img src="http://q.qlogo.cn/qqapp/100229475/C06A0F683914D5FEEE6968887DDCF0AB/100" class="am-comment-avatar"></a>
		<div class="am-comment-main">
			<header class="am-comment-hd">
				<div class="am-comment-meta">
					<a href="" class="am-comment-author">莫利</a>
					<time>2016-07-02 15:41</time>
				</div>
			</header>
			<div class="am-comment-bd">小偷立功偷到杀手，点赞。
				公告看出昨天威廉被传染禁言为真，艾尔威身份可信度上升。
				科尔比今天被禁，和威廉身份没法讨论，可晚些再议。哈代无所事事，证明身份非民非偷咯。
				今天没新凶器范围，照旧昨天，这边重点怀疑对象不变，依然为叶妹和马克唐，特别是马克唐，两天卖萌。</div>
		</div>
		</li>
		<li class="am-comment-flip">
			<a href=""><img src="http://app.qlogo.cn/mbloghead/e354d099f1137970f9e0/50" class="am-comment-avatar"></a>
		<div class="am-comment-main">
			<header class="am-comment-hd">
				<div class="am-comment-meta">
					<a href="" class="am-comment-author">莫利</a>
					<time>2016-07-02 15:41</time>
				</div>
			</header>
			<div class="am-comment-bd">小偷立功偷到杀手，点赞。
				公告看出昨天威廉被传染禁言为真，艾尔威身份可信度上升。
				科尔比今天被禁，和威廉身份没法讨论，可晚些再议。哈代无所事事，证明身份非民非偷咯。
				今天没新凶器范围，照旧昨天，这边重点怀疑对象不变，依然为叶妹和马克唐，特别是马克唐，两天卖萌。</div>
		</div>
		</li>
	</ul>	
</div>

<script type="text/javascript">

function getNewspaperDetail(newspaperId){
	var url = getRootPath() + "/getAssembleDetail";
	var options = {
			newspaperId : newspaperId
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		if(!data){
			return;
		}
		switch (data.status){
		case 1:
			var newspaperDetail = data.newspaperDetail;
			var builder = new StringBuilder();
			$("#newspaper-content").empty();
			builder.appendFormat("<div class='card-header'><h2 class='card-title'>{0}</h2></div>",newspaperDetail.header);
			if(newspaperDetail.headline){
				builder.appendFormat("<div class='card-body'><h2 class='card-title'>{0}</h2>",newspaperDetail.headline);
			}
			if(newspaperDetail.headlineBody){
				builder.appendFormat("{0}</div>",newspaperDetail.headlineBody);
			}
			if(newspaperDetail.subedition){
				builder.appendFormat("<div class='card-body'>{0}</div>",newspaperDetail.subedition);
			}			
			if(newspaperDetail.importantNotice){
				if(newspaperDetail.headline||newspaperDetail.headlineBody||newspaperDetail.subedition){
					builder.append("<hr data-am-widget='divider' class='am-divider am-divider-default' />");
				}
				builder.appendFormat("<div class='card-body'><h2 class='card-title'>重要公告</h2>{0}</div>",newspaperDetail.importantNotice);
			}
			if(newspaperDetail.seatTable){
				if(newspaperDetail.headline||newspaperDetail.headlineBody||newspaperDetail.subedition||newspaperDetail.importantNotice){
					builder.append("<hr data-am-widget='divider' class='am-divider am-divider-default' />");
				}
				builder.append("<div class='card-body' id='seat-table'><h2 class='card-title'>座位表</h2></div>");	
			}
			$("#newspaper-content").append(builder.toString());
			if(newspaperDetail.seatTable){
				$("#seat-table").append(newspaperDetail.seatTable);
			}
			if(newspaperDetail.type == 1){
				$("#nv-footer").addClass("invisible");
				$("#nv-chatbar").removeClass("invisible");
			}
			$("#container").css({"height":$("#pageB .default").height()+100>$("html").height()?$("#pageB .default").height()+100+"px":$("html").height() });
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

</script>