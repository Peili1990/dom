<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/index.css">
<jsp:include page="../layout/common.jsp"></jsp:include>
<title>维多利亚的噩梦</title>
</head>
<body>	
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<section id="container">
    <!-- view container -->
    <ul id="pages" class="view-container">
      <!-- pageA container -->
      <li id="pageA" class="page-container" style="display:block"> 
		 <jsp:include page="assemble-all.jsp"></jsp:include>
      </li>
      <li id="pageB" class="page-container" style="left:100%;display:none"> 
		 <jsp:include page="assemble-day.jsp"></jsp:include>
      </li>
    </ul>   
  </section>
   <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

	<script type="text/javascript" src="${baseUrl}js/assemble/assemble.js"></script>
	
</html>