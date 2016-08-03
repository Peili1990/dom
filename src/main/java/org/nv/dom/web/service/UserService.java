package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;

public interface UserService {
	
	public UserCurRole getUserCurRole(User user);
	
	public Map<String, Object> getOfflineMessage(long userId);

}
