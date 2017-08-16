<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default" id="my-essay-list">

	<div class="nv-guide invisible">
		<img src="">
		<p>还没发表任何攻略或复盘哦</p>
	</div>
	
</div>

<script type="text/javascript">

function getEssayList(){
	var url = getRootPath() + "/getEssayList";
	var options = {
			userId : userId
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		if(data.essayList.length == 0){
			showNVguide();				
		} else {
			$("#my-essay-list").empty();			
			$.each(data.essayList,function(index,essay){
				var builder = new StringBuilder();
				builder.append('<div class="card"><div class="card-header">');
				builder.appendFormat('<h2 class="card-title">{0}</h2></div>',essay.header);
				builder.appendFormat('<div class="card-body essay-style">{0}</div>',essay.content);
				builder.appendFormat('<div class="card-footer"><a href="{0}/index?essayId={1}"><span>查看更多  <span class="am-icon-chevron-right"></span></span></a></div></div>',getRootPath(),essay.essayId);
				$("#my-essay-list").append(builder.toString());
			})
			adjustContainerHeight(getCurActPage());
		}			
	})
}



</script>