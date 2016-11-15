/**
 * com.taozhenli.util.thread
 * ThreadUtils.java
 * 2015年5月25日 下午4:44:27
 * @author: z```s
 * @version 1.0
 */
package org.nv.dom.util;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * <p></p>
 * 2015年5月25日 下午4:44:27
 * @author: z```s
 * @version 1.0
 */
public class ThreadUtils {

	//单线程线程池
	public static ExecutorService singlePool = Executors.newSingleThreadExecutor();
	
	//固定大小线程池
	public static ExecutorService fixedPool = Executors.newFixedThreadPool(5);
	
	//缓存线程池
	public static ExecutorService cachedPool = Executors.newCachedThreadPool();
	
}
