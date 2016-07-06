package org.nv.dom.web.service.impl;

import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.web.dao.user.UserMapper;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {	
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public UserCurRole getUserCurRole(User user) {
		return userMapper.getUserCurRoleDao(user.getId());
	}

}
