/**    
 * @FileName: ConfigUtil.java
 * @Description: 工具包 
 * @author: z```s
 */
package org.nv.dom.util;

import java.util.ResourceBundle;

/**
 * <p>配置工具类 </p>
 * @author z```s
 * @version 1.2
 */
public class ConfigUtil {

	/**
	 * ResourceBundle 基础配置文件（config_basic.properties）
	 */
	public static final ResourceBundle RESOURCE_BUNDLE_COMMON = ResourceBundle.getBundle("config_basic");
	
	public static final String VERSION = RESOURCE_BUNDLE_COMMON.getString("version");
	
	/**
	 * <p>获取基础配置中的数据项</p>
	 * @param key 配置
	 * @return 配置具体值
	 * @author z```s
	 * 2014年7月25日 下午4:05:34
	 * @version 1.0
	 */
	public static String getBasicProperty(String key) {
		return RESOURCE_BUNDLE_COMMON.getString(key);
	}
	
	/**
	 * <p>根据版本选择mail配置文件配置项</p>
	 * @param key
	 * @return
	 * 2014年10月30日 下午4:19:17
	 * @author: z```s
	 */
	public static String getMailProperty(String key) {
		String version = getBasicProperty("version").toLowerCase();
		String name = "";
		if (version.equals("debug")) {
			name = "mail_debug";
		} else {
			if (version.equals("release")) {
				name = "mail_release";
			} else {
				if (version.equals("demo")) {
					name = "mail_demo";
				} else {
					name = "mail_debug";
				}
			}
		}
		ResourceBundle resourceBundle = ResourceBundle.getBundle(name);
		return resourceBundle.getString(key);
	}
	
	/**
	 * <p>根据版本选择config配置文件配置项</p>
	 * @param key
	 * @return
	 * 2014年10月30日 下午4:19:17
	 * @author: z```s
	 */
	public static String getVersionConfigProperty(String key) {
		String version = getBasicProperty("version").toLowerCase();
		String name = "";
		if (version.equals("debug")) {
			name = "config_debug";
		} else {
			if (version.equals("release")) {
				name = "config_release";
			} else {
				if (version.equals("demo")) {
					name = "config_demo";
				} else {
					name = "config_debug";
				}
			}
		}
		ResourceBundle resourceBundle = ResourceBundle.getBundle(name);
		return resourceBundle.getString(key);
	}
	
	/**
	 * <p>获取APP文件路径</p>
	 * @return
	 * 2015年2月13日 上午10:28:08
	 * @author: z```s
	 */
	public static String getAppFilePath() {
		return getVersionConfigProperty("app.filepath");
	}
	
}
