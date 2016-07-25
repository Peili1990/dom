<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">

	<div class="card">
		<div class="card-body">
			<form class="am-form">
				<fieldset>
					<legend>提交操作</legend>
					<span>当前第一夜，请提交你的操作：</span>
					<div class="group">
						<div class="group-body">
						<label>行动</label> 
						<input type="text" class="am-form-field" name="action"
							placeholder="行动+行动对象">
						</div>
						<div class="group-body">
						<label>特权</label> 
						<input type="text" class="am-form-field" name="privilege"
							placeholder="特权名+指定对象">
						</div>
						<div class="group-body">
						<label>投票</label> 
						<input type="text" class="am-form-field" name="vote"
							placeholder="投票对象">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn" onclick="submit(this)"
				style="width: 100%" value="提交">
		</div>
	</div>
</div>

<script type="text/javascript">

	function getOpreation(){
		var common = new Common();
		var url=getRootPath() + "/game/getPlayerOpreation";
		var options = {
				playerId : $("#player-id").val(),
		}
		common.callAction(options, url, function(data){
			if(!data){
				return;
			}
			switch (data.status){
			case 1:
				$("input[name='action']").val(data.opreation.action);
				$("input[name='privilege']").val(data.opreation.privilege);
				$("input[name='vote']").val(data.opreation.vote);
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

	function submit(btn){
		$(btn).attr("disabled","disabled");
		var action=$("input[name='action']").val().trim();
		var privilege=$("input[name='privilege']").val().trim();
		var vote=$("input[name='vote']").val().trim();
		if(action==""&&privilege==""&&vote==""){
			myAlert("请至少提交一项操作");
			return;
		}
		var common = new Common();
		var url=getRootPath() + "/game/submitOpreation";
		var options = {
				playerId : $("#player-id").val(),
				action : action,
				privilege : privilege,
				vote : vote
		}
		common.callAction(options, url, function(data){
			if(!data){
				return;
			}
			switch (data.status){
			case 1:
				myInfo("提交操作成功！",function(){
					window.location = getRootPath() + "/index";
				});
				return;
			case 0:
				timeoutHandle();
				return;
			default:
				myAlert(data.message);
				$(btn).removeAttr("disabled");
				return;
			}
		})
	}

</script>