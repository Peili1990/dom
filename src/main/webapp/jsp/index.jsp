<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="layout/common.jsp"></jsp:include>
<link rel="stylesheet" href="css/index.css">
<title>维多利亚的噩梦</title>
</head>
<body>	
	<jsp:include page="layout/header.jsp"></jsp:include>
	<section id="container">
    <!-- view container -->
    <ul id="pages" class="view-container">
      <!-- pageA container -->
      <li id="pageA" class="page-container"> 
      	<jsp:include page="pages/welcome.jsp"></jsp:include> 
      </li>
      <li id="pageB" class="page-container" style="left:100%;display:none"> 
      	<jsp:include page="pages/submit.jsp" ></jsp:include> 
      </li>
      <li id="pageC" class="page-container" style="left:100%;display:none"> 
      	<jsp:include page="submit/action.jsp" ></jsp:include> 
      </li>
      <li id="pageD" class="page-container" style="left:100%;display:none"> 
      	<jsp:include page="submit/vote.jsp" ></jsp:include> 
      </li>
      <li id="pageE" class="page-container" style="left:100%;display:none"> 
      	<jsp:include page="submit/speech.jsp" ></jsp:include> 
      </li>
      <li id="pageF" class="page-container" style="left:100%;display:none"> 
      	<jsp:include page="pages/apply.jsp" ></jsp:include> 
      </li>
      <li id="pageG" class="page-container" style="left:100%;display:none"> 
      	<jsp:include page="pages/character-select.jsp" ></jsp:include> 
      </li>
    </ul>
   
  </section>
   <jsp:include page="layout/footer.jsp"></jsp:include>
	<script>

	$(function(){
		adjustContainerHeight("#pageA");
	}) 
        
  </script>
</body>
</html>