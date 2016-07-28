<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<c:forEach items="${ newspaperList }" var="newspaper">
	 	<div class="card" onclick="pageSwitch('#pageA','#pageB','getNewspaperDetail(${newspaper.newspaperId})')">
			<div class="card-header">
				<h2 class="card-title">${newspaper.header }</h2>
			</div>
		</div>
	</c:forEach>
</div>
