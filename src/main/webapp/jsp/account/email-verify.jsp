<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<c:choose>
			<c:when test="${status == 1}">
				<p>邮箱验证成功，请<a class="nv-link" id="open-window">点击此处</a>打开新窗口</p>
			</c:when>
			<c:otherwise>
				<p>验证失败，失败原因：${message}。<a class="nv-link" onclick="resendEmail('${email}')">重新发送验证邮件</a></p>
			</c:otherwise>
		</c:choose>
		
	</div>		
	
  <script>
  
  	$(function(){
  		showNVguide();
  	})
  
  	$("#open-window").click(function(){
  		window.open(getRootPath()+"/index?type=mobile", '', 'top=0,left=0,width=400,height=650,location=yes,menubar=no,resizable=no,scrollbars=yes,status=no,toolbar=no');	
  	})
  	
  
	function resendEmail(email) {
		var url = "resendmail";
		var options = {
			email : email
		}
		var common = new Common();
		common.callAction(options, url, function(data) {
			if (!data) {
				return;
			}
			switch (data.status) {
			case 1:
				myInfo("邮件发送成功，点击确定立即验证", function() {
					gotoemail(data.email);
				})
				return;
			default:
				myAlert(data.message);
				return;
			}
		})
	}
  </script>
</body>
</html>