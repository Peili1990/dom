package org.nv.dom.web.service;

import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;

public interface UserService {
	
	public UserCurRole getUserCurRole(User user);

}
