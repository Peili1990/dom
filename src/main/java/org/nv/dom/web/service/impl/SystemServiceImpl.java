package org.nv.dom.web.service.impl;

import org.apache.log4j.Logger;
import org.nv.dom.web.dao.system.SystemMapper;
import org.nv.dom.web.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("systemServiceImpl")
public class SystemServiceImpl implements SystemService {
	
	private static Logger logger = Logger.getLogger(SystemServiceImpl.class);
	
	@Autowired
	SystemMapper systemMapper;

	@Override
	public String getInfoMessage() {
		String message = "";
		try{
			message = systemMapper.getInfoMessageDao();
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return message;
	}
	
	

}
