<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="am-header am-header-default">
	<div class="am-header-left am-header-nav">
		<a href="${ baseUrl }" id="icon-home">
			<i class="am-header-icon am-icon-home"></i>
		</a>
		<a id="icon-arrow" style="display:none">
		<i class="am-header-icon am-icon-chevron-left"></i>
		</a>
		<a id="icon-arrow-sec" style="display:none">
		<i class="am-header-icon am-icon-chevron-left"></i>
		</a>
	</div>

	<h1 class="am-header-title">
		<a href="#title-link" class="">维多利亚的噩梦</a>
	</h1>

	<div class="am-header-right am-header-nav">
		<div id="icon-options" class="am-dropdown" data-am-dropdown>
			<i class="am-header-icon am-icon-bars am-dropdown-toggle" data-am-dropdown-toggle></i>	
			<ul class="am-dropdown-content" id="options-list">
       			<li><a>查看公告</a></li> 
       		</ul>
		</div>
		
		<a href="#right-link" id="icon-finish" style="display:none">
			完成
		</a>
	</div>
</header>   
