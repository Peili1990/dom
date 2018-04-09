<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/common.jsp"></jsp:include>
<link rel="stylesheet" href="css/index.css">
<title>Solr测试</title>
</head>
<body>
	<div style="margin-top:80px;margin-bottom:30px;text-align:center">
		   <h2 style="margin-bottom:20px">申请人查询</h2>
			<input type="text" class="am-form-field float-right"  style="display:inline-block" id="userName" placeholder="申请人姓名">
			<input type="button" class="am-btn am-btn-primary"  style="display:inline-block;margin-top:20px" onclick="submit()" value="查询">	
		   

	</div>	
	<div id="findSth" style="display:none">
	查询到以下申请人信息：
	</div>
	<div id="findNothing" style="display:none">
	未查询到任何公司信息
	</div>
	<div id="apply">
	</div>
  <script>
  
  	function submit(){
  		var common = new Common();
  		var url = getRootPath() + "/solrSearch";
  		var options = {
  				regUsername: $("#userName").val()
  		}
  		common.callAction(options,url,function(data){
  			if(data.documents && data.documents.data.length>0){
  				$("#apply").empty();
  				$("#findSth").css({"display":"block"});
  				$("#findNothing").css({"display":"none"});
				$.each(data.documents.data,function(index,document){
					var builder = new StringBuilder();
					builder.append('<div class="card"><div class="card-header">');
					builder.appendFormat('<span><h2>{0}</h2>',document.regUsername);

					builder.append('</span>');
					builder.appendFormat('</div><div class="card-body essay-style">{0}<br>{1}</div>',document.address,document.email);
					builder.appendFormat('<div class="card-footer"></div>')
					$("#apply").append(builder.toString());
				})	
  			} else {
  				$("#apply").empty();
  				$("#findSth").css({"display":"none"});
  				$("#findNothing").css({"display":"block"});
  			}
  		})
  	}
        
  </script>
</body>
</html>