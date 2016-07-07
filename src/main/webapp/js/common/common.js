/**
 * common.js
 * 
 * @author z```s
 */
var Common = function() {
	// 异步调用AJAX方法
	// data参数：为异步传输的参数，需定义为JSON格式
	// url参数：为异步访问路径
	// callback参数：为AJAX执行成功的回调函数需为function(){};
	this.callAction = function(data, url, callback) {
		$.ajax({
			type : "POST",
			url : url,
			data : data,
			dataType : "json",
			success : callback,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				var resText = XMLHttpRequest.responseText;
				if (resText != null && resText != "") {
					var error = eval("(" + resText + ")");
					if (error.sessionState == 0) {
						window.open(error.contextPath + '/login.html?errorType=Login_Timeout', '_top');
					}
				} else {
					//alert("系统出错，请重试");
				}
			}
		});
	};

	this.timeVerify = function(startTime, endTime) {
		startTime = this.stringToDate(startTime);
		endTime = this.stringToDate(endTime);
		if (startTime == null || endTime == null) {
			return;
		}
		if (startTime > endTime) {
			return false;
		}
		return true;
	};

	this.stringToDate = function(time) {
		if (time.length > 0) {
			time = time.toString().replace(/-/g, "/");
			time = new Date(Date.parse(time));
			return time;
		}
		return null;
	};

};

/** * 日期格式化 ** */
Date.prototype.format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, // 小时
		"H+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	var week = {
		"0" : "\u65e5",
		"1" : "\u4e00",
		"2" : "\u4e8c",
		"3" : "\u4e09",
		"4" : "\u56db",
		"5" : "\u4e94",
		"6" : "\u516d"
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	if (/(E+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f"
								: "\u5468") : "") + week[this.getDay() + ""]);
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;

};

/** * 返回字节数 ** */
String.prototype.lenB = function() {
	return this.replace(/[^\x00-\xff]/g, "**").length;
};

/** * 删除首尾空格 ** */
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

/** * 检验是否为邮箱地址 ** */
String.prototype.isEmail = function() {
	return /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
			.test(this);
};

/** * 检验字符串是否存在中文 ** */
String.prototype.existChinese = function() {
	return (this.length != this.replace(/[^\x00-\xff]/g, "**").length);
};

/** * 检查是否为数 ** */
String.prototype.isNumber = function() {
	var s = this.trim();
	return (s.search(/^[+-]?[0-9.]*$/) >= 0);
};

String.prototype.isNumeric = function() {
	var s = this.trim();
	return /^[0-9]*$/.test(s);
};

String.prototype.isUrl = function() {
	var str_url = this.trim();
	var strRegex = /http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
	var reg = new RegExp(strRegex);
	return reg.test(str_url);
};

String.prototype.isFloat = function() {
	return /^(-?\d+)(\.\d+)?$/.test(this);
};

String.prototype.isNumOrChar = function() {
	return /^[A-Za-z0-9]*$/.test(this);
};

String.prototype.toDate = function() {
	if (this.length == 0) {
		return null;
	}
	var time = this.replace(/-/g, "/");
	time = new Date(Date.parse(time));
	return time;
};

String.prototype.startsWith = function(str) {
	var reg = new RegExp("^" + str);
	return reg.test(this);
};

String.prototype.endsWith = function(str) {
	var reg = new RegExp(str + "$");
	return reg.test(this);
};

function StringBuilder() {
	this._buffers = [];
	this._length = 0;
	this._splitChar = arguments.length > 0 ? arguments[arguments.length - 1]
			: "";
	if (arguments.length > 0) {
		for (var i = 0, len = arguments.length - 1; i < len; i++) {
			this.append(arguments[i]);
		}
	}
}

StringBuilder.prototype.append = function(str) {
	this._length += str.length;
	this._buffers.push(str);
	return this;
};

StringBuilder.prototype.add = StringBuilder.prototype.append;

StringBuilder.prototype.appendFormat = function() {
	if (arguments.length > 1) {
		var tString = arguments[0];
		if (arguments[1] instanceof Array) {
			for (var i = 0, len = arguments[1].length; i < len; i++) {
				var jIndex = i;
				var re = eval("/\\{" + jIndex + "\\}/g;");
				tString = tString.replace(re, arguments[1][i]);
			}
		} else {
			for (var i = 0, len = arguments.length; i < len; i++) {
				var jIndex = i - 1;
				var re = eval("/\\{" + jIndex + "\\}/g;");
				tString = tString.replace(re, arguments[i]);
			}
		}
		this.append(tString);
	} else if (arguments.length == 1) {
		this.append(arguments[0]);
	}
	return this;
};

StringBuilder.prototype.length = function() {
	if (this._splitChar.length > 0 && (!this.isEmpty())) {
		return this._length
				+ (this._splitChar.length * (this._buffers.length - 1));
	} else {
		return this._length;
	}
};

StringBuilder.prototype.isEmpty = function() {
	return this._buffers.length <= 0;
};

StringBuilder.prototype.clear = function() {
	this._buffers = [];
	this._length = 0;
};

StringBuilder.prototype.toString = function() {
	if (arguments.length == 1) {
		return this._buffers.join(arguments[0]);
	} else {
		return this._buffers.join(this._splitChar);
	}
};

function getRootPath() {
	var version = "debug";
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0, pos);
	var projectName = "";
	if (version == "debug" || version == "demo") {
		projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	}
	return (localhostPaht + projectName);
}

$(function() {
	$(".collect").hover(function() {
		$(this).find(".appImg").toggle();
	});
	
	/*返回顶部*/
	$("#back").on("click",function(){
		$("html,body").animate({scrollTop: 0}, "slow");
	});
	var height = $(window).height();//浏览器窗口可视页面的高窟
	$(window).on("scroll",function(){
		var scrollHeight = $(window).scrollTop();//滚动条举例顶部的高度
		return (scrollHeight > 200) ? $("#tzl_sider").fadeIn() : $("#tzl_sider").fadeOut();
	})
    
});

function waterfall(id, clsName){
	var parent = $(id);
	var content = parent.find(clsName);
	var width = content.eq(0).outerWidth();
	var col = Math.floor(parent.width()/width);
	var arr = [];
	content.each(function(index,val){
		var height = content.eq(index).outerHeight();
		if (index < col) {
			arr[index] = height;
		}else{
			var minH = Math.min.apply(null,arr);
			var minIndex = $.inArray(minH,arr);
			$(val).css({
				"position" : "absolute",
				"top" : minH,
				"left" : minIndex*width
			});
			arr[minIndex] += content.eq(index).outerHeight();
		}
		var lastTop = content.eq(content.length-1).offset().top;
		var firstTop = content.eq(0).offset().top;
		var lastHeight = content.eq(content.length-1).outerHeight();
		$(id).css({
        	'height': lastTop - firstTop + lastHeight + 50,
        	'min-height': '500px'
        });
	});
}

function center(parent,child){
	var a=parent.offsetHeight;
	var b=child.offsetHeight;
	child.style.top=(a-b)/2+"px";
}
function numChange(ele1,a1,b1,a2,b2){
	 var a=parseInt(ele1.find(".num").html());
     ele1.click(function(){
        if(ele1.attr("data-flag")==0){
            $(this).find("i").css({"backgroundPosition":"-"+a1+"px -"+b1+"px"});
            $(this).find(".num").html(parseInt($(this).find(".num").html())+1);
            ele1.attr("data-flag","1");
            console.log(ele1.attr("data-flag"));
        }else{
            $(this).find("i").css({"backgroundPosition":"-"+a2+"px -"+b2+"px"});
            $(this).find(".num").html(parseInt($(this).find(".num").html())-1);
            ele1.attr("data-flag","0");
        }
     })
        ele1.mouseover(function(){
        if(ele1.attr("data-flag")==0){
           $(this).find("i").css({"backgroundPosition":"-"+a1+"px -"+b1+"px"});
        }
         }).mouseout(function(event) {
         if(ele1.attr("data-flag")==0){
             $(this).find("i").css({"backgroundPosition":"-"+a2+"px -"+b2+"px"});
         }          
         })
}

function mask(pressButton,mask,shut){
    var maheight=document.documentElement.clientHeight||document.body.clientHeight;
    $(mask).css({"height":maheight});
    $(pressButton).click(function(){
        $(mask).css({"display":"block"});
        $(shut).css({"display":"block"});
     })
     $(mask).click(function(){
        $(mask).css({"display":"none"});
        $(shut).css({"display":"none"});
     })
}
function getClass(tagName,className){
    if(document.getElementsByClassName){
        return document.getElementsByClassName(className);
    }else{
        var tags=document.getElementsByTagName(tagName);
        var tagArr=[];
        for(var i=0;i<tags.length;i++){
            if(tags[i].className==className){
                tagArr.push(tags[i]);
            }
        }
        return tagArr;
    }
}
function textClear(obj){
    obj.focus(function(){
        var txt=$(this).val();
        if(txt==this.defaultValue){
            $(this).val("");
        }
    }).blur(function(){
        var value=this.defaultValue;
        if($(this).val()==""){
            $(this).val(value);
        }
    })
}

/*
* 频率控制 返回函数连续调用时，fn 执行频率限定为每多少时间执行一次
* @param fn {function}  需要调用的函数
* @param delay  {number}    延迟时间，单位毫秒
* @param immediate  {bool} 给 immediate参数传递false 绑定的函数先执行，而不是delay后后执行。
* @return {function}实际调用函数
*/
var throttle = function (fn,delay, immediate, debounce) {
   var curr = +new Date(),//当前事件
       last_call = 0,
       last_exec = 0,
       timer = null,
       diff, //时间差
       context,//上下文
       args,
       exec = function () {
           last_exec = curr;
           fn.apply(context, args);
       };
   return function () {
       curr= +new Date();
       context = this,
       args = arguments,
       diff = curr - (debounce ? last_call : last_exec) - delay;
       clearTimeout(timer);
       if (debounce) {
           if (immediate) {
               timer = setTimeout(exec, delay);
           } else if (diff >= 0) {
               exec();
           }
       } else {
           if (diff >= 0) {
               exec();
           } else if (immediate) {
               timer = setTimeout(exec, -diff);
           }
       }
       last_call = curr;
   }
};
 
/*
* 空闲控制 返回函数连续调用时，空闲时间必须大于或等于 delay，fn 才会执行
* @param fn {function}  要调用的函数
* @param delay   {number}    空闲时间
* @param immediate  {bool} 给 immediate参数传递false 绑定的函数先执行，而不是delay后后执行。
* @return {function}实际调用函数
*/
 
var debounce = function (fn, delay, immediate) {
   return throttle(fn, delay, immediate, true);
};

function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

function setPageNavNum(obj, curPage, totalPage){
	ul=$(obj).find("ul");
	$(ul).empty();
	if(totalPage<=1){
		return;
	} else {
		$(ul).append('<li><a class="prev">上一页</a></li>');
		if(parseInt(curPage)>4){	
			$(ul).append('<li><a>1</a></li><li>...</li>');
			for(var i=curPage-2;i<curPage;i++){
				$(ul).append('<li><a>'+i+'</a></li>');
			}
			$(ul).append('<li style="background-color:#eeeeee"><a>'+curPage+'</a></li>');
		} else {
			for(var i=1;i<=curPage;i++){
				if(i==curPage){
					$(ul).append('<li style="background-color:#eeeeee"><a>'+curPage+'</a></li>');
				} else {
					$(ul).append('<li><a>'+i+'</a></li>');
				}
			}
		}
		if(parseInt(totalPage-curPage)>3){
			for(var i=parseInt(curPage)+1;i<=parseInt(curPage)+2;i++){
				$(ul).append('<li><a>'+i+'</a></li>');
			}
			$(ul).append('<li>...</li><li><a>'+totalPage+"</a></li>");
		} else {
			for(var i=parseInt(curPage)+1;i<=totalPage;i++){
				$(ul).append('<li><a>'+i+'</a></li>');
			}		
		}
		$(ul).append('<li><a class="next">下一页</a></li>');
		$(ul).append('<li><input type="text"></li>');
		$(ul).append('<li><a>GO</a></li>');
	}
	$(obj).css({"margin-left":-$(obj).width()/2+"px"});
	if(curPage==1){
		$(obj).find(".prev").css({"display":"none"});
		$(obj).find(".next").css({"display":"block"});
	}
	else if(curPage==totalPage){
		$(obj).find(".prev").css({"display":"block"});
		$(obj).find(".next").css({"display":"none"});
	}
	else{
		$(obj).find(".prev").css({"display":"block"});
		$(obj).find(".next").css({"display":"block"});
	}
	$(obj).css({"margin-left":-$(obj).width()/2+"px"});
}

function setNavUrl(obj,cur_page,url){
	if(url.indexOf('?')>0){
		url+="&pageNum=";
	} else {
		url+="?pageNum=";
	}
	var liAll=$(obj).find("li");
	for(var i=1; i<liAll.length-3 ; i++){
		$(liAll[i]).click(function(){
			if($(this).find("a").html()==cur_page){
				return;
			}
			cur_page = $(this).find("a").html();
			window.location.href=url+cur_page;
		});
	}	
	$(obj).find(".prev").click(function(){
		cur_page = cur_page-1;
		window.location.href=url+cur_page;
	})
	$(obj).find(".next").click(function(){
		cur_page = cur_page-1+2;
		window.location.href=url+cur_page;
	})
	$(obj).find("li:last-child").click(
			function() {
				var val = $(obj).find("input").val();
				var str = /^[0-9]*[1-9][0-9]*$/;
				if (str.test(val)
						&& parseInt(val) <= parseInt($(obj).find(".page-num")
								.html())) {
					cur_page = val;
					window.location.href = url + cur_page;
				} else {
					$(obj).find("input").select();
				}
			})
	$(obj).find("input").keyup(function() {
		if (event.keyCode == 13) {
			$(obj).find("li:last-child").click();
		}
	});
}

function setNavAjax(obj,cur_page,total_page,data,url,callback){
	var liAll=$(obj).find("li");
	var common = new Common();
	for(var i=1; i<liAll.length-3 ; i++){
		$(liAll[i]).click(function(){
			if($(this).find("a").html()==cur_page){
			}
			cur_page = $(this).find("a").html();
			data['pageNumber']=cur_page;
			common.callAction(data,url,callback);
		});
	}
	$(obj).find(".next").click(function(){
		cur_page = cur_page-1+2;
		data['pageNumber']=cur_page;
		common.callAction(data,url,callback);
	})
	$(obj).find(".prev").click(function(){
		cur_page = cur_page-1;
		data['pageNumber']=cur_page;
		common.callAction(data,url,callback);
	})
	$(obj).find("li:last-child").click(
			function() {
				var val = $(obj).find("input").val();
				var str = /^[0-9]*[1-9][0-9]*$/;
				if (str.test(val)
						&& parseInt(val) <= parseInt(total_page)){
					cur_page = val;
					data['pageNumber']=cur_page;
					common.callAction(data, url, callback);
				} else {
					$(obj).find("input").select();
				}
			})
	$(obj).find("input").keyup(function() {
		if (event.keyCode == 13) {
			$(obj).find("li:last-child").click();
		}
	});	
}

function myAlert(text){
	$("#my-modal-loading .am-modal-hd").html(text);
	$('#my-modal-loading').modal('open');
	setTimeout(function(){
		$('#my-modal-loading').modal('close');
	},1000);
}

function myInfo(text,callback){
	$("#my-alert .am-modal-bd").html(text);
	$('#my-alert').modal('open');
	$('#my-alert .am-modal-btn').on('click',callback);	
}
$(window).load(function(){
	FastClick.attach(document.body);
})

function pageSwitch(pageA,pageB,callback){
	window.scroll(0,0);
	setGoback(pageB,pageA);
	eval(callback);
	$('#pages').css({'-webkit-transform' : 'translate3d(-100%, 0px, 0px)' , '-webkit-transition' : '300ms'});
	$(pageA).css({'display' : 'none'});
	$(pageB).css({'display' : 'block'});
    $("#container").css({"height":$(pageB+' .default').height()+120>$("html").height()?$(pageB+' .default').height()+120+"px":$("html").height() });
}

function setGoback(pageA,pageB){
	$("#icon-home").css({"display":"none"});
	$("#icon-arrow").css({"display":"block"}).click(function(){
		$('#pages').css({'-webkit-transform' : 'translate3d(0px, 0px, 0px)' , '-webkit-transition' : '300ms'});
		$(pageA).css({'display' : 'none'});
		$(pageB).css({'display' : 'block'});
		$("#container").css({"height":$(pageB+' .default').height()+90+"px"});
		$("#icon-arrow").css({"display":"none"});
		$("#icon-home").css({"display":"block"});
		
	})
}


