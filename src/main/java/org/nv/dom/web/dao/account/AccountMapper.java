package org.nv.dom.web.dao.account;

import org.apache.ibatis.annotations.Param;
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
	 * 
	 */
	public User getUserByAccountDao(LoginDTO loginDTO);
	
	/**
	 * <p>获取同名账号数量</p>
	 * @param account
	 * @return
	 *
	 */
	
	public int getCountByAccountDao(RegisterDTO registerDTO);
	
	/**
	 * <p>查询邀请码</p>
	 * @param registerDTO
	 * @return
	 * 
	 */
	
	public int getInvCodeDao(String invitecode);
	
	/**
	 * <p>创建账号</p>
	 * @param registerDTO
	 * @return
	 * 
	 */
	
	public int insertUserDao(RegisterDTO registerDTO);
	
	/**
	 * <p>邀请码状态修改</p>
	 * @param registerDTO
	 * @return
	 * 
	 */
	
	public int updateInvCodeDao(RegisterDTO registerDTO);
	
	/**
	 * <p>根据id和email获取账号数量</p>
	 * @param id
	 * @param email
	 * @return
	 * 
	 */	
	
	public int getUserCountByIdAndEmail(@Param("id")long id, @Param("email")String email);

	/**
	 * <p>根据id激活账号</p>
	 * @param id
	 * @return
	 * 
	 */
	
	public int verifyUserAndEmailStatus(long id);
}
