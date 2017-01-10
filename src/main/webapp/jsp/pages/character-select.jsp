<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default">
	<div class="invisible" id="select-character-all">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">请选择你的外在身份：</h2>
			</div>
			<div class="card-body">
				<div class="group-body">
					<div class="am-input-group am-input-group-primary">
						<span class="am-input-group-label">角色</span>
						<input type="text" id="target_select_dummy" class="am-form-field">
  						<select id="target_select">	
						</select>				
					</div>
					<img src="" class="am-comment-avatar">
					<div class="chosen invisible"></div>				
				</div>
				<hr style="margin:0" class="am-divider am-divider-default" />
				<div class="card-body">
					是否选sp<input id="is-sp-all" class="mui-switch mui-switch-animbg" type="checkbox">
				</div>
				<hr style="margin:0" class="am-divider am-divider-default" />
				<div class="card-body">
					是否申请先驱<input id="apply-pioneer-all" class="mui-switch mui-switch-animbg" type="checkbox">
				</div>
				<hr style="margin:0" class="am-divider am-divider-default" />
				<div class="card-body">
					是否使用卡片<input id="use-card-all" class="mui-switch mui-switch-animbg" type="checkbox">
				</div>
				<div class="invisible" id="use-card">
					<div class="card-body invisible" id="card-not-available">
						你没有可以使用的卡片
					</div>
					<div class="card-body invisible" id="card-available">
						使用    <i class="am-icon-circle-thin am-icon-md invisible" id="identity-card-available">身份卡</i>
						<i class="am-icon-circle-thin am-icon-md invisible" id="camp-card-available">阵营卡</i>
						<i class="am-icon-circle-thin am-icon-md invisible" id="privilege-card-available">特权卡</i>			
						<i class="am-icon-circle-thin am-icon-md invisible" id="pioneer-card-available">先驱卡</i>
					</div>
					<div class="card-body invisible" id="use-camp-card">
						<div class="am-input-group am-input-group-primary">
							<span class="am-input-group-label">选择阵营</span>
							<input type="text" id="camp_select_dummy" class="am-form-field">
  							<select id="camp_select">
  								<option value ="1">好人方</option>
  								<option value ="2">杀手方</option>
							</select>				
						</div>
					</div>
					<div class="card-body invisible" id="use-identity-card">
						<div class="am-input-group am-input-group-primary">
							<span class="am-input-group-label">选择身份</span>
							<input type="text" id="identity_select_dummy" class="am-form-field">
  							<select id="identity_select">
  								<option value ="-1">警察</option>
  								<option value ="10">官员</option>
  								<option value ="8">刺客</option>
  								<option value ="9">医生</option>
  								<option value ="7">牧师</option>
  								<option value ="11">平民</option>
  								<option value ="99">杀手</option>
  								<option value ="22">暴徒</option>
  								<option value ="20">间谍</option>
  								<option value ="19">小偷</option>
  								<option value ="21">巫师</option>
  								<option value ="23">帮众</option>
							</select>				
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="group">
			<div class="group-body">
				<input type="button" class="am-btn am-btn-secondary sumbit-btn"
					value="提交" onclick="selectCharacter()">
			</div>
		</div>
	</div>
	
	<div class="invisible" id="select-character-three">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">请选择你的外在身份：</h2>
			</div>
			<div class="card-body">
				<ul class="am-avg-sm-3">
  			
 				</ul>
			</div>
			<hr style="margin:0" class="am-divider am-divider-default" />
			<div class="card-body">
				是否选sp<input id="is-sp" class="mui-switch mui-switch-animbg" type="checkbox">
			</div>
			<hr style="margin:0" class="am-divider am-divider-default" />
			<div class="card-body">
				是否申请先驱<input id="apply-pioneer" class="mui-switch mui-switch-animbg" type="checkbox">
			</div>
		</div>
		<div class="group">
			<div class="group-body">
				<input type="button" class="am-btn am-btn-secondary sumbit-btn"
					value="提交" onclick="selectCharacter()">
			</div>
		</div>
	</div>
	
	<input type="hidden" id="selected-character"/>
	
</div>

