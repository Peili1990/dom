package org.nv.dom.web.dao.user;

import org.nv.dom.domain.user.UserCurRole;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
	/**
	 * <p>查询玩家当前状态</p>
	 */
	public UserCurRole getUserCurRoleDao(long userId);
	
	/**
	 * <p>查询用户离线消息数量</p>
	 */
	
	public Integer getOfflineMessageDao(long userId);

}
