<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<title>维多利亚的噩梦规则</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="am-panel-group rule-panel" id="rule-wrapper">
		<c:forEach items="${ rules }" var="rule">
			<div class="am-panel am-panel-default">
		 		<div class="am-panel-hd">
		 			<h2 class="am-panel-title" data-am-collapse="{parent: '#rule-wrapper', target: '#rule-row-${rule.chapterId }'}">
		 				${ rule.chapter }
		 			</h2>
				</div>
				<div id="rule-row-${rule.chapterId }" class="am-panel-collapse am-collapse">
					<div class="am-panel-bd">
						${rule.content }
						<c:if test="${not empty rule.indexs}">
							<div class="am-panel-group rule-panel index-style" id="rule-row-${rule.chapterId}-wrapper">
							<c:forEach items="${rule.indexs }" var="index">
								<div class="am-panel am-panel-default no-border-side">
		 							<div class="am-panel-hd">
		 								<h2 class="am-panel-title" onclick="getRuleContent(${rule.chapterId},${index.indexId})" data-am-collapse="{parent: '#rule-row-${rule.chapterId}-wrapper', target: '#rule-row-${rule.chapterId }-${index.indexId}'}">
		 									${ index.header }
		 								</h2>
		 							</div>
		 							<div id="rule-row-${rule.chapterId }-${index.indexId}" class="am-panel-collapse am-collapse">
		 								<div class="am-panel-bd"></div>
		 							</div>
		 						</div>		 		
							</c:forEach>
							</div>
						</c:if>
					</div>
				</div>
			</div>		
		</c:forEach>	
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">

$("#nv-footer li:eq(2)").addClass("visiting");

$.each($(".am-collapse"),function(index,obj){
	$(obj).on('opened.collapse.amui', function() {
		  $(window).smoothScroll({position:$(obj).offset().top-90})
	})
})

function getRuleContent(row,index){
	if($("#rule-row-"+row+"-"+index+" .am-panel-bd").text()!=""){
		return;
	}
	var url = getRootPath()+"/getRuleContent";
	var options = {
			row : row,
			index : index
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		$("#rule-row-"+row+"-"+index+" .am-panel-bd").html(data.rule);			
	})
}

</script>

</html>