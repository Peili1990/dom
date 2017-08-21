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
						<table id="operation-record">
						</table>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="group">
		<div class="group-body">
			<input type="button" class="am-btn am-btn-secondary sumbit-btn" onclick="submit()"
				style="width: 100%" value="提交">
		</div>
	</div>
	<div class="invisible">
		<input type="text" id="param_select_dummy" class="am-form-field">
	  	<select id="param_select">	
	  	</select>
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
				builder.appendFormat('<button id="operation-{0}" type="button" data-cur-num="0" data-max-num="{1}" data-multiple="{2}" ',operation.operationId,operation.times,operation.multiple);
				builder.appendFormat('class="am-btn am-btn-primary" onclick="addOperation(this,{0},{1})">{2}',operation.operationId,operation.immediately,operation.operationName);
				if(operation.immediately==1){
					builder.appendFormat('<span class="badge badge-alert badge-rounded">!</span>');
				}
				builder.append('</button>')
				$("#operation-list").append(builder.toString());
			})
			adjustContainerHeight(getCurActPage());				
		})
	}
	
	function removeOperation(button,operationId){
		var row = $(button).parent().parent();
		var index = $(row).index();
		operationRecord.splice(index,1);	
		var curNum = $("#operation-"+operationId).data("cur-num");
		curNum--;
		$(row).remove();
		$("#operation-"+operationId).data("cur-num",curNum);
		$("#operation-"+operationId).removeAttr("disabled");
		adjustContainerHeight(getCurActPage());
	}
	
	function addOperation(button,operationId,immediately){
		var curNum = $(button).data("cur-num");
		curNum++;
		$("#operation-"+operationId).data("cur-num",curNum);
		if($("#operation-"+operationId).data("multiple")==0 || $("#operation-"+operationId).data("cur-num") == $("#operation-"+operationId).data("max-num")){
			$("#operation-"+operationId).attr("disabled","disabled");
		} 	
		var builder = new StringBuilder();
		var index = operationList.indexOfKey("operationId", operationId);
		builder.append('<tr>');
		builder.appendFormat('<td><button type="button" class="am-btn am-btn-danger" onclick="removeOperation(this,{0})">{1}</button><td>',operationId,operationList[index].operationName);
		builder.appendFormat('<td>{0}</td>',buildblank(operationId,operationList[index].template))
		builder.append('</tr>');
		$("#operation-record").append(builder.toString());
		operationRecord.push({
			operationId : operationId,
			immediately : immediately == 1 ? true : false
		})
		adjustContainerHeight(getCurActPage());
	}
	
	function buildblank(operationId,template){
		return template.replace(new RegExp("%c","gm"),'<span class="operation-param" onclick="selectParam('+operationId+',this,1)">______</span>')
					   .replace(new RegExp("%w","gm"),'<span class="operation-param" onclick="inputParam('+operationId+',this)">______</span>')
					   .replace(new RegExp("%k","gm"),'<span class="operation-param" onclick="selectParam('+operationId+',this,2)">______</span>')
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
				$(span).text($("#param_select option:selected").text());
				var index = $(span).parent().parent().index();
				var param = operationRecord[index].param;
				if(param == null) param = new Array($(span).index()+1);
				if(param.length < $(span).index()+1 ) param.length = $(span).index()+1;
				param[$(span).index()]=$("#param_select option:selected").val()+","+$("#param_select option:selected").text();
				operationRecord[index].param=param;
			})			
		})	
	}
	
	function inputParam(operationId,span){
		pageSwitch('#pageB','#pageE',1,2,editParam(operationId,span,$(span).html().replace(new RegExp("__","gm"),"")));
	}

	function submit(){
		if(operationRecord.length == 0){
			myAlert("请至少提交一项操作");
			return;
		}
		var common = new Common();
		var url = getRootPath() + "/game/submitOperation";
		common.callAction(JSON.stringify(operationRecord), url, function(data){
			myInfo("提交操作成功！",function(){
				window.location = getRootPath() + "/index";
			});				
		},"application/json;charset=utf-8")
	}

</script>