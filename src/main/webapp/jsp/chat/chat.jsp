<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<link rel="stylesheet" href="${baseUrl}css/chat/chat.css">
<title>维多利亚的噩梦</title>
</head>
<body>	
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<section id="container">
    <!-- view container -->
    <ul id="pages" class="view-container">
      <!-- pageA container -->
      <li id="pageA" class="page-container" style="display:block"> 
		 <jsp:include page="chat-all.jsp"></jsp:include>
      </li>
      <li id="pageB" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="chat-detail.jsp"></jsp:include>
      </li>
    </ul>   
  </section>
   <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

	<script type="text/javascript">
	
	$(function(){
		adjustContainerHeight(getCurActPage());
		$("#nv-footer li:eq(3)").addClass("visiting");
	}) 
		
	</script>
	
</html>