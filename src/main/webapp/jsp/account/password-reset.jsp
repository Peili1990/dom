<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<link rel="stylesheet" href="css/account/account.css">
<title>维多利亚的噩梦登录</title>
</head>
<body>
	<div class="bg-top"></div>
	<form class="wrapper" method="post" id="resetPwdForm">
		<section id="container">
    		<!-- view container -->
   			<ul id="pages" class="view-container">
      			<!-- pageA container -->
     			<li id="pageA" class="page-container">
					<div class="am-input-group">
						<span class="am-input-group-label"><i
							class="am-icon-user am-icon-fw"></i></span> <input type="text"
							class="am-form-field" id="userName" disabled="disabled" value="${email}">
					</div>
					<div class="am-input-group">
						<span class="am-input-group-label"><i
							class="am-icon-lock am-icon-fw"></i></span> <input type="password"
							class="am-form-field" id="userPwd" placeholder="新密码">
					</div>
					<input type="button" class="am-btn am-btn-defalut" style="width:100%" onclick="resetPassword()" value="提交">
				</li>
    		</ul>  
  		</section>
	</form>	
	<div class="bg-bottom"></div>
	<script src="js/account/login.js" type="text/javascript"></script>	
</body>
</html>