<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

	$(function() {
		$('#check_target_select').val('').scroller('destroy').scroller(
				$.extend({
					preset : 'select'
				}, {
					theme : 'android-ics light',
					mode : 'scroller',
					display : 'bottom',
					lang : 'zh'
				}));
		$('#delegate_target_select').val('').scroller('destroy').scroller(
				$.extend({
					preset : 'select'
				}, {
					theme : 'android-ics light',
					mode : 'scroller',
					display : 'bottom',
					lang : 'zh'
				}));
		
	});
</script>
<div class="default">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">你的身份</h2>
		</div>
		<div class="card-body">
			间谍<br>
			杀手方<br>
			【查验】每一夜，间谍可以选择1名角色，得知其实际身份。<br>
			*查验的结果会标注好人方/杀手方。<br>
			【委托】一局一次，夜晚，间谍选择1名角色，可以令杀手的【刺杀】目标修改为该角色。（只有游戏开始时就是间谍的角色可以这么做）<br>
			*这个行动若因间谍/杀手行动失效阻碍，机会保留，例如【偷窃】或窥探者。<br>
			*若被委托的对象当夜被留了凶器，凶器位置不变。<br>
			*行动后，激活【洗劫】中的“金钱”奖励。<br>
		</div>
	</div>
	<div class="group">
		<div class="group-body">
		<div class="am-input-group am-input-group-primary">
  			<span class="am-input-group-label">
  				请选择查验对象</span>
  			<input type="text" id="check_target_select_dummy" class="am-form-field">
  			<select id="check_target_select">	
  			<option value="1">Atlanta</option>
				<option value="2">Berlin</option>
				<option value="3">Boston</option>
				<option value="4">Chicago</option>
				<option value="5">London</option>
				<option value="6">Los Angeles</option>
				<option value="7">New York</option>
				<option value="8">Paris</option>
				<option value="9">San Francisco</option>
			</select>
		</div>
		
		<div class="am-input-group am-input-group-primary">
  			<span class="am-input-group-label">
  				请选择委托对象</span>
  			<input type="text" id="delegate_target_select_dummy" class="am-form-field">
  			<select id="delegate_target_select">	
  			<option value="1">Atlanta</option>
				<option value="2">Berlin</option>
				<option value="3">Boston</option>
				<option value="4">Chicago</option>
				<option value="5">London</option>
				<option value="6">Los Angeles</option>
				<option value="7">New York</option>
				<option value="8">Paris</option>
				<option value="9">San Francisco</option>
			</select>
		</div>
		<input type="button" class="am-btn am-btn-secondary sumbit-btn"
			style="width: 100%" value="提交">
	</div>
</div>
</div>

