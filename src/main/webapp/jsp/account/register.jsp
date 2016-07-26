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
	<form action="${ baseUrl }account/registerAction" class="wrapper"
		method="post" id="registerForm">
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
		<div class="am-input-group">
			<span class="am-input-group-label"><i
				class="am-icon-pencil-square am-icon-fw"></i></span> <input type="text"
				class="am-form-field" id="nickName" placeholder="Nickname">
		</div>
		<input type="button" class="am-btn am-btn-primary" onclick="login()"
			value="登录"> <input type="button" class="am-btn am-btn-danger"
			onclick="register(this)" value="注册">
	</form>
	<div class="bg-bottom"></div>
	<script src="js/account/register.js" type="text/javascript"></script>
</body>
</html>