package org.nv.dom.web.service;

import java.util.Map;

public interface AssembleService {
	
	public Map<String, Object> getNewspaperList(long userId);
	
	public Map<String, Object> getNewspaperDetail(long newspaperId);

}