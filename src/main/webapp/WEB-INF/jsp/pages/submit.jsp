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
var hasChanged;
var characterName='${playerInfo.characterName}';
var isSp='${playerInfo.isSp}';

	function getOpreation(){
		var common = new Common();
		var url=getRootPath() + "/game/getPlayerOpreation";
		common.callAction(null, url, function(data){
			operationList = data.operationList;
			operationRecord = [];			
			$("#cur-stage").text(operationList.length == 0 ? "当前"+data.curStage+"，暂无操作可提交" : "当前"+data.curStage+"，请提交你的操作：");			
			$("#operation-list").empty();
			$("#operation-record").empty();
			$.each(data.operationList,function(index,operation){
				var builder = new StringBuilder();
				builder.appendFormat('<button id="operation-{0}" type="button" data-cur-num="0" data-max-num="{1}" data-multiple="{2}" ',operation.operationId,operation.times,operation.multiple);
				builder.appendFormat('class="am-btn am-btn-primary" onclick="addOperation(this,{0})">{1}',operation.operationId,operation.operationName);
				if(operation.immediately==1){
					builder.appendFormat('<span class="badge badge-alert badge-rounded">!</span>');
				}
				builder.append('</button>')
				$("#operation-list").append(builder.toString());
			})
			$.each(data.operationRecord,function(index,record){
				var listIndex = operationList.indexOfKey("operationId",record.operationId);
				if(listIndex > -1){
					addOperation($("#operation-"+record.operationId),record.operationId);
					var params = JSON.parse(record.param);
					operationRecord[index].param=params;
					operationRecord[index].operationStr=record.operationStr;
					$.each($("#operation-record").find("tr").eq(index).find(".operation-param"),function(i,span){
						var array = params[i].split(",")
						$(span).text(array[array.length-1]);
						if(operationList[listIndex].options.length > 0 && operationList[listIndex].options[array[0]-1].template != ""){
							$(span).parent().append("<span class='operation-option'>，"
									+ buildblank(operationList[listIndex].operationId,operationList[listIndex].options[array[0]-1].template)+"</span>")
							$.each($(span).parent().find(".operation-option").find(".operation-param"),function(j,optionSpan){
								var optionArray = params[i+1+j].split(",")
								$(optionSpan).text(optionArray[optionArray.length-1]);
							})
						}
					})			
				}	
				hasChanged = false;
			})							
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
		hasChanged=true;
	}
	
	function addOperation(button,operationId){
		var curNum = $(button).data("cur-num");
		curNum++;
		$("#operation-"+operationId).data("cur-num",curNum);
		if($("#operation-"+operationId).data("multiple")==0 || $("#operation-"+operationId).data("cur-num") == $("#operation-"+operationId).data("max-num")){
			$("#operation-"+operationId).attr("disabled","disabled");
		} 	
		var builder = new StringBuilder();
		var index = operationList.indexOfKey("operationId", operationId);
		builder.append('<tr>');
		builder.appendFormat('<td><button type="button" class="am-btn am-btn-danger" onclick="removeOperation(this,{0})">{1}</button></td>',operationId,operationList[index].operationName.shorten(4));
		builder.appendFormat('<td style="width:100%">{0}</td>',buildblank(operationId,operationList[index].template))
		builder.append('</tr>');
		$("#operation-record").append(builder.toString());
		operationRecord.push({
			operationId : operationId,
			immediately : operationList[index].immediately == 1 ? true : false,
			operator : (isSp == 1 ? "sp" : "") + characterName,
			operationStr : operationList[index].operationName
		})
		adjustContainerHeight(getCurActPage());
		hasChanged=true;
	}
	
	function buildblank(operationId,template){
		return template.replace(new RegExp("%c","gm"),'<span class="operation-param" onclick="selectParam('+operationId+',this,1)">______</span>')
					   .replace(new RegExp("%w","gm"),'<span class="operation-param" onclick="inputParam('+operationId+',this)">______</span>')
					   .replace(new RegExp("%k","gm"),'<span class="operation-param" onclick="selectParam('+operationId+',this,2)">______</span>')
					   .replace(new RegExp("%o","gm"),'<span class="operation-param" onclick="selectParam('+operationId+',this,3)">______</span>')
					   .replace(new RegExp("%d","gm"),'<span class="operation-param" onclick="selectParam('+operationId+',this,4)">______</span>')
						
	}
	
	function selectParam(operationId,span,type){
		$("#param_select").empty();
		$('#param_select').val('').scroller('destroy').scroller(
	        $.extend({preset : 'select'}, { 
	             theme:'android-ics light', 
	              mode:'scroller', 
	           display:'bottom', 
	              lang:'zh'
	        })
		);
		if(type == 3){
			var index = operationList.indexOfKey("operationId", operationId);
			$.each(operationList[index].options, function(index,option){
				$("#param_select").append("<option value='"+option.sequence+"' data-template='"+option.template+"'>"+option.optionName+"</option>")
			})
			$('#param_select').click();
			$("#param_select").unbind("change").change(function(){
				$(span).parent().find(".operation-option").remove();
				var template = $("#param_select option:selected").data("template");
				if(template != ""){
					$(span).parent().append("<span class='operation-option'>，"+buildblank(operationId,template)+"</span>")
				}
				fillParam(span);		
			})	
		} else {
			var common = new Common();
			var url = getRootPath() + "/game/getOpreationTarget";
			var options = {
					type : type,
					operationId : operationId
			}
			common.callAction(options, url, function(data){				
				for(target in data.operationTarget){
					$("#param_select").append("<option value='"+target+"'>"+data.operationTarget[target]+"</option>")
		        }		
				$('#param_select').click();
				$("#param_select").unbind("change").change(function(){
					fillParam(span);
				})			
			})	
		}
		
	}
	
	function fillParam(span){
		$(span).text($("#param_select option:selected").text());
		var index = $(span).parents("tr").index();
		var spanIndex = $(span).parents("td").find(".operation-param").index($(span));
		var param = operationRecord[index].param;
		if(param == null) param = new Array(spanIndex+1);
		if(param.length < spanIndex+1 ) param.length = spanIndex+1;
		param[spanIndex]=$("#param_select option:selected").val()+","+$("#param_select option:selected").text();
		operationRecord[index].param=param;
		operationRecord[index].operator= (isSp == 1 ? "sp" : "") + characterName;
		operationRecord[index].operationStr=$(span).parents("td").text();
		hasChanged=true;
	}
	
	function inputParam(operationId,span){
		pageSwitch('#pageB','#pageE',1,2,editParam(operationId,span,$(span).html().replace(new RegExp("__","gm"),"")));
	}

	function submit(){
		if(!hasChanged){
			myInfo("操作未更改，无需提交！");
			return;
		}
		if($("#operation-record")[0].innerText.indexOf("______")>0){
			myAlert("操作未填写完整！");
			return;
		}
		var common = new Common();
		var url = getRootPath() + "/game/submitOperation";
		common.callAction(JSON.stringify(operationRecord), url, function(data){
			myInfo("提交操作成功！",function(){
				$("#icon-arrow-1").click();
			});				
		},"application/json;charset=utf-8")
	}

</script>