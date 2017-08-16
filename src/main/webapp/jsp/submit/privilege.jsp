<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
        $(function () {
            $(function () {
                $('#target_select').val('').scroller('destroy').scroller($.extend({preset : 'select'}, { theme:'android-ics light', mode:'scroller', display:'bottom', lang:'zh'}));
            });
        });
</script>
<div class="default">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">你的特权</h2>
		</div>
		<div class="card-body">
			爱德华的召唤*3<br> 主动<br> 白天投票时自己的投票翻三倍三次，必须分开使用。使用后成为当日公诉人。 <br>
			使用时机：白天阶段。 <br> 特殊情况：使用后自己仍和某人受票数同为最高时无效。 <br>
			*使用爱德华的号召后，其投票对象同非自己的角色受票数同为最高，特权依然生效。 <br>
			*使用爱德华的号召后，其投票对象不是最终的最高受票数者，自己依然成为唯一公诉人。<br>
			*使用爱德华的号召后，自己票数依然最高，自己依然成为唯一公诉人。 <br> 该特权指定：投票对象<br>
			并驱争先：特权发动时，所有已经被呼吁的平民最终投票与自身相同。<br> 效果☆☆☆<br> 情报Ｘ<br>
			实用☆☆☆<br> 限制▲▲<br> 嘲讽★★★ <br>
		</div>
	</div>
	<div class="group">
		<div class="group-body">
		<div class="am-input-group am-input-group-primary">
  			<span class="am-input-group-label">
  				请选择指定对象</span>
  			<input type="text" id="target_select_dummy" class="am-form-field">
  			<select id="target_select">	
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

