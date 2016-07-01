<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/index.css">
<jsp:include page="layout/common.jsp"></jsp:include>
<title>维多利亚的噩梦</title>
</head>
<body>	
	<jsp:include page="layout/header.jsp"></jsp:include>
	<section id="container">
    <!-- view container -->
    <ul id="pages" class="view-container" style="transform: translate3d(-200%, 0px, 0px); transition: 300ms;">
      <!-- pageA container -->
      <li id="pageA" class="page-container"> 
      	<jsp:include page="pages/welcome.jsp"></jsp:include> 
      </li>
    </ul>
   
  </section>
   <jsp:include page="layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="js/index.js"></script>
	<script>
	
        var btnNext1 = $('#btnNext1');
        var btnNext2 = $('#btnNext2');
        var pageBack = $('#pageBack');
        var pages = $('#pages');
        var pageA = $('#pageA');
        var pageB = $('#pageB');
        var pageC = $('#pageC');

        $("#container").css({"height":$(".default").height()+90+"px"});
        
        btnNext1.click(function(){
            pages.css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
            pageA.css({'display' : 'none'});
            pageB.css({'display' : 'block'});
            pageC.css({'display' : 'none'});
        });

        btnNext2.click(function(){
            pages.css({'-webkit-transform' : 'translate3d(-200%, 0px, 0px)' , '-webkit-transition' : '300ms'});
            pageA.css({'display' : 'none'});
            pageB.css({'display' : 'none'});
            pageC.css({'display' : 'block'});
        });
        pageBack.click(function(){
            pages.css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
            pageA.css({'display' : 'none'});
            pageB.css({'display' : 'block'});
            pageC.css({'display' : 'none'});
        });
  </script>
</body>
</html>