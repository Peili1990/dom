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
	
	<section>
    <!-- view container -->
    <ul id="pages" class="view-container" style="">
      <!-- pageA container -->
      <li id="pageA" class="page-container" style="display: block;"> 
        <jsp:include page="layout/header.jsp"></jsp:include>
        <b id="btnNext1" class="page-num">A</b> 
      </li>
      <!-- pageB container -->
      <li id="pageB" class="page-container" style="display: none;"> <jsp:include page="layout/header.jsp"></jsp:include> <b id="btnNext2" class="page-num">B</b></li>
    </ul>
  
  </section>
	<script type="text/javascript" src="js/index.js"></script>
	<script>
        var btnNext1 = $('#btnNext1');
        var btnNext2 = $('#btnNext2');
        var pages = $('#pages');
        var pageA = $('#pageA');
        var pageB = $('#pageB');

        btnNext1.click(function(){
            pageB.css({'display' : 'block'});
            pageB.addClass('animatestart sliderightin');            

            setTimeout(function(){ //动画结束时重置class
              pageA.css({'display' : 'none'});  
              pageB.removeClass('animatestart sliderightin');
            }, 350);          
        });

        btnNext2.click(function(){
            pageA.css({'display' : 'block'});
            pageA.addClass('animatestart sliderightin');            

            setTimeout(function(){ //动画结束时重置class
              pageB.css({'display' : 'none'}); 
              pageA.removeClass('animatestart sliderightin');
            }, 350);   
        });
       
  </script>
</body>
</html>