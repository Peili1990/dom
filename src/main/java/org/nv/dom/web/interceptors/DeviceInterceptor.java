package org.nv.dom.web.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nv.dom.config.PageParamType;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class DeviceInterceptor implements HandlerInterceptor {
	
	private PCclientHandle pcclientHandle;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute(PageParamType.user_agent)==null||
				request.getSession().getAttribute(PageParamType.user_agent).equals("pc")) {
            return pcclientHandle.pcClient(request, response);
        }
        return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public PCclientHandle getPcclientHandle() {
		return pcclientHandle;
	}

	public void setPcclientHandle(PCclientHandle pcclientHandle) {
		this.pcclientHandle = pcclientHandle;
	}
	
	

}
