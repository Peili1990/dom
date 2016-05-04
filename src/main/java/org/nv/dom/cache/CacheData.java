package org.nv.dom.cache;

public class CacheData {
	private static String baseUrl = "";
	// 项目绝对路径，为操作系统文件系统路径 如：C:\program files\
	private static String basePath = "";

	/**
	 * @return the baseUrl
	 */
	public static final String getBaseUrl() {
		return baseUrl;
	}

	/**
	 * @param baseUrl
	 *            the baseUrl to set
	 */
	public static final synchronized void setBaseUrl(String baseUrl) {
		CacheData.baseUrl = baseUrl;
	}

	/**
	 * @return the basePath
	 */
	public static final String getBasePath() {
		return basePath;
	}

	/**
	 * @param basePath
	 *            the basePath to set
	 */
	public static final synchronized void setBasePath(String basePath) {
		CacheData.basePath = basePath;
	}

}