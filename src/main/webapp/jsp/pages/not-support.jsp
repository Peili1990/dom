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
		<p>您的浏览器不支持HTML5本地数据库，无法访问《维多利亚的噩梦》，推荐使用谷歌Chrome浏览器</p>
	</div>		
	
  <script>
  
	$(function(){
		$.get('${baseUrl}file/character-list.json',function(data){
			var rand = parseInt(Math.random()*(data.characters.length-1));
			$(".nv-guide img").attr("src",picServer+data.characters[rand].avatar);
		})
	})
        
  </script>
</body>
</html>