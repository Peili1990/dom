<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<title>维多利亚的噩梦规则</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="rule-panel"></div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">

$.get('file/rule-1.8.0.txt',function(content){ 
	$(".rule-panel").html(content);
})

</script>

</html>