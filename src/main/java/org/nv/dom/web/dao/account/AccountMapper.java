package org.nv.dom.web.dao.account;

import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.RegisterDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountMapper {
	
	/**
	 * <p>获取用户信息</p>
	 * @param loginDTO
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	public User getUserByAccountDao(LoginDTO loginDTO);
	
	/**
	 * <p>获取同名账号数量</p>
	 * @param account
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	
	public int getCountByAccountDao(String account);
	
	/**
	 * <p>创建账号</p>
	 * @param registerDTO
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	
	public int insertUserDao(RegisterDTO registerDTO);

}
