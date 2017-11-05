package org.nv.dom.web.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class OptionalHandler {
	
	public Object around(ProceedingJoinPoint pjp) throws Throwable{  
        System.out.println("beginning----");   
        Object object = pjp.proceed();    //运行doSth()，返回值用一个Object类型来接收  
        object = "Mission Two";   //改变返回值  
        System.out.println("ending----");  
        return object;      
    }  

}
