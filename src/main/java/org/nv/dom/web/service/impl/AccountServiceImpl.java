package org.nv.dom.web.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.nv.dom.cache.CacheData;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.user.Mail;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.EmailVerifyDTO;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.PwdChangeDTO;
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
import org.springframework.util.Assert;

@Service("accountServiceImpl")
public class AccountServiceImpl extends BasicServiceImpl implements AccountService {
	
	private int day = 1;
	
	private String defaultMotto = ConfigUtil.getBasicProperty("default.motto");
	
	private String defaultAvatar = ConfigUtil.getBasicProperty("default.avatar");
	
	private String mailVerifyPath = "WEB-INF/jsp" + File.separator + "account" + File.separator + "email-content.jsp";
	
	private String mailResetPath = "WEB-INF/jsp" + File.separator + "account" + File.separator + "email-reset.jsp";
	
	private String host = EncryptUtil.decryptDES(ConfigUtil.getMailProperty("mail.host"), EncryptUtil.KEY);
	
	private String from = EncryptUtil.decryptDES(ConfigUtil.getMailProperty("mail.user"), EncryptUtil.KEY);
	
	private String password = EncryptUtil.decryptDES(ConfigUtil.getMailProperty("mail.password"), EncryptUtil.KEY);
	
	private String veritify_subject = "维多利亚的噩梦-邮箱账号验证信息";
	
	private String reset_subject = "维多利亚的噩梦-忘记密码邮箱账号验证";
	
	@Autowired
	private AccountMapper accountMapper;

	@Override
	public Map<String, Object> loginAction(LoginDTO loginDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(loginDTO != null && 
				!StringUtil.isNullOrEmpty(loginDTO.getAccount()) && 
				!StringUtil.isNullOrEmpty(loginDTO.getPassword()), "参数异常");
		User user = accountMapper.getUserByAccountDao(loginDTO);
		Assert.notNull(user, "用户名或密码错误");
		if(StringUtil.isEmail(user.getAccount())&&"0".equals(user.getStatus())){
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "该邮箱还未验证");
			result.put("email", user.getAccount());
			sendVerifyMail(user.getId(), user.getAccount(),user.getNickname());
		} else {
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "登录成功");
			result.put("user", user);
		}
		return result;
	}

	@Override
	public Map<String, Object> registerAction(RegisterDTO registerDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(registerDTO != null && 
				!StringUtil.isNullOrEmpty(registerDTO.getAccount()) && 
				!StringUtil.isNullOrEmpty(registerDTO.getPassword()) &&
				!StringUtil.isNullOrEmpty(registerDTO.getNickname()), "参数异常");
		Assert.isTrue(StringUtil.isEmail(registerDTO.getAccount()), "请用邮箱注册");
		Assert.isTrue(accountMapper.getCountByAccountDao(registerDTO) == 0, "该邮箱或昵称已被注册");	
		registerDTO.setMotto(defaultMotto);
		registerDTO.setAvatar(defaultAvatar);
		Assert.isTrue(accountMapper.insertUserDao(registerDTO) == 1, "系统或网络异常");
		sendVerifyMail(registerDTO.getId(),registerDTO.getAccount(),registerDTO.getNickname());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "注册成功，请验证邮箱");
		result.put("email", registerDTO.getAccount());
		return result;
	}
	
	private void sendVerifyMail(long userId, String email, String nickname){
		String path = CacheData.getBasePath().concat(mailVerifyPath);
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
					e.printStackTrace();
				}
			}
		});	
	}

	@Override
	public Map<String, Object> emailverify(EmailVerifyDTO emailVerifyDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.notNull(emailVerifyDTO, "参数异常，请重试");	
		long id = Long.parseLong(EncryptUtil.decryptBase64(emailVerifyDTO.getUu()));
		String email = EncryptUtil.decryptBase64(emailVerifyDTO.getEe());
		Assert.isTrue(!isExpire(emailVerifyDTO), "链接失效，请重新发送验证邮件");	
		Assert.isTrue(accountMapper.getUserCountByIdAndEmail(id, email) == 1, "注册用户与邮箱不匹配");		
		if("register".equals(emailVerifyDTO.getVerifyType()) && accountMapper.verifyUserAndEmailStatus(id)!=1){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "邮箱验证失败");
			result.put("email", email);
			return result;
		}
		redisClient.set(email, 3600, RedisConstant.WAITING_TO_BE_VERIFY);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "邮箱验证成功");
		result.put("email", email);
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
		Assert.isTrue(!StringUtil.isNullOrEmpty(email), "邮箱地址为空");
		Assert.isTrue(StringUtil.isEmail(email), "邮箱地址格式错误");
		User user = accountMapper.getUserByEmail(email,true);
		Assert.notNull(user, "该邮箱未注册或已激活");
		sendVerifyMail(user.getId(),email,user.getNickname());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "验证邮件发送成功");
		result.put("email", email);
		return result;
	}

	@Override
	public Map<String, Object> changePassword(PwdChangeDTO pwdChangeDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(!StringUtil.isNullOrEmpty(pwdChangeDTO.getAccount())&&pwdChangeDTO.getUserId()>0){
			Assert.isTrue(accountMapper.changePasswordDao(pwdChangeDTO) == 1, "旧密码错误");
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "密码修改成功");
		} else {
			Assert.isTrue(StringUtil.isEmail(pwdChangeDTO.getAccount()), "不可重置密码");
			Assert.isTrue(redisClient.get(pwdChangeDTO.getAccount(), "").equals(RedisConstant.WAITING_TO_BE_VERIFY), "不可重置密码");
			redisClient.del(pwdChangeDTO.getAccount());
			accountMapper.changePasswordDao(pwdChangeDTO);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "密码重置成功");
		} 
		return result;
	}

	@Override
	public Map<String, Object> forgetpassword(String email) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(!StringUtil.isNullOrEmpty(email), "邮箱地址为空");
		Assert.isTrue(StringUtil.isEmail(email), "邮箱地址格式错误");
		User user = accountMapper.getUserByEmail(email,false);
		Assert.notNull(user, "该邮箱未注册");
		sendResetMail(user.getId(),email,user.getNickname());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "验证邮件发送成功");
		result.put("email", email);
		return result;
	}
	
	private void sendResetMail(long userId, String email, String nickname){
		String path = CacheData.getBasePath().concat(mailResetPath);
		String params = "uu=" + EncryptUtil.encryptBase64(String.valueOf(userId)) + "&" 
				+ "ee=" + EncryptUtil.encryptBase64(email) + "&" 
		        + "tt=" + EncryptUtil.encryptBase64(String.valueOf(new Date().getTime())) ;
		String url = CacheData.getBaseUrl() + "resetPassword?" + params;
		String content = MailUtil.getMailContent(path, nickname, url, DateFormatUtil.getCurrentDateString("yyyy-MM-dd HH:mm"));
		final Mail mail = new Mail(from, password, host, email, reset_subject, content);
		ThreadUtils.fixedPool.execute(new Runnable() {
			@Override
			public void run() {
				try {
					MailUtil.mailSend(mail);
				} catch (GeneralSecurityException e) {
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		});	
	}

}
