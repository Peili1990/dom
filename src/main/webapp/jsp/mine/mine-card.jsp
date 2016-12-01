<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default" id="mine-card-list">
	
	<div class="nv-guide invisible">
		<img src="">
		<p>你还没有任何卡片哦</p>
	</div>

</div>

<script type="text/javascript">

function getUserCardList(){
	var url = getRootPath() + "/getUserCardList";
	var common = new Common();
	common.callAction(null,url,function(data){
		if(!data){
			return;
		}
		switch(data.status){
		case 1:
			if(data.cardList.length==0){
				showNVguide();
				return;
			}
			$("#mine-card-list").empty();
			$.each(data.cardList,function(index,card){
				var builder = new StringBuilder();
				switch(card.cardType){
				case 1:
					builder.appendFormat('<div class="identity-card" style="height:{0}">',$("body").width()*0.268+"px");
					builder.appendFormat('<time>{0}</time>',card.expireDate);
					switch(card.status){
					case 2:
						builder.append('<div class="used"></div>');
						break;
					case 3:
						builder.append('<div class="expired"></div>');
						break;
					}
					builder.append('</div>');
					$("#mine-card-list").append(builder.toString());
					break;
				case 2:
					builder.appendFormat('<div class="camp-card" style="height:{0}">',$("body").width()*0.268+"px");
					builder.appendFormat('<time>{0}</time>',card.expireDate);
					switch(card.status){
					case 2:
						builder.append('<div class="used"></div>');
						break;
					case 3:
						builder.append('<div class="expired"></div>');
						break;
					}
					builder.append('</div>');
					$("#mine-card-list").append(builder.toString());
					break;
				}			
			})
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