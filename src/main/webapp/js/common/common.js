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

function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}

function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function setCookie(name, value, time) {
	var strsec = getsec(time);
	var exp = new Date();
	exp.setTime(exp.getTime() + strsec * 1);
	document.cookie = name + "=" + escape(value) + ";expires="
			+ exp.toGMTString();
}

function getsec(str) {
	var str1 = str.substring(1, str.length) * 1;
	var str2 = str.substring(0, 1);
	if (str2 == "s") {
		return str1 * 1000;
	} else if (str2 == "h") {
		return str1 * 60 * 60 * 1000;
	} else if (str2 == "d") {
		return str1 * 24 * 60 * 60 * 1000;
	}
}

function timeoutHandle(){
	myInfo("登录超时",function(){
		window.location = getRootPath() + "/login";
	});
}

