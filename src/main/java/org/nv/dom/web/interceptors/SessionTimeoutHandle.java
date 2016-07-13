package org.nv.dom.web.interceptors;

import org.apache.commons.lang3.StringUtils;
import org.nv.dom.config.PageParamType;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yuxin.wang on 2015/10/24.
 */
public class SessionTimeoutHandle {

    private Logger logger = LoggerFactory.getLogger(SessionTimeoutHandle.class);

    private String loginUrl;

    /**
     * 判断请求是否是ajax
     * @param httpRequest 请求对象
     * @return
     */
    private boolean isAjaxRequest(HttpServletRequest httpRequest) {
        return httpRequest.getHeader("x-requested-with") != null && httpRequest.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest");
    }

    /**
     * 登录超时的处理
     * @param httpServletRequest
     * @param httpServletResponse
     */
    public void timeout(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, String message) throws IOException {
        //清空session
        
        if(isAjaxRequest(httpServletRequest)) {
            //ajax
        	Map<String, Object> result = new HashMap<String, Object>();
        	result.put(PageParamType.BUSINESS_STATUS, 0);
        	result.put(PageParamType.BUSINESS_MESSAGE, "登录超时");
            httpServletResponse.setContentType("application/json; charset=utf-8");
            httpServletResponse.setCharacterEncoding("utf-8");
            httpServletResponse.getWriter().println(JacksonJSONUtils.beanToJSON(result));
        } else {
            //http
            String url = httpServletRequest.getContextPath() + loginUrl;

            String referer = httpServletRequest.getRequestURL().toString() +
                                    (StringUtils.isNotBlank(httpServletRequest.getQueryString()) ?
                                            "?" + httpServletRequest.getQueryString() : "");
            if (referer != null && referer.contains("?r=")==false) {
                url += "?r=" + URLEncoder.encode(referer, "utf-8");
            }
            httpServletResponse.sendRedirect(url);
            logger.debug("登录超时:{}", message);

        }
    }

    public void timeout(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        timeout(httpServletRequest, httpServletResponse, null);
    }

    public String getLoginUrl() {
        return loginUrl;
    }

    public void setLoginUrl(String loginUrl) {
        this.loginUrl = loginUrl;
    }
}
