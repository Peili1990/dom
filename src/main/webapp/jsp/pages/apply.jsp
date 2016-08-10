<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default" id="game-apply-panel">
	
</div>

<script type="text/javascript">
	
	function getApplyingGames(){
		var panel = $("#game-apply-panel");
		if (panel.children().length == 0) {
			var common = new Common();
			var url = getRootPath() + "/game/getApplyingGames";
			common.callAction(null, url, function(data) {
				if(!data){
					return;
				}
				switch (data.status){
				case 1:
					var games = data.applyingGames;
					if(games.length>0){
						panel.empty();
						$.each(games,function(index,game){
							var builder = new StringBuilder();
							builder.append('<div class="card"><div class="card-header"><h2 class="card-title">版杀信息</h2></div>');
							builder.append('<div class="card-body">');
							builder.appendFormat('{0}<br>法官配置：',game.gameDesc);
							$.each(game.judgers,function(index,judger){
								builder.appendFormat('{0} ',judger);
							})
							builder.appendFormat('<br>人数配置：{0}人（当前已报{1}人）<br>', game.playerNum, game.playCurNum);
							builder.appendFormat('预计开版时间：{0} <br> 角色选取方式：',game.startDate);
							builder.appendFormat(game.characterSelect=="A" ? '个人选取</div>':'3选1</div>');
							builder.append('<input type="button" class="am-btn am-btn-secondary sumbit-btn"style="width: 100%" value="我要报名"');
							builder.appendFormat('onclick=apply({0},"{1}",{2},this)></div>',game.id,game.characterSelect,game.playerNum);
							panel.append(builder.toString());
							adjustContainerHeight("#pageF");
						})
					} else {
						myInfo("暂无版杀信息",function(){
							$(".am-header-left").find("i").click();
						});
					}
					return;
				case 0:
					timeoutHandle();
					return;
				default:
					myAlert(data.message);
					return;
				}		
			});
		}
	}
	
	function apply(gameId,characterSelect,playerNum,btn){
		$(btn).attr("disabled","disabled");
		var common = new Common();
		var url = getRootPath() + "/game/apply";
		var options = {
			gameId : gameId,
			playerNum : playerNum,
			characterSelect : characterSelect
		}
		common.callAction(options, url, function(data) {
			if(!data){
				$(btn).removeAttr("disabled");
				return;
			}
			switch (data.status) {
			case 1:
				myInfo("恭喜，报名成功！",function(){
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
		});	
		
	}
</script>