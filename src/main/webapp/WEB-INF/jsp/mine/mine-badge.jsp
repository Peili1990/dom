<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="default">
	<ul class="am-avg-sm-3 am-thumbnails" id="badge-list">
  
	</ul>

</div>

<script type="text/javascript">

function getAllBadge(){
	if($("#badge-list").children().length==0){
		$.get('${baseUrl}file/badge-list.json',function(data){
			var builder = new StringBuilder();
			$.each(data.badges,function(index,badge){
				builder.appendFormat('<li id="{0}"><img class="am-thumbnail unavailable" src="{1}" /><p>{2}</p><div></div></li>',badge.picUrl,picServer+"badgeAvatar/"+badge.picUrl+".png",badge.name);
			})
			$("#badge-list").append(builder.toString());
			$.each($("#badge-list li"),function(index,badge){
				if("${user.badge}".indexOf(data.badges[index].picUrl)>-1){
					$(badge).find("div").addClass("equipped");
				}
				$(badge).click(function(){
					showBadgeDetail(data.badges[index],badge,$(badge).find("div").hasClass("equipped"),$(badge).find("img").hasClass("unavailable"));
				})
			})
			getUserBadge();
		})
	} else {
		getUserBadge();
	}
	
}

function getUserBadge(){
	var url = getRootPath() + "/getUserBadge";
	var common = new Common();
	common.callAction(null,url,function(data){
		$.each($("#badge-list li"),function(index,badge){
			if(data.userBadge.indexOf($(badge).attr("id"))>-1){
				$(badge).find("img").removeClass("unavailable");
			}
		})			
	})
}

function showBadgeDetail(badge,badgeImg,equipped,unavailable){
	$("#badge-detail .am-modal-hd").text(badge.name);
	$("#badge-detail .am-modal-bd").html('<img class="badge-detail-img" src="'+picServer+"badgeAvatar/"+badge.picUrl+'.png"><p>'+badge.obtain+'</p>');
	$("#badge-detail .am-modal-btn:eq(0)").text(equipped?"取下":"佩戴");
	$("#badge-detail .am-modal-btn:eq(0)").unbind("click").click(function(){
		equipBadge(badge,badgeImg);
	})
	if(unavailable){
		$("#badge-detail .am-modal-btn:eq(0)").addClass("invisible");
	} else {
		$("#badge-detail .am-modal-btn:eq(0)").removeClass("invisible");
	}
	$("#badge-detail").modal('open');
}

function equipBadge(badge,badgeImg){
	var url = getRootPath() + "/equipBadge";
	var options = {
			badge : badge.picUrl
	}
	var common = new Common();
	common.callAction(options,url,function(data){
		$("#equiped-badges").empty();
		if(data.badge && data.badge != ""){
			$.each(data.badge.split(","),function(index,badge){
				$("#equiped-badges").append('<img src="'+picServer+"badgeAvatar/"+badge+'.png" class="user-badge">');
			})
		}
		$(badgeImg).find("div").toggleClass("equipped");
		$(badgeImg).unbind("click").click(function(){
			showBadgeDetail(badge,badgeImg,$(badgeImg).find("div").hasClass("equipped"),$(badgeImg).find("img").hasClass("unavailable"));
		})
	})
}

</script>