<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default" id="newspaper-list">
	<c:forEach items="${ newspaperList }" var="newspaper" varStatus="newspaperNo">
	 	<div class="card" onclick="pageSwitch('#pageA','#pageB','getNewspaperDetail(${newspaper.newspaperId},${newspaperNo.index})')">
			<div class="card-header">
				<h2 class="card-title">${newspaper.header }</h2>
				<span class="badge badge-alert badge-rounded badge-card
				 <c:if test="${ newspaper.unreadSpeech == 0}"> 
				 	invisible
				 </c:if>
				">${ newspaper.unreadSpeech }</span>
				<input type="hidden" name="newspaper-id" value="${ newspaper.newspaperId }">
			</div>
		</div>
	</c:forEach>
</div>

<script type="text/javascript">

$(function(){
	setRedspotOnpaper();
});

function setRedspotOnpaper(newspaperId){
	if(newspaperId>0){
		$.each($("#newspaper-list .card"),function(index,newspaper){
			if($(newspaper).find("input[type='hidden']").val() == newspaperId){
				redspot = $(newspaper).find(".badge");
				if(redspot.hasClass("invisible")){
					redspot.text("1").removeClass("invisible");
				}else{
					redspot.text(parseInt(redspot.text())+1);
				}
			}
		})
	}else{
		$.each($("#newspaper-list .card"),function(index,newspaper){
			newspaperId = $(newspaper).find("input[type='hidden']").val();
			newspaperSpeech = getCache("nv_newspaper"+newspaperId);
			if(newspaperSpeech>0){
				redspot = $(newspaper).find(".badge");
				if(redspot.hasClass("invisible")){
					redspot.text(newspaperSpeech).removeClass("invisible");
				}else{
					redspot.text(parseInt(newspaperSpeech)+parseInt(redspot.text()));
				}
			}
		})
	}
}

</script>

