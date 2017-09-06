<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default" >
	<div class="group">
		<div class="group-body">
			<label>修改个性签名</label>
			<input type="text" value="${user.motto}" id="motto-edit">
		</div>
		<div class="group-body">
			<label>修改QQ</label>
			<input type="text" value="${user.qq}" id="qq-edit">
		</div>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn"
				value="提交" onclick="updateProfile()">
		</div>
	</div>
</div>

<script type="text/javascript">

function updateProfile(){
	var motto = $("#motto-edit").val().trim();
	if(motto == ""){
		motto="这个人很懒，什么都没写";
	}
	var qq = $("#qq-edit").val().trim();
	var url = getRootPath() + "/updateProfile";
	var options = {
			motto : motto,
			qq : qq
	}
	var common = new Common();
	common.callAction(options, url, function(data) {
		myInfo("修改成功！",function(){
			$("#user-motto").text(data.motto);
			$("#icon-arrow-1").click();
		})		
	})
	
}

</script>
