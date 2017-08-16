package org.nv.dom.web.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.nv.dom.config.PageParamType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Class ExceptionHandler.java
 *
 * @author liyisen
 * @title ExceptionHandler.java
 * @Date 2017年8月11日
 */

public class ExceptionHandler {
	
	private static Logger logger = LoggerFactory.getLogger(ExceptionHandler.class);
	
	/**
     * 公共处理异常的类
     *
     * @param pjd
     * @return
     */
    public Object handleException(ProceedingJoinPoint pjd, Throwable e) {  
    	NVException nvException;
    	if (e instanceof NVException) {
    		nvException = (NVException)e;
        }else {
            String errorMsg;
            try {
                errorMsg = e.getMessage();
                if (errorMsg == null) {
                    errorMsg = e.toString();
                }
            } catch (Exception e1) {
                errorMsg = "系统异常";
            }
            nvException = new NVException(-1, errorMsg);
        }
    	logger.error(nvException.getMessage());
    	Map<String, Object> result = new HashMap<>();
    	result.put(PageParamType.BUSINESS_STATUS, -1);
    	result.put(PageParamType.BUSINESS_MESSAGE, nvException.getMessage());
    	return result;
    }

    /**
     * 调用函数
     *
     * @param pjd
     * @return Object
     * @title handle
     * @author daiqiang
     * @since v1.0.0
     * @sample
     */
    public Object handle(ProceedingJoinPoint pjd) {
        try {
            return pjd.proceed();
        } catch (Throwable throwable) {
            Object result = handleException(pjd, throwable);
            return result;
        }
    }

}
