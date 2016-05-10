package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.dto.account.LoginDTO;


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

}
