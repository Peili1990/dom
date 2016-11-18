package org.nv.dom.web.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.nv.dom.cache.CacheData;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.Mail;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.EmailVerifyDTO;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.RegisterDTO;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.DateFormatUtil;
import org.nv.dom.util.EncryptUtil;
import org.nv.dom.util.MailUtil;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.ThreadUtils;
import org.nv.dom.web.dao.account.AccountMapper;
import org.nv.dom.web.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountServiceImpl")
public class AccountServiceImpl implements AccountService {
	
	private int day = 1;
	
	private String defaultMotto = ConfigUtil.getBasicProperty("default.motto");
	
	private String defaultAvatar = ConfigUtil.getBasicProperty("default.avatar");
	
	private String mailContentPath = "jsp" + File.separator + "account" + File.separator + "email-content.jsp";
	
	private String host = EncryptUtil.decryptDES(ConfigUtil.getMailProperty("mail.host"), EncryptUtil.KEY);
	
	private String from = EncryptUtil.decryptDES(ConfigUtil.getMailProperty("mail.user"), EncryptUtil.KEY);
	
	private String password = EncryptUtil.decryptDES(ConfigUtil.getMailProperty("mail.password"), EncryptUtil.KEY);
	
	private String veritify_subject = "维多利亚的噩梦-邮箱账号验证信息";
	
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
			if(StringUtil.isEmail(user.getAccount())&&"0".equals(user.getStatus())){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "该邮箱还未验证");
				result.put("email", user.getAccount());
				sendVerifyMail(user.getId(), user.getAccount(),user.getNickname());
			} else {
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "登录成功");
				result.put("user", user);
			}
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
				|| StringUtil.isNullOrEmpty(registerDTO.getNickname())) {
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "信息请填写完整");
			return result;
		}
		if (accountMapper.getCountByAccountDao(registerDTO)>0){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "该邮箱或昵称已被注册");
			return result;
		}
//		if (accountMapper.getInvCodeDao(registerDTO.getInvitecode()) != 1){
//			result.put(PageParamType.BUSINESS_STATUS, -1);
//			result.put(PageParamType.BUSINESS_MESSAGE, "邀请码无效或已被使用");
//			return result;
//		}	
		registerDTO.setMotto(defaultMotto);
		registerDTO.setAvatar(defaultAvatar);
		if (accountMapper.insertUserDao(registerDTO) != 1){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统或网络异常");
			return result;
		}
		sendVerifyMail(registerDTO.getId(),registerDTO.getAccount(),registerDTO.getNickname());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "注册成功，请验证邮箱");
		result.put("email", registerDTO.getAccount());
		return result;
	}
	
	private void sendVerifyMail(long userId, String email, String nickname){
		String path = CacheData.getBasePath().concat(mailContentPath);
		String params = "uu=" + EncryptUtil.encryptBase64(String.valueOf(userId)) + "&" 
				+ "ee=" + EncryptUtil.encryptBase64(email) + "&" 
		        + "tt=" + EncryptUtil.encryptBase64(String.valueOf(new Date().getTime())) ;
		String url = CacheData.getBaseUrl() + "emailverify?" + params;
		String content = MailUtil.getMailContent(path, nickname, url, DateFormatUtil.getCurrentDateString("yyyy-MM-dd HH:mm"));
		final Mail mail = new Mail(from, password, host, email, veritify_subject, content);
		ThreadUtils.fixedPool.execute(new Runnable() {
			@Override
			public void run() {
				try {
					MailUtil.mailSend(mail);
				} catch (GeneralSecurityException e) {
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});	
	}

	@Override
	public Map<String, Object> emailverify(EmailVerifyDTO emailVerifyDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (emailVerifyDTO == null) {
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常，请重试");
			return result;
		}	
		long id = Long.parseLong(EncryptUtil.decryptBase64(emailVerifyDTO.getUu()));
		String email = EncryptUtil.decryptBase64(emailVerifyDTO.getEe());
		if(isExpire(emailVerifyDTO)){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "链接失效，请重新发送验证邮件");
			result.put("email", email);
			return result;
		}		
		if(accountMapper.getUserCountByIdAndEmail(id, email)!=1){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "注册用户与邮箱不匹配");
			result.put("email", email);
			return result;
		}
		if(accountMapper.verifyUserAndEmailStatus(id)!=1){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "邮箱验证失败");
			result.put("email", email);
			return result;
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "邮箱验证成功");
		return result;
	}
	
	private boolean isExpire(EmailVerifyDTO emailVerifyDTO){
		long sendMil = Long.parseLong(EncryptUtil.decryptBase64(emailVerifyDTO.getTt()));
		long curMil = new Date().getTime();
		long betweenMil = curMil - sendMil;
		long oneDayMil = day * 24l * 60l * 60l * 1000l;
		return betweenMil > oneDayMil;
	}

	@Override
	public Map<String, Object> resendmail(String email) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (StringUtil.isNullOrEmpty(email)) {
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "邮箱地址为空");
			return result;
		}
		if (!StringUtil.isEmail(email)) {
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "邮箱地址格式错误");
			return result;
		}
		User user = accountMapper.getUserByEmail(email);
		if (user == null) {
			result.put(PageParamType.BUSINESS_STATUS, -3);
			result.put(PageParamType.BUSINESS_MESSAGE, "该邮箱未注册或已激活");
			return result;
		}
		sendVerifyMail(user.getId(),email,user.getNickname());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "验证邮件发送成功");
		result.put("email", email);
		return result;
	}

}
