<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login/login.css">
<title>纯爷们地下城登录</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="wrapper">
		<div class="am-input-group">
			<span class="am-input-group-label"><i
				class="am-icon-user am-icon-fw"></i></span> <input type="text"
				class="am-form-field" placeholder="Username">
		</div>

		<div class="am-input-group">
			<span class="am-input-group-label"><i
				class="am-icon-lock am-icon-fw"></i></span> <input type="password"
				class="am-form-field" placeholder="Password">
		</div>

		<input type="button" class="am-btn am-btn-primary" value="登录">
		<input type="button" class="am-btn am-btn-danger" value="注册">

	</div>

</body>
</html>