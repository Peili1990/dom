<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/index.css">
<jsp:include page="layout/common.jsp"></jsp:include>
<title>纯爷们地下城</title>
</head>
<body>	
	<div class="am-page" id="mobile-index">
	<jsp:include page="layout/header.jsp"></jsp:include>
		<div id="widget-list">
			<ul class="am-list m-widget-list"
				style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
				<li><a href="/widgets/accordion" data-rel="accordion"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/accordion/src/accordion.png"
						alt="Accordion"> <span class="widget-name">Accordion</span></a></li>
				<li><a href="/widgets/divider" data-rel="divider"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/divider/src/divider.png"
						alt="Divider"> <span class="widget-name">Divider</span></a></li>
				<li><a href="/widgets/duoshuo" data-rel="duoshuo"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/duoshuo/src/duoshuo.png"
						alt="Duoshuo"> <span class="widget-name">Duoshuo</span></a></li>
				<li><a href="/widgets/figure" data-rel="figure"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/figure/src/figure.png"
						alt="Figure"> <span class="widget-name">Figure</span></a></li>
				<li><a href="/widgets/footer" data-rel="footer"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/footer/src/footer.png"
						alt="Footer"> <span class="widget-name">Footer</span></a></li>
				<li><a href="/widgets/gallery" data-rel="gallery"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/gallery/src/gallery.png"
						alt="Gallery"> <span class="widget-name">Gallery</span></a></li>
				<li><a href="/widgets/gotop" data-rel="gotop"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/gotop/src/gotop.png"
						alt="Gotop"> <span class="widget-name">Gotop</span></a></li>
				<li><a href="/widgets/header" data-rel="header"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/header/src/header.png"
						alt="Header"> <span class="widget-name">Header</span></a></li>
				<li><a href="/widgets/intro" data-rel="intro"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/intro/src/intro.png"
						alt="Intro"> <span class="widget-name">Intro</span></a></li>
				<li><a href="/widgets/list_news" data-rel="list_news"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/list_news/src/list_news.png"
						alt="List"> <span class="widget-name">List</span></a></li>
				<li><a href="/widgets/map" data-rel="map"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/map/src/map.png"
						alt="Map"> <span class="widget-name">Map</span></a></li>
				<li><a href="/widgets/mechat" data-rel="mechat"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/mechat/src/mechat.png"
						alt="Mechat"> <span class="widget-name">Mechat</span></a></li>
				<li><a href="/widgets/menu" data-rel="menu"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/menu/src/menu.png"
						alt="Menu"> <span class="widget-name">Menu</span></a></li>
				<li><a href="/widgets/navbar" data-rel="navbar"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/navbar/src/navbar.png"
						alt="Navbar"> <span class="widget-name">Navbar</span></a></li>
				<li><a href="/widgets/pagination" data-rel="pagination"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/pagination/src/pagination.png"
						alt="Pagination"> <span class="widget-name">Pagination</span></a></li>
				<li><a href="/widgets/paragraph" data-rel="paragraph"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/paragraph/src/paragraph.png"
						alt="Paragraph"> <span class="widget-name">Paragraph</span></a></li>
				<li><a href="/widgets/slider" data-rel="slider"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/slider/src/slider.png"
						alt="Slider"> <span class="widget-name">Slider</span></a></li>
				<li><a href="/widgets/tabs" data-rel="tabs"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/tabs/src/tabs.png"
						alt="Tabs"> <span class="widget-name">Tabs</span></a></li>
				<li><a href="/widgets/titlebar" data-rel="titlebar"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/titlebar/src/titlebar.png"
						alt="Titlebar"> <span class="widget-name">Titlebar</span></a></li>
				<li><a href="/widgets/wechatpay" data-rel="wechatpay"><img
						class="widget-icon"
						src="http://cdn.amazeui.org/src/2.2/widget/wechatpay/src/wechatpay.png"
						alt="WeChat Pay"> <span class="widget-name">WeChat
							Pay</span></a></li>
			</ul>
		</div>
	</div>
	<div class="am-page" id="demo-list-page">
	<jsp:include page="layout/header.jsp"></jsp:include>
		<div id="demo-list">
			<div id="demo-scroller">
				<ul class="am-list widget-list">
					<li></li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/x-handlebars-template" id="tpl-demo-list">
		<ul class="am-list widget-list">
 	 		{{#each this}}
    	<li><a href="/{{demoURL}}">{{demoName}}</a></li>
			{{/each}}
  		</ul>
	</script>
	<script type="text/javascript" src="assets/js/fastclick.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
</body>
</html>