<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<input type="button" class="am-btn am-btn-primary" onclick="login()"
	value="登录">
<input type="button" class="am-btn am-btn-danger"
	onclick="gotoStepTwo()" value="下一步">