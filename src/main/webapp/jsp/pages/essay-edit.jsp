<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="essay-edit">
		<input type="text" placeholder="标题"/>
		<hr/>
		<textarea></textarea>
	</div>
</div>


<script type="text/javascript">

	function adjustTextArea(essayId){
		$("#nv-chatbar").addClass("invisible");
		$("#nv-footer").removeClass("invisible");
		$(".essay-edit textarea").css({"height":$(window).height()-140+"px"});
		$("#icon-options").css({"display":"none"});
		$("#icon-finish").css({"display":"block"}).unbind("click").click(function(){
			if(essayId){
				submitEssay(essayId);
			} else {
				$('#my-actions .am-list').empty().append("<li class='am-modal-actions-header'>请选择帖子类型</li>");
				$('#my-actions .am-list').append("<li onclick='submitEssay(0,2)'>玩家复盘</li>");
				$('#my-actions .am-list').append("<li onclick='submitEssay(0,3)'>版杀攻略</li>");
				$('#my-actions .am-list').append("<li onclick='submitEssay(0,4)'>其他</li>");
				$('#my-actions').modal('open');
			}		
		});
		if(essayId){
			$(".essay-edit input").val($("#essay-detail .essay-content").find("h2").text());
			$(".essay-edit textarea").val(replaceTag($("#essay-detail .essay-content").find("p").html()));
		} else {
			$(".essay-edit input").val("");
			$(".essay-edit textarea").val("");
		}	
	}
	
	function showEssayEdit(){
		$("#icon-options").dropdown('close');
		pageSwitch(getCurActPage(),"#pageD",getCurActLevel(),2,'adjustTextArea()');		
	}
	
	function submitEssay(essayId,type){
		$('#my-actions').modal('close');
		var header = $(".essay-edit input").val().trim();
		if(header==""){
			myAlert("标题不能为空！");
			return;
		}
		var content = recoverTag($(".essay-edit textarea").val().trim());
		var url = getRootPath() + "/publishEssay";
		var options = {
				header : header,
				content : content,
				essayId : essayId,
				type : type
		}
		var common = new Common();
		common.callAction(options,url,function(data){
			myInfo("发表成功！",function(){
				window.location = getRootPath() + "/index?essayId=" + data.essayId;
			})			
		})
	}
	
	function deleteEssay(essayId){
		var url = getRootPath() + "/deleteEssay";
		var options = {
				essayId : essayId,
		}
		var common = new Common();
		common.callAction(options,url,function(data){
			myInfo("删除成功！",function(){
				window.location = getRootPath() + "/index";
			})				
		})
	}

</script>