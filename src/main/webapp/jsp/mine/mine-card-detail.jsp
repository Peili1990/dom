<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="default">
	<div class="group">
		<div class="group-body">
			<h2 id="card-name"></h2>
			<blockquote id="card-desc"></blockquote>
		</div>
		<div class="group-body">
		使用须知：<br>
		1、每次只能使用1张卡片；<br>
		2、每局版杀每个阵营只能有1张卡片生效；<br>
		3、只能在未选择角色时使用卡片，若已选择角色，则在修改角色的时候不得再用卡片；<br>
		4、若使用失败，则表明该身份对应的阵营已有卡片生效；<br>
		5、若使用成功，角色不可修改；<br>
		6、若使用成功，便享有本局版杀不被法官踢出的权利
		</div>
	</div>
</div>


<script type="text/javascript">

function getCardDetail(cardType){
	var cardDetail = [{name:'身份卡',desc:'选择角色时使用，指定本局自己的实际身份'},
	                  {name:'阵营卡',desc:'选择角色时使用，指定本局自己的阵营，并立即随机获得一个属于该阵营的实际身份'},
	                  {name:'阵营卡',desc:'选择角色时使用，可选择已经被其他玩家选择的角色，随后由法官公布自己的ID'},
	                  {name:'先驱卡',desc:'选择角色时使用，成为本局的先驱'}];
	$("#card-name").text(cardDetail[cardType-1].name);
	$("#card-desc").text(cardDetail[cardType-1].desc);
}



</script>