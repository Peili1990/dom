/**
 * DateFormatUtil.java
 * com.xuexibao.util
 * 2014年9月11日 上午11:17:10
 * @author z```s
 */
package org.nv.dom.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p></p>
 * @author z```s
 * @version 1.0
 */
public class DateFormatUtil {

	public static final String DEFAULT_DATETIME = "yyyy-MM-dd HH:mm:ss";
	
	public static final String SHORT_DATETIME = "yyyyMMddHHmmss";
	
	public static final String SHORT_DATETIME_ALL = "yyyyMMddHHmmssS";
	
	public static final String FULL_DATETIME = "yyyy-MM-dd G 'at' hh:mm:ss z";
	
	public static final String DEFAULT_DATE = "yyyy-MM-dd";
	
	/**
	 * <p></p>
	 * @param pattern
	 * @return
	 * @author z```s 
	 * 2014年9月11日 上午11:23:39
	 * @version 1.0
	 */
	public static SimpleDateFormat getSimpleDateFormat(String pattern) {
		return new SimpleDateFormat(pattern);
	}
	
	/**
	 * <p></p>
	 * @param pattern
	 * @return
	 * @author z```s 
	 * 2014年9月17日 下午12:34:12
	 * @version 1.0
	 */
	public static String getCurrentDateString(String pattern) {
		return getSimpleDateFormat(pattern).format(new Date());
	}
	
}
