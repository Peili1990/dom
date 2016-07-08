<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<link rel="stylesheet" href="css/account/account.css">
<jsp:include page="../layout/common.jsp"></jsp:include>
<title>维多利亚的噩梦登录</title>
</head>
<body>
	<form action="${ baseUrl }account/loginAction" class="wrapper" method="post" id="loginForm">
		<div class="am-input-group">
			<span class="am-input-group-label"><i
				class="am-icon-user am-icon-fw"></i></span> <input type="text"
				class="am-form-field" id="userName" placeholder="Username">
		</div>
		<div class="am-input-group">
			<span class="am-input-group-label"><i
				class="am-icon-lock am-icon-fw"></i></span> <input type="password"
				class="am-form-field" id="userPwd" placeholder="Password">
		</div>
		<input type="button" class="am-btn am-btn-primary" onclick="submitForm()" value="登录">
		<input type="button" class="am-btn am-btn-danger" onclick="register()" value="注册">
	</form>
	<script src="js/account/login.js" type="text/javascript"></script>	
</body>
</html>