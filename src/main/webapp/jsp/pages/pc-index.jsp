<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<link rel="stylesheet" href="css/index.css">
<title>维多利亚的噩梦</title>
</head>
<body>
	<div class="nv-guide">
		<img src="">
		<p>检测你使用了电脑访问了《维多利亚的噩梦》，请<a class="nv-link">点击此处</a>打开新窗口</p>
	</div>		
	
  <script>
  
  	$(function(){
  		$.get('${baseUrl}file/character-list.json',function(data){
  			var rand = parseInt(Math.random()*(data.characters.length-1));
  			$(".nv-guide img").attr("src",picServer+data.characters[rand].avatar);
  		})
  	})
  
  	$(".nv-link").click(function(){
  		setCookie("nv_screen_width","400","1h");
  		window.open(getRootPath()+"/index?type=mobile", '', 'top=0,left=0,width=400,height=650,location=yes,menubar=no,resizable=no,scrollbars=yes,status=no,toolbar=no');	
  	})
        
  </script>
</body>
</html>