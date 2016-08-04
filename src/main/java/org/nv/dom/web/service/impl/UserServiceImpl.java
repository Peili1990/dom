package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.web.dao.user.UserMapper;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	private static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public UserCurRole getUserCurRole(User user) {
		try{
			return userMapper.getUserCurRoleDao(user.getId());
		} catch (Exception e){
			logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public Map<String, Object> getOfflineMessage(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			Integer offlinespeech = userMapper.getOfflineMessageDao(userId);
			result.put("offlineSpeech",offlinespeech);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取离线消息数量成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取离线消息数量失败"); 
		}
		return result;
	}

}
