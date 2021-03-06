package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.dto.account.EmailVerifyDTO;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.PwdChangeDTO;
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
	
	/**
	 * <p>重新发送邮箱验证</p>
	 * @param email
	 * @return
	 * 2014年10月29日 下午3:43:33
	 * @author: z```s
	 */

	public Map<String, Object> resendmail(String email);
	
	/**
	 * <p>密码修改</p>
	 * @param pwdChangeDTO
	 * @return
	 * 2014年10月29日 下午3:43:33
	 * @author: z```s
	 */

	public Map<String, Object> changePassword(PwdChangeDTO pwdChangeDTO);
	
	/**
	 * <p>忘记密码</p>
	 * @param email
	 * @return
	 * 2014年10月29日 下午3:43:33
	 * @author: z```s
	 */

	public Map<String, Object> forgetpassword(String email);

}
