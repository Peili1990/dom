<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default" id="select-character-three">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">请选择你的外在身份：</h2>
		</div>
		<div class="card-body">
			点击头像可以查看特权
			<ul class="am-avg-sm-3">
  				<li class="character-box">
  					<img src="http://app.qlogo.cn/mbloghead/e354d099f1137970f9e0/50">
  					<div class="radio-box">
  					<i class="am-icon-check-circle am-icon-md selected">朗斯特里特</i>
  					</div>
  					
  				</li>
  				<li class="character-box">
  					<img src="http://app.qlogo.cn/mbloghead/e354d099f1137970f9e0/50">
  					<div class="radio-box">
  					<i class="am-icon-circle-thin am-icon-md">普拉马逊斯</i>
  					</div>
  				</li>
 				<li class="character-box">
 					<img src="http://app.qlogo.cn/mbloghead/e354d099f1137970f9e0/50">
 					<div class="radio-box">
 					<i class="am-icon-circle-thin am-icon-md">叶什（妹）</i>
 					</div>
 				</li>
 			</ul>
		</div>
		<hr style="margin:0" class="am-divider am-divider-default" />
		<div class="card-body">
			是否选sp<input class="mui-switch mui-switch-animbg" type="checkbox">
		</div>
		<hr style="margin:0" class="am-divider am-divider-default" />
		<div class="card-body">
			是否申请先驱<input class="mui-switch mui-switch-animbg" type="checkbox">
		</div>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn"
				value="提交">
		</div>
	</div>
</div>

<div class="default" id="select-character-all" style="display:none">

</div>

<script type="text/javascript">

	function getCharacterList(characterSelect){
		if($("#select-character-three").is(":hidden")&&
				$("#select-character-all").is(":hidden")){
			var playerId = $("#player-id").val();
			var gameId = $("#game-id").val();
			if(characterSelect == 1){
				
			}
			else{
				getCharacterListThree(playerId,gameId);
			}
		}
	}

	function getCharacterListThree(playerId,gameId){
		var common = new Common();
		var url = getRootPath() + "/game/getCharacterListThree";
		var options = {
			playerId : playerId,
			gameId : gameId			
		}
		common.callAction(options, url, function(data) {
			
		})
	}


</script>