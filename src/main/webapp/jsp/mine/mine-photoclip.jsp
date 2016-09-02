<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default" >

<div id="clipArea"></div>
<input type="file" id="file" class="invisible">

</div>

<script>

$(function(){
	$("#clipArea").css("height",$(window).height()-49+"px");
	var clipArea = new PhotoClip("#clipArea", {
		size: [$(window).width(), $(window).width()],
		outputSize: [640, 640],
		file: "#file",
		ok: "#icon-finish",
		loadStart: function() {
	 		pageSwitch("#pageA","#pageB");
			$("#nv-footer").addClass("invisible");
			$("#icon-options").css({"display":"none"});
			$("#icon-finish").css({"display":"block"});
			$(".am-header-title").text("图片剪裁");
		},
		loadComplete: function() {
			
		},
		clipFinish: function(dataURL) {
			console.log(dataURL);
			var url = getRootPath() + "/avatarUpload";
			var options={
					avatarFile : dataURL
			}
			var common = new Common();
			common.callAction(options,url,function(data){
				$("#icon-arrow").click();
				myAlert("头像更新成功！");
				$(".am-comment-avatar").attr("src",dataURL);
				$("#icon-options").css({"display":"block"});
				$("#icon-finish").css({"display":"none"});
				$(".am-header-title").text("维多利亚的噩梦");
			});
		}
	});
})

</script>