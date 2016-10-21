<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<title>维多利亚的噩梦规则</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="rule-panel" id="rule-panel"></div>
	<div class="rule-panel invisible" id="term-panel"></div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">

$.get(picServer+'rule-1.8.0.txt',function(content){ 
	$("#rule-panel").html(content);
})
$("#nv-footer li:eq(2)").addClass("visiting");
$("#options-list").append("<li onclick='showRulePanel()'><a>查看规则</a></li>")
$("#options-list").append("<li onclick='showTermPanel()'><a>查看术语表</a></li>")

function showRulePanel(){
	window.scroll(0,0);
	$("#icon-options").dropdown('close');
	$("#rule-panel").removeClass("invisible");
	$("#term-panel").addClass("invisible");
}

function showTermPanel(){
	window.scroll(0,0);
	$("#icon-options").dropdown('close');
	$("#term-panel").removeClass("invisible");
	$("#rule-panel").addClass("invisible");
	if(!$("#term-panel").text()){
		$.get(picServer+'nv-term.txt',function(content){ 
			$("#term-panel").html(content);
		})
	}
}

</script>

</html>