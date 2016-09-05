<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default invisible" id="select-character-three">
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
				value="提交" onclick="selectCharacter(this)">
		</div>
	</div>
</div>

<div class="default invisible" id="select-character-all">
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
			</div>
			<hr style="margin:0" class="am-divider am-divider-default" />
			<div class="card-body">
				是否选sp<input id="is-sp-all" class="mui-switch mui-switch-animbg" type="checkbox">
			</div>
			<hr style="margin:0" class="am-divider am-divider-default" />
			<div class="card-body">
				是否申请先驱<input id="apply-pioneer-all" class="mui-switch mui-switch-animbg" type="checkbox">
			</div>
		</div>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn"
				value="提交" onclick="selectCharacter(this)">
		</div>
	</div>

</div>

<input type="hidden" id="selected-character"/>

<script type="text/javascript">
	
	var picServer = "${picServer}";

	function getCharacterList(characterSelect){
		if($("#select-character-three").hasClass("invisible")&&
				$("#select-character-all").hasClass("invisible")){
			if(characterSelect == 1){
				getCharacterListAll();
			}
			else{
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
			$("#target_select").change(function(){
				var index = $("#target_select option:selected").val()-1;
				$("#select-character-all").find("img").attr("src",picServer+data.characters[index].avatar);
				$("#is-sp-all").removeAttr("checked").attr("disabled",data.characters[index].hasSp==1?false:true);
				$("#selected-character").val(data.characters[index].characterId);
			})
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
						builder.append('<img src="{0}">',picServer+character.avatar);
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
							$("#is-sp").removeAttr("checked").attr("disabled",$(this).next().val()=="1"?false:true);
							$("#selected-character").val($(this).prev().val());
						})
					})
					$("#select-character-three").removeClass("invisible");
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
	
	function selectCharacter(btn){
		$(btn).attr("disabled","disabled");
		var characterId = $("#selected-character").val();
		if(characterId == ""){
			myAlert("请选择角色");
			$(btn).removeAttr("disabled");
			return;
		}
		var isSp;
		var applyPioneer;
		if($("#select-character-all").hasClass("invisible")){
			isSp = $("#is-sp").is(":checked") ? "1":"0";
			applyPioneer = $("#apply-pioneer").is(":checked") ? "1":"0";
		} else {
			isSp = $("#is-sp-all").is(":checked") ? "1":"0";
			applyPioneer = $("#apply-pioneer-all").is(":checked") ? "1":"0";
		}
		var url = getRootPath()+"/game/selectCharacter";
		var options = {
			characterId : characterId,
			isSp : isSp,
			applyPioneer : applyPioneer
		};
		var common = new Common();
		common.callAction(options, url, function(data) {
			if (!data) {
				myAlert("系统或网络异常");
				$(btn).removeAttr("disabled");
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
				$(btn).removeAttr("disabled");
				return;
			}
		});
	}

</script>