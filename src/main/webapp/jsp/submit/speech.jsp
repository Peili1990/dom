<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
        $(function () {
            $(function () {
                $('#speaker_select').val('').scroller('destroy').scroller($.extend({preset : 'select'}, { theme:'android-ics light', mode:'scroller', display:'bottom', lang:'zh'}));
            });
        });
</script>
<div class="default">
	<div class="group">
		<div class="group-body">
			<textarea name="message" placeholder="说点什么吧…"></textarea>
			<div class="am-input-group am-input-group-primary">
				<span class="am-input-group-label"> 请选择发言者</span> <input type="text"
					id="speaker_select_dummy" class="am-form-field"> <select
					id="speaker_select">
					<option value="1">李</option>
					<option value="1">莫利</option>
				</select>
			</div>
			<input type="button" class="am-btn am-btn-secondary sumbit-btn"
				value="提交">
		</div>
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
	</ul>
</div>

