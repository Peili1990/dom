package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.service.AssembleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("assembleServieImpl")
public class AssembleServiceImpl implements AssembleService {
	
	private static Logger logger = Logger.getLogger(AssembleServiceImpl.class);
	
	@Autowired
	NewspaperMapper newspaperMapper;

	@Override
	public Map<String, Object> getNewspaperList(long userId) {
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			List<Newspaper> newspaperList = newspaperMapper.getNewspaperListDao(userId);
			result.put("newspaperList", newspaperList);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取报纸列表成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	

}
