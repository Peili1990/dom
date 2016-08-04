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
			</div>
		</div>
	</c:forEach>
</div>
