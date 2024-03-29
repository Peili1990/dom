<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<div class="essay-edit">
		<textarea id="param-content"></textarea>
	</div>
</div>

<script type="text/javascript">

	function editParam(operationId,span,param){
		$("#param-content").css({"height":$(window).height()+"px"});
		$("#param-content").val(replaceTag(param));
		$("#icon-options").css({"display":"none"});
		$(".am-header-title").text("输入操作详情")
		$("#icon-finish").css({"display":"block"}).unbind("click").click(function(){
			var content = recoverTag($("#param-content").val())
			$(span).html(content == "" ? "______" : content);
			var index = $("#operation-record").find("tr").index($(span).parents("tr"));
			var spanIndex = $(span).parents("td").find(".operation-param").index($(span));
			var param = operationRecord[index].param;
			if(param == null) param = new Array(spanIndex+1);
			if(param.length < spanIndex+1 ) param.length = spanIndex+1;
			param[spanIndex]=content;
			operationRecord[index].param=param;
			operationRecord[index].operator= (isSp == 1 ? "sp" : "") + characterName;
			operationRecord[index].operationStr=$(span).parents("td").text();
			$("#icon-arrow-2").click();
			hasChanged=true;
		});
	}

</script>