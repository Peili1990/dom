package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.dto.account.EmailVerifyDTO;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.RegisterDTO;


/**
 * <p>账号服务</p>
 * 2014年10月29日 下午3:43:04
 * @author: z```s
 */
public interface AccountService {	
	
	/**
	 * <p>登录</p>
	 * @param loginDTO
	 * @return
	 * 2014年10月29日 下午3:43:33
	 * @author: z```s
	 */
	public Map<String, Object> loginAction(LoginDTO loginDTO);
	
	/**
	 * <p>注册</p>
	 * @param registerDTO
	 * @return
	 * 2014年10月29日 下午3:43:33
	 * @author: z```s
	 */
	public Map<String, Object> registerAction(RegisterDTO registerDTO);
	
	/**
	 * <p>邮箱验证</p>
	 * @param registerDTO
	 * @return
	 * 2014年10月29日 下午3:43:33
	 * @author: z```s
	 */

	public Map<String, Object> emailverify(EmailVerifyDTO emailVerifyDTO);

}
