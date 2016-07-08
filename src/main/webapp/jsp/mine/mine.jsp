<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<link rel="stylesheet" href="css/mine/mine.css">
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
      
    </ul>   
	</section>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>