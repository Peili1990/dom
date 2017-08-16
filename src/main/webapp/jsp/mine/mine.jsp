<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<jsp:include page="../layout/photoclip.jsp"></jsp:include>
<link rel="stylesheet" href="${baseUrl}css/mine/mine.css">
<script src="${baseUrl}js/mine/mine.js"type="text/javascript"></script>
<title>用户中心</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<section id="container">
	<ul id="pages" class="view-container">
      <!-- pageA container -->
      <li id="pageA" class="page-container" style="display:block"> 
		 <jsp:include page="mine-index.jsp"></jsp:include>
      </li>
      <li id="pageB" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="mine-photoclip.jsp"></jsp:include>
      </li>
      <li id="pageC" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="mine-profile.jsp"></jsp:include>
      </li>
      <li id="pageD" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="mine-essay.jsp"></jsp:include>
      </li>
      <li id="pageE" class="page-container" style="left:200%;display:none"> 
		 <jsp:include page="mine-card-detail.jsp"></jsp:include>
      </li>
      <li id="pageF" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="mine-data.jsp"></jsp:include>
      </li>
      <li id="pageG" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="mine-pwdchange.jsp"></jsp:include>
      </li>
      <li id="pageH" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="mine-card.jsp"></jsp:include>
      </li>
      <li id="pageI" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="mine-badge.jsp"></jsp:include>
      </li>
    </ul>   
	</section>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
<script>
$(function(){
	adjustContainerHeight(getCurActPage());
	$("#nv-footer li:eq(4)").addClass("visiting");
	$("#options-list").append("<li onclick='showPwdChange()'><a>修改密码</a></li>")
}) 
</script>
</body>
</html>