package org.nv.dom.web.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nv.dom.config.PageParamType;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by yuxin.wang on 2015/10/21.
 */
public class LoginInterceptor implements HandlerInterceptor {
    private SessionTimeoutHandle sessionTimeoutHandle;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        if(httpServletRequest.getSession().getAttribute(PageParamType.user_in_session)==null) {
            return sessionTimeoutHandle.timeout(httpServletRequest, httpServletResponse);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }

    public SessionTimeoutHandle getSessionTimeoutHandle() {
        return sessionTimeoutHandle;
    }

    public void setSessionTimeoutHandle(SessionTimeoutHandle sessionTimeoutHandle) {
        this.sessionTimeoutHandle = sessionTimeoutHandle;
    }
}