<script type="text/javascript">

	$(function(){
		$('#camp_select').val('').scroller('destroy').scroller(
		        $.extend({preset : 'select'}, { 
		             theme:'android-ics light', 
		              mode:'scroller', 
		           display:'bottom', 
		              lang:'zh'
		        })
		);
		$('#identity_select').val('').scroller('destroy').scroller(
		        $.extend({preset : 'select'}, { 
		             theme:'android-ics light', 
		              mode:'scroller', 
		           display:'bottom', 
		              lang:'zh'
		        })
		);
	})

	function getCharacterList(characterSelect){
		if($("#select-character-three").hasClass("invisible")&&
				$("#select-character-all").hasClass("invisible")){
			if(characterSelect == 1){			
				getCharacterListAll();
				queryUserCard();
			}
			else if(characterSelect == 3){
				myInfo("修改外在身份时，不可撤销已使用卡片或使用额外的卡片！");
				$("#use-card-all").parent().addClass("invisible").prev().addClass("invisible");
				getCharacterListAll();
			}	
			else {
				getCharacterListThree();
			}
		}
	}
	
	function getCharacterListAll(){
		$.get('${baseUrl}file/character-list.json',function(data){
			$.each(data.characters,function(index,character){
				$("#target_select").append("<option value='"+character.characterId+"'>"+character.characterName+"</option>");
			})
			$('#target_select').val('').scroller('destroy').scroller(
		        $.extend({preset : 'select'}, { 
		             theme:'android-ics light', 
		              mode:'scroller', 
		           display:'bottom', 
		              lang:'zh'
		        })
			);
			$("#select-character-all").removeClass("invisible");
			adjustContainerHeight(getCurActPage());
			$("#target_select").change(function(){
				queryCharacter();
				var index = $("#target_select option:selected").val()-1;
				$("#select-character-all").find("img").attr("src",picServer+data.characters[index].avatar);
				$("#is-sp-all")[0].checked = false;
				$("#is-sp-all").attr("disabled",data.characters[index].hasSp==1?false:true);
				$("#selected-character").val(data.characters[index].characterId);
			})
		})
	}
	
	function queryUserCard(){
		var url = getRootPath() + "/getUserCardStatus";
		var common = new Common();
		common.callAction(null,url,function(data){
			if(!data){
				return;
			}
			switch(data.status){
			case 1:
				if(data.cardNum.length == 0){
					$("#card-not-available").removeClass("invisible");
				} else {
					$("#card-available").removeClass("invisible");
					$.each(data.cardNum,function(index,cardType){
						switch(cardType){
						case 1:
							$("#identity-card-available").removeClass("invisible");
							break;
						case 2:
							$("#camp-card-available").removeClass("invisible");
							break;
						case 3:
							$("#privilege-card-available").removeClass("invisible");
							break;
						case 4:
							$("#pioneer-card-available").removeClass("invisible");
							break;
						}
					})
				}							
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
	
	function queryCharacter(){
		if((!$("#use-card").hasClass("invisible")) && $("#privilege-card-available").hasClass("selected")){
			$(".chosen").addClass("invisible");
			return;
		}
		var url = getRootPath() + "/game/queryCharacter";
		var options = {
				characterId : $("#target_select option:selected").val()
		}
		var common = new Common();
		common.callAction(options,url,function(data){
			if(!data){
				return;
			}
			switch(data.status){
			case 1:
				if(data.isChosen=="1"){
					$(".chosen").removeClass("invisible");
				}else {
					$(".chosen").addClass("invisible");
				}
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

	function getCharacterListThree(){
		var common = new Common();
		var url = getRootPath() + "/game/getCharacterListThree";
		common.callAction(null, url, function(data) {
			if(!data){
				return;
			}
			switch (data.status){
			case 1:
				var characters = data.characters;
				if(characters.length>0){
					$.each(characters,function(index,character){
						var builder = new StringBuilder();
						builder.append('<li class="character-box">');
						builder.appendFormat('<img src="{0}">',picServer+character.avatar);
						builder.append('<div class="radio-box">');
						builder.appendFormat('<input type="hidden" value="{0}">',character.id);
						builder.appendFormat('<i class="am-icon-circle-thin am-icon-md">{0}</i>',character.name);
						builder.appendFormat('<input type="hidden" value="{0}">',character.hasSp);
						builder.append('</div></li>');
						$("#select-character-three").find("ul").append(builder.toString());
					})
					$.each($("#select-character-three i"),function(){
							$(this).click(function(){
							$("#select-character-three i").removeClass("selected").removeClass("am-icon-check-circle");
							$(this).addClass("selected").addClass("am-icon-check-circle");
							$("#is-sp")[0].checked = false;
							$("#is-sp").attr("disabled",$(this).next().val()=="1"?false:true);
							$("#selected-character").val($(this).prev().val());
						})
					})
					$("#select-character-three").removeClass("invisible");
					adjustContainerHeight(getCurActPage());
				} else {
					myInfo("其他玩家正在选择角色，请耐心等待",function(){
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
		})
	}
	
	function selectCharacter(){
		var characterId = $("#selected-character").val();
		if(characterId == ""){
			myAlert("请选择角色");
			return;
		}
		var isSp;
		var applyPioneer;
		var useCard = 0;
		var sign;
		var camp;
		if($("#select-character-all").hasClass("invisible")){
			isSp = $("#is-sp").is(":checked") ? "1":"0";
			applyPioneer = $("#apply-pioneer").is(":checked") ? "1":"0";			
		} else {
			isSp = $("#is-sp-all").is(":checked") ? "1":"0";
			applyPioneer = $("#apply-pioneer-all").is(":checked") ? "1":"0";
			if($("#use-card-all").is(":checked")){
				if($("#identity-card-available").hasClass("selected")){
					useCard = 1;
					sign = $("#identity_select option:selected").val();
					if(!sign){
						myAlert("请选择身份");
						return;
					}
				}
				if($("#camp-card-available").hasClass("selected")){
					useCard = 2;
					camp = $("#camp_select option:selected").val();
					if(!camp){
						myAlert("请选择阵营");
						return;
					}					
				}
				if($("#privilege-card-available").hasClass("selected")){
					useCard = 3;
				}
				if($("#pioneer-card-available").hasClass("selected")){
					useCard = 4;
					camp = 1;
					sign = 12;
					applyPioneer = "1";
				}
			}
		}
		var url = getRootPath()+"/game/selectCharacter";
		var options = {
			characterId : characterId,
			isSp : isSp,
			applyPioneer : applyPioneer,
			useCard : useCard,
			sign : sign,
			camp : camp
		};
		var common = new Common();
		common.callAction(options, url, function(data) {
			if (!data) {
				myAlert("系统或网络异常");
				return;
			}
			switch (data.status) {
			case 1:
				myInfo("角色选择成功！",function(){
					window.location = getRootPath() + "/index";
				});
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
	
	$("#use-card-all").change(function(){
		if($(this).is(":checked")){
			$("#use-card").removeClass("invisible");
		}else {
			$("#use-card").addClass("invisible");
		}
		queryCharacter();
		adjustContainerHeight(getCurActPage());
	})
	
	$("#identity-card-available").click(function(){
		$("#card-available i").removeClass("selected").removeClass("am-icon-check-circle");
		$(this).addClass("selected").addClass("am-icon-check-circle");
		$("#use-camp-card").addClass("invisible");
		$("#use-identity-card").removeClass("invisible");
		queryCharacter();
	})
	
	$("#camp-card-available").click(function(){
		$("#card-available i").removeClass("selected").removeClass("am-icon-check-circle");
		$(this).addClass("selected").addClass("am-icon-check-circle");
		$("#use-camp-card").removeClass("invisible");
		$("#use-identity-card").addClass("invisible");
		queryCharacter();
	})
	
	$("#privilege-card-available").click(function(){
		$("#card-available i").removeClass("selected").removeClass("am-icon-check-circle");
		$(this).addClass("selected").addClass("am-icon-check-circle");
		$("#use-camp-card").addClass("invisible");
		$("#use-identity-card").addClass("invisible");		
		queryCharacter();
	})
	
	$("#pioneer-card-available").click(function(){
		$("#card-available i").removeClass("selected").removeClass("am-icon-check-circle");
		$(this).addClass("selected").addClass("am-icon-check-circle");
		$("#use-camp-card").addClass("invisible");
		$("#use-identity-card").addClass("invisible");
		$("#apply-pioneer-all")[0].checked = true;
		queryCharacter();
	})
	

</script>