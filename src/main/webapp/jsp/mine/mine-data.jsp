<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default">

	<div class="card">
		<div class="card-header">
			<h2>我的维多利亚</h2>
		</div>	
		<div class="card-body" >
		<table id="player-data">
			
		</table>
		</div>
	</div>

</div>

<script type="text/javascript">

function getPlayerData(){
	var url = getRootPath() + "/getPlayerData";
	var common = new Common();
	common.callAction(null,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			$("#player-data").empty();
			$.each(data.details,function(index,detail){
				$("#player-data").append("<tr><td>"+detail.description+"</td><td>"+detail.value+"</td></tr>");
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


