/**
 * com.rightoo.util
 * StringUtil.java
 * 2014年10月29日 下午3:27:27
 * @author: z```s
 */
package org.nv.dom.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>字符串工具类</p>
 * 2014年10月29日 下午3:27:27
 * @author: z```s
 */
public class StringUtil {

	/**
	 * <p>判断是否为空</p>
	 * @param arg
	 * @return
	 * 2014年10月29日 下午3:32:51
	 * @author: z```s
	 */
	public static boolean isNullOrEmpty(String arg) {
		boolean rel = false;
		if (arg == null || arg.isEmpty()) {
			rel = true;
		}
		return rel;
	}
	
	/**
	 * <p>验证手机号</p>
	 * @param phoneNo
	 * @return
	 * 2014年10月29日 下午3:28:24
	 * @author: z```s
	 */
	public static boolean isPhoneNo(String phoneNo) {
		if (isNullOrEmpty(phoneNo)) {
			return false;
		}
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
        Matcher m = p.matcher(phoneNo);
        return m.matches();
	}
	
	/**
	 * <p>验证邮箱</p>
	 * @param email
	 * @return
	 * 2014年10月29日 下午3:29:33
	 * @author: z```s
	 */
	public static boolean isEmail(String email) {
		if (isNullOrEmpty(email)) {
			return false;
		}
		String regex = "^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(email);
        return m.matches();
	}
	
	/**
	 * <p>验证是否为纯数字</p>
	 * @param number
	 * @return
	 * 2014年10月29日 下午3:33:26
	 * @author: z```s
	 */
	public static boolean isNumber(String number) {
		if (isNullOrEmpty(number)) {
			return false;
		}
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(number).matches();
	}
	
}
