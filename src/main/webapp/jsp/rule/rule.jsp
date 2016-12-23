<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<title>维多利亚的噩梦规则</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="am-panel-group rule-panel" id="rule-wrapper">
		<div class="am-panel am-panel-default">
		 <div class="am-panel-hd">
		 	<h2 class="am-panel-title" data-am-collapse="{parent: '#rule-wrapper', target: '#rule-row-1'}">
		 		一、游戏简介
		 	</h2>
		 </div>
		 <div id="rule-row-1" class="am-panel-collapse am-collapse am-in">
		 	<div class="am-panel-bd">
		 		……致以每个新镇民的欢迎辞……
		 		<br><br>
		 		<span style="font-size: 14pt">
		 			<em>
		 				19世纪中期，芝加哥依然顶着“罪恶之都”的称号，但自煤矿、石油乃至金矿在密西西比河沿岸相继被发现后，那些不怀好意的人们终于有了正事可做，安分了不少。经平克顿侦探事务所多次干涉，三个芝加哥匪帮连续粉碎，似乎这座美国中部的城市终于变得更祥和了……但是，人们不知道，铁路与电报一样把这个好消息告诉了罪犯们，他们嗅到了大笔大笔钱财的气味。夏天刚开始的时候，芝加哥西300公里的一个叫做<strong>维多利亚</strong>的小镇因为西部铁路第二大股东兼银行家<span style="color: blue;">H.刘易斯</span>（Henry Lewis）一笔对小镇建设的巨额投资受到了无数人的关注。当一片黑云渐渐笼罩在这个小镇上时，《新芝加哥日报》记下了这个日子：<span style="color:red"><strong>1878年7月5日</strong></span>。
		 			</em>
		 		</span>
		 		<br><br>
		 		《维多利亚的噩梦》是一款BBS杀人游戏。参与者将来到19世纪末的一个美国中西部市镇，见证一场阴谋的发生，并亲手扭转或推动其结果。<br>
				在游戏中参与者可以选择多样的<strong>外在身份</strong>，面对一连串事件，作出自己的评价，甚至因为自己独到的能力从这场浩劫中保护自己，或对敌人施加影响；<br>
				然而，在表面的身份下，还有主导游戏走向的<strong>实际身份</strong>。在警察和杀手的带领下，不同阵营的角色各自为了自己的目的而努力。<br>
				究竟是正义将邪恶揭穿于天下，还是邪恶掩盖正义夺得自己的胜利？这一切将由你决定。<br>
				<br>
				<div class="spoiler-header">
					<div class="spoiler-title">
						<strong>剧透</strong>
						<em>
							草原之州 伊利诺斯： 
						</em>
						<button class="spoiler-button am-btn am-btn-default" onclick="showSpoiler(this)">显示</button>
					</div>
					<div class="spoiler-body">
						<div style="display: none;">
							美国中北部的一个州。1818年作为第二十一个州加入美国。法国人在17世纪后期首先开发了此地，1763年法国又将其割让给英国，1783年英法两国共同将其割让给新建立的美利坚合众国。斯普林菲尔德是该州首府，芝加哥为最大城市。
						</div>
					</div>
				</div>
				<div class="spoiler-header">
					<div class="spoiler-title">
						<strong>剧透</strong>
						<em>
							风之城 芝加哥：
						</em>
						<button class="spoiler-button am-btn am-btn-default" onclick="showSpoiler(this)">显示</button>
					</div>
					<div class="spoiler-body">
						<div style="display: none;">
							美国伊利诺斯州最大的城市，位于该州的东北部密歇根湖上。是中西部重要的港口城市以及商业、经济、工业和文化中心。这座城市在1871年曾被一场大火灾几乎摧毁。 <br>
							全国铁路枢纽。全国谷物、牲畜市场，中西部商业、金融、工业中心。
						</div>
					</div>
				</div>
				<div class="spoiler-header">
					<div class="spoiler-title">
						<strong>剧透</strong>
						<em>
							best wishes, 维多利亚:
						</em>
						<button class="spoiler-button am-btn am-btn-default" onclick="showSpoiler(this)">显示</button>
					</div>
					<div class="spoiler-body">
						<div style="display: none;">
							维多利亚镇处于美国本土中部，小规模市镇，位于芝加哥西侧，距离芝加哥270公里左右，米尔沃基310公里左右，麦迪逊150公里左右，是芝加哥-圣保罗铁路线上的一个小车站。毗邻密西西比河，小镇原经济支柱是贸易业和农业，但近几年在沃特卢-麦迪逊-得梅因区一直有石油、煤矿、磁铁矿、硬铝矿的发现，极大地带动了小镇经济，特别是1875年9月一个金矿的发现，更是给小镇带来了无限商机。<br>
							中部市镇，与西部市镇的大片山地不同，由于密西西比河的冲积，土地肥沃平坦，农业容易发展。气候为夏天炎热，冬天大雪。<br>
							由于附近矿业的发展，当今美国的东北部工业区的雏形已经形成，维多利亚镇恰好在西边缘。由于东北部的矿产产量不如南部，而且往往集中，所以有矿产的地段总是受到资本家青睐。
						</div>
					</div>
				</div>
		 	</div>
		 </div>
		</div>
		
		<div class="am-panel am-panel-default">
		 <div class="am-panel-hd">
		 	<h4 class="am-panel-title" data-am-collapse="{parent: '#rule-wrapper', target: '#rule-row-2'}" onclick="getRuleContent()">
		 		二、游戏流程
		 	</h4>
		 </div>
		 <div id="rule-row-2" class="am-panel-collapse am-collapse">
		 	<div class="am-panel-bd">
		 					
		 	</div>
		 </div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">

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

function getRuleContent(){
	
}

</script>

</html>