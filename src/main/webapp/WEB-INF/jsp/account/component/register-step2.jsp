<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="am-input-group">
	<span class="am-input-group-label"><i
		class="am-icon-magic am-icon-fw"></i></span> <input type="text"
		class="am-form-field" id="nickName" placeholder="昵称">
</div>
<div class="am-input-group">
	<span class="am-input-group-label"><i
		class="am-icon-paper-plane am-icon-fw"></i></span> <input type="text"
		class="am-form-field" id="invCode" placeholder="邀请码（选填）">
</div>
<input type="button" class="am-btn am-btn-primary" onclick="gotoStepOne()"
	value="上一步">
<input type="button" class="am-btn am-btn-danger"
	onclick="register()" value="注册">