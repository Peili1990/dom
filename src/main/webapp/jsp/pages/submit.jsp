<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">

	<div class="card">
		<div class="card-body">
			<form class="am-form">
				<fieldset>
					<legend>提交操作</legend>
					<span id="cur-stage"></span>
					<div class="group">
						<div id="operation-list">
						</div>
						<div id="operation-record">							
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn" onclick="submit(${playerInfo.gameId},${playerInfo.playerId})"
				style="width: 100%" value="提交">
		</div>
	</div>
	<div class="invisible">
		<input type="text" id="param_select_dummy" class="am-form-field">
	  	<select id="param_select">	
  	</div>
</div>

<script type="text/javascript">
var operationList;
var operationRecord;

	function getOpreation(){
		var common = new Common();
		var url=getRootPath() + "/game/getPlayerOpreation";
		common.callAction(null, url, function(data){
			operationList = data.operationList;
			operationRecord = data.operationRecord;
			$("#cur-stage").text(operationList.length == 0 ? "当前没有任何操作可提交" : "当前"+data.curStage+"，请提交你的操作：");			
			$("#operation-list").empty();
			$.each(data.operationList,function(index,operation){
				var builder = new StringBuilder();
				builder.appendFormat('<button type="button" class="am-btn am-btn-primary" onclick="editOperation(this,{0})">{1}</button>',operation.operationId,operation.operationName)
				$("#operation-list").append(builder.toString());
			})
			adjustContainerHeight(getCurActPage());				
		})
	}
	
	function editOperation(button,operationId){
		if($(button).hasClass("am-btn-primary")){
			$(button).removeClass("am-btn-primary").addClass("am-btn-danger");		
			addOperation(operationId);			
		} else {
			$(button).removeClass("am-btn-danger").addClass("am-btn-primary");
			removeOperation(operationId);
		}
	}
	
	function removeOperation(operationId){
		$("#operation-"+operationId).remove();
		operationRecord.removeKey("operationId", operationId);
	}
	
	function addOperation(operationId){
		var builder = new StringBuilder();
		var index = operationList.indexOfKey("operationId", operationId);
		builder.appendFormat('<p id="operation-{0}">{1}',operationId,operationList[index].operationName);
		builder.appendFormat('{0}</p>',operationList[index].template ? "："+buildblank(operationId,operationList[index].template):"");
		$("#operation-record").append(builder.toString());
		operationRecord.push({
			operationId : operationId			
		})
	}
	
	function buildblank(operationId,template){
		return template.replace(new RegExp("%c","gm"),'<span class="operation-param" onclick="selectParam('+operationId+',this,1)">______</span>')
					   .replace(new RegExp("%w","gm"),'<span class="operation-param" onclick="inputParam(this)">______</span>');
		
	}
	
	function selectParam(operationId,span,type){
		var common = new Common();
		var url = getRootPath() + "/game/getOpreationTarget";
		var options = {
				type : type
		}
		common.callAction(options, url, function(data){
			$("#param_select").empty()
			for(target in data.operationTarget){
				$("#param_select").append("<option value='"+target+"'>"+data.operationTarget[target]+"</option>")
	        }
			$('#param_select').val('').scroller('destroy').scroller(
			        $.extend({preset : 'select'}, { 
			             theme:'android-ics light', 
			              mode:'scroller', 
			           display:'bottom', 
			              lang:'zh'
			        })
				);
			$('#param_select').click();
			$("#param_select").unbind("change").change(function(){
				$(span).text("__"+$("#param_select option:selected").text()+"__");
				var index = operationRecord.indexOfKey("operationId",operationId);
				var param = operationRecord[index].param;
				if(param == null) param = new Array($(span).index()+1);
				if(param.length < $(span).index()+1 ) param.length = $(span).index()+1;
				param[$(span).index()]=$("#param_select option:selected").val()+","+$("#param_select option:selected").text();
				operationRecord[index].param=param;
			})			
		})	
	}
	
	function inputParam(span){
		pageSwitch('#pageB','#pageE',1,2);
	}

	function submit(gameId,playerId){
		var action=$("input[name='action']").val().trim();
		var privilege=$("input[name='privilege']").val().trim();
		var vote=$("input[name='vote']").val().trim();
		if(action==""&&privilege==""&&vote==""){
			myAlert("请至少提交一项操作");
			return;
		}
		var common = new Common();
		var url = "http://" + "${chatServer}" + "/submitOpreation";
		var options = {
				gameId : gameId,
				playerId : playerId,
				action : action,
				privilege : privilege,
				vote : vote
		}
		common.callAction(options, url, function(data){
			myInfo("提交操作成功！",function(){
				window.location = getRootPath() + "/index";
			});				
		})
	}

</script>