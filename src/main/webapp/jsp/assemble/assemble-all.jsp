<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default" id="newspaper-list">
	<c:forEach items="${ newspaperList }" var="newspaper" varStatus="newspaperNo">
	 	<div class="card" onclick="pageSwitch('#pageA','#pageB','getNewspaperDetail(${newspaper.newspaperId},${newspaperNo.index})')">
			<div class="card-header">
				<h2 class="card-title">${newspaper.header }</h2>
				<span class="badge badge-alert badge-rounded badge-card"></span>
				<input type="hidden" name="newspaper-id" value="${ newspaper.newspaperId }">
			</div>
		</div>
	</c:forEach>
	<c:if test="${ replayEssay!=null }">
		<div class="card" onclick="pageSwitch('#pageA','#pageC')">
			<div class="card-header">
				<h2 class="card-title">${replayEssay.header }</h2>
			</div>
		</div>
	</c:if>
</div>

<script type="text/javascript">

$(function(){
	setRedspotOnpaper();
	var newspaperId = GetQueryString("newspaperId");
	if(newspaperId){
		$.each($("#newspaper-list .card"),function(index,newspaper){
			if($(newspaper).find("input[name='newspaper-id']").val()==newspaperId){
				$(newspaper).click();
				return false;
			}
		})
	}
});

function setRedspotOnpaper(){
	$.each($("#newspaper-list .card"),function(index,newspaper){
		newspaperId = $(newspaper).find("input[type='hidden']").val();
		if(newspaperId){
			newspaperSpeech = getCache("nv_newspaper"+newspaperId);
			redspot = $(newspaper).find(".badge");
			if(newspaperSpeech>0){		
				redspot.text(newspaperSpeech).removeClass("invisible");
			}else{
				redspot.addClass("invisible");
			}
		}
	})
}

</script>

