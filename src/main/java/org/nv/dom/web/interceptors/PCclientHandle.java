package org.nv.dom.web.interceptors;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nv.dom.config.PageParamType;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.regex.CheckMobile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PCclientHandle {
	
	private String pcIndexUrl;

	private Logger logger = LoggerFactory.getLogger(PCclientHandle.class);
	
	public boolean pcClient(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase(); 
		boolean isFromMobile;
        if(null == userAgent){    
            userAgent = "";    
        }  
        isFromMobile=CheckMobile.check(userAgent);  
        //判断是否为移动端访问  
        if(isFromMobile){  
            logger.info("移动端访问");  
            request.getSession().setAttribute(PageParamType.user_agent,"mobile");  
        } else {  
        	logger.info("pc端访问");
        	String type=request.getParameter("type");
        	if(StringUtil.isNullOrEmpty(type)||!type.equals("mobile")){
        		request.getSession().setAttribute(PageParamType.user_agent,"pc");
        		String url = request.getContextPath() + pcIndexUrl;
        		String referer = request.getRequestURL().toString();
				String query = request.getQueryString();
				if (referer != null && referer.contains("?r=") == false) {
					url += "?r=" + URLEncoder.encode(referer, "utf-8");
				}
				if (!StringUtil.isNullOrEmpty(query)){
					url += "&"+ query;
				}
	            response.sendRedirect(url);
	            return false;
        	} else {
        		request.getSession().setAttribute(PageParamType.user_agent,"mobile");
        	}
        }  
		return true;
	}

	public String getPcIndexUrl() {
		return pcIndexUrl;
	}

	public void setPcIndexUrl(String pcIndexUrl) {
		this.pcIndexUrl = pcIndexUrl;
	}
	
	
}
