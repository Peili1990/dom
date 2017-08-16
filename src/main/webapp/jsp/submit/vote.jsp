<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
        $(function () {
            $(function () {
                $('#vote_target_select').val('').scroller('destroy').scroller($.extend({preset : 'select'}, { theme:'android-ics light', mode:'scroller', display:'bottom', lang:'zh'}));
            });
        });
        $(function () {
            $(function () {
                $('#vote_target_select_kunxi').val('').scroller('destroy').scroller($.extend({preset : 'select'}, { theme:'android-ics light', mode:'scroller', display:'bottom', lang:'zh'}));
            });
        });
</script>
<div class="default">
	<div class="group">
		<div class="group-body">
		<div class="am-input-group am-input-group-primary">
  			<span class="am-input-group-label">
  				请选择投票对象</span>
  			<input type="text" id="vote_target_select_dummy" class="am-form-field">
  			<select id="vote_target_select">	
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
		<span>你可为以下角色代为投票：</span>
		<div class="am-input-group am-input-group-primary">
  			<span class="am-input-group-label">
  				昆西投票对象</span>
  			<input type="text" id="vote_target_select_kunxi_dummy" class="am-form-field">
  			<select id="vote_target_select_kunxi">	
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
			 value="提交">
	</div>
</div>
</div>

