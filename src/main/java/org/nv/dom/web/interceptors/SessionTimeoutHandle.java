package org.nv.dom.web.interceptors;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.util.CookiesUtil;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.service.AccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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
    
    @Autowired
    private AccountService accountService;

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
    public boolean timeout(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        
    	LoginDTO loginDTO = new LoginDTO();
        loginDTO.setAccount(CookiesUtil.getCookieValue(httpServletRequest, "nv_account"));
        loginDTO.setPassword(CookiesUtil.getCookieValue(httpServletRequest, "nv_password"));
        Map<String, Object> result = accountService.loginAction(loginDTO);
        if((int)result.get("status") == 1){
			User user = (User) result.get("user");
			user.setPassword("");
			httpServletRequest.getSession().setAttribute(PageParamType.user_in_session, user);
			result.remove("user");
			return true;
		} else {
			if(isAjaxRequest(httpServletRequest)) {
	            //ajax
	        	result = new HashMap<String, Object>();
	        	result.put(PageParamType.BUSINESS_STATUS, 0);
	        	result.put(PageParamType.BUSINESS_MESSAGE, "登录超时");
	            httpServletResponse.setContentType("application/json; charset=utf-8");
	            httpServletResponse.setCharacterEncoding("utf-8");
	            httpServletResponse.getWriter().println(JacksonJSONUtils.beanToJSON(result));
	        } else {
	            //http
	            String url = httpServletRequest.getContextPath() + loginUrl;
				String referer = httpServletRequest.getRequestURL().toString()
						+ (StringUtil.isNullOrEmpty(httpServletRequest.getQueryString())
								? "?" + httpServletRequest.getQueryString() : "");
				if (referer != null && referer.contains("?r=") == false) {
					url += "?r=" + URLEncoder.encode(referer, "utf-8");
				}
	            httpServletResponse.sendRedirect(url);
	        }
		}
        return false;
    }

    public String getLoginUrl() {
        return loginUrl;
    }

    public void setLoginUrl(String loginUrl) {
        this.loginUrl = loginUrl;
    }
}
