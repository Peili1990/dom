<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default" >
	<div class="group">
		<div class="group-body">
			<label>旧密码</label>
			<input type="password" id="old-password">
		</div>
		<div class="group-body">
			<label>新密码</label>
			<input type="password" id="new-password">
		</div>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn"
				value="提交" onclick="changePassword()">
		</div>
	</div>
</div>

<script type="text/javascript">

function showPwdChange(){
	$("#icon-options").dropdown('close');
	while(getCurActLevel()>0){
		$("#icon-arrow-"+getCurActLevel()).click();
	}
	pageSwitch(getCurActPage(),"#pageG",getCurActLevel(),1);
}

function changePassword(){
	var oldPassword = $("#old-password").val().trim();
	var newPassword = $("#new-password").val().trim();
	if(oldPassword==""){
		myAlert("旧密码不能为空");
	}
	if(newPassword==""){
		myAlert("新密码不能为空");
	}
	var url = getRootPath() + "/account/pwdChangeAction";
	var options = {
			oldPassword : oldPassword,
			newPassword : newPassword
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			myInfo("密码修改成功！请牢记新密码",function(){
				$("#icon-arrow-1").click();
			})
			return;
		case 0:
			timeoutHandle();
			return;
		default:
			myAlert(data.message);
			return;
		}
	})
	
	
}


</script>