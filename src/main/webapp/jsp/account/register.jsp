<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<link rel="stylesheet" href="css/account/account.css">
<title>维多利亚的噩梦注册</title>
</head>
<body>
	<div class="bg-top"></div>
	<form action="${ baseUrl }account/registerAction" method="post">
		<section id="container">
    		<!-- view container -->
   			<ul id="pages" class="view-container">
      			<!-- pageA container -->
     			<li id="pageA" class="page-container"> 
      			<jsp:include page="component/register-step1.jsp"></jsp:include> 
     			</li>
      			<li id="pageB" class="page-container" style="left:100%;display:none"> 
      			<jsp:include page="component/register-step2.jsp" ></jsp:include> 
      			</li>
    		</ul>  
  		</section>
	</form>
	<div class="bg-bottom"></div>
	<script src="js/account/register.js" type="text/javascript"></script>
</body>
</html>