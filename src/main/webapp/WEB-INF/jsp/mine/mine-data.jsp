<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default">

	<div class="card invisible" id="player-data">
		<div class="card-header">
			<h2>我的维多利亚</h2>
		</div>	
		<div class="card-body" >
		<table>
			
		</table>
		</div>
	</div>
	
	<div class="nv-guide invisible">
		<img src="">
		<p>还没参加过版杀哦</p>
	</div>

</div>

<script type="text/javascript">

function getPlayerData(){
	var url = getRootPath() + "/getPlayerData";
	var common = new Common();
	common.callAction(null,url,function(data){
		if(data.details.length == 0){
			showNVguide();
		} else {
			$("#player-data").removeClass("invisible").find("table").empty();
			$.each(data.details,function(index,detail){
				$("#player-data").find("table").append("<tr><td>"+detail.description+"</td><td>"+detail.value+"</td></tr>");
			})
		}			
	})
}


</script>


