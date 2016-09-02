package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.RegisterDTO;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.StringUtil;
import org.nv.dom.web.dao.account.AccountMapper;
import org.nv.dom.web.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountServiceImpl")
public class AccountServiceImpl implements AccountService {
	
	private String defaultMotto = ConfigUtil.getBasicProperty("default.motto");
	
	private String defaultAvatar = ConfigUtil.getBasicProperty("default.avatar");
	
	@Autowired
	private AccountMapper accountMapper;

	@Override
	public Map<String, Object> loginAction(LoginDTO loginDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (loginDTO == null 
				|| StringUtil.isNullOrEmpty(loginDTO.getAccount())
				|| StringUtil.isNullOrEmpty(loginDTO.getPassword())) {
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常");
			return result;
		}
		User user = accountMapper.getUserByAccountDao(loginDTO);
		if(user != null){
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "登录成功");
			result.put("user", user);
		} else {
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "用户名或密码错误");
		}	
		return result;
	}

	@Override
	public Map<String, Object> registerAction(RegisterDTO registerDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (registerDTO == null 
				|| StringUtil.isNullOrEmpty(registerDTO.getAccount())
				|| StringUtil.isNullOrEmpty(registerDTO.getPassword())
				|| StringUtil.isNullOrEmpty(registerDTO.getNickname())
				|| StringUtil.isNullOrEmpty(registerDTO.getInvitecode())) {
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "信息请填写完整");
			return result;
		}
		if (accountMapper.getCountByAccountDao(registerDTO)>0){
			result.put(PageParamType.BUSINESS_STATUS, -3);
			result.put(PageParamType.BUSINESS_MESSAGE, "该用户名或昵称已被注册");
			return result;
		}
		if (accountMapper.getInvCodeDao(registerDTO.getInvitecode()) != 1){
			result.put(PageParamType.BUSINESS_STATUS, -4);
			result.put(PageParamType.BUSINESS_MESSAGE, "邀请码无效或已被使用");
			return result;
		}	
		registerDTO.setMotto(defaultMotto);
		registerDTO.setAvatar(defaultAvatar);
		if (accountMapper.insertUserDao(registerDTO) == 1 && accountMapper.updateInvCodeDao(registerDTO) == 1){
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "注册成功");
			return result;
		} else {
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统或网络异常");
			return result;
		}
	}

}
