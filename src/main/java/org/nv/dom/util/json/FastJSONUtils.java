/**
 * com.rightoo.util.json
 * FastJSONUtils.java
 * 2015年4月7日 下午4:54:38
 * @author: z```s
 * @version 1.0
 */
package org.nv.dom.util.json;

import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * <p></p>
 * 2015年4月7日 下午4:54:38
 * @author: z```s
 * @version 1.0 BASE fastjson-1.2.5
 */
public class FastJSONUtils {

	/**
	 * <p></p>
	 * @param object
	 * @return
	 * 2015年4月7日 下午4:55:49
	 * @author: z```s
	 * @version 1.0
	 */
	public static String beanToJSON(Object object) {
		return JSON.toJSONString(object);
	}
	
	/**
	 * <p></p>
	 * @param content
	 * @param clazz
	 * @return
	 * 2015年4月7日 下午5:04:42
	 * @author: z```s
	 * @version 1.0
	 */
	public static <T> T jsonToBean(String content, Class<T> clazz) {
		return JSON.parseObject(content, clazz);
	}
	
	/**
	 * <p></p>
	 * @param content
	 * @param clazz
	 * @return
	 * 2015年4月7日 下午5:06:01
	 * @author: z```s
	 * @version 1.0
	 */
	public static <T> List<T> jsonToList(String content, Class<T> clazz) {
		return JSON.parseArray(content, clazz);
	}
	
}
