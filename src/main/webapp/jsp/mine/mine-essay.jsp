<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default" id="my-essay-list">

	<div class="nv-guide invisible">
		<img src="">
		<p>还没发表任何攻略或复盘哦，你可以<br><a class="nv-link" onclick="">写攻略或复盘</a></p>
	</div>
	
</div>

<script type="text/javascript">

function getEssayList(){
	var url = getRootPath() + "/getEssayList";
	var common = new Common();
	common.callAction(null,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			if(data.essayList.length == 0){
				showNVguide();				
			} else {
				$("#my-essay-list").empty();			
				$.each(data.essayList,function(index,essay){
					var builder = new StringBuilder();
					builder.append('<div class="card"><div class="card-header">');
					builder.appendFormat('<h2 class="card-title">{0}</h2></div>',essay.header);
					builder.appendFormat('<div class="card-body essay-style">{0}</div>',essay.content);
					builder.appendFormat('<div class="card-footer"><a><span onclick="secPageSwitch({0},{1},{2})">查看更多  <span class="am-icon-chevron-right"></span></span></a></div></div>',"'#pageD'","'#pageE'","'getEssayDetail("+essay.essayId+")'");
					$("#my-essay-list").append(builder.toString());
				})
				adjustContainerHeight(getCurActPage());
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


</script>