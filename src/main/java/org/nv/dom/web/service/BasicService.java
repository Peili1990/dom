package org.nv.dom.web.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface BasicService {
	
	
	public Map<String, Object> getSessionUserService(HttpSession session);

}
