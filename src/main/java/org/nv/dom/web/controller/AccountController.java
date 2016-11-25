package org.nv.dom.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.EmailVerifyDTO;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.PwdChangeDTO;
import org.nv.dom.dto.account.RegisterDTO;
import org.nv.dom.web.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccountController extends BaseController {
	
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginView(HttpSession session) {
		ModelAndView mav = new ModelAndView("account/login");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/loginAction", method = RequestMethod.POST)
	public Map<String, Object> loginAction(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request) {
		Map<String, Object> result = accountService.loginAction(loginDTO);
		if((int)result.get("status")==1){
			User user = (User) result.get("user");
			user.setPassword("");
			request.getSession().setAttribute(PageParamType.user_in_session, user);
			result.remove("user");
		}
		return result;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerView(HttpSession session) {
		ModelAndView mav = new ModelAndView("account/register");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/registerAction", method = RequestMethod.POST)
	public Map<String, Object> registerAction(@ModelAttribute("registerDTO") RegisterDTO registerDTO, HttpServletRequest request) {
		Map<String, Object> result = accountService.registerAction(registerDTO);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/resendmail", method = RequestMethod.POST)
	public Map<String, Object> reSendmailAction(@RequestParam("email") String email, HttpSession session) {
		Map<String, Object>	result = accountService.resendmail(email);
		return result;
	}
	
	@RequestMapping(value = "/emailverify", method = RequestMethod.GET)
	public ModelAndView registEmailVerifyView(@ModelAttribute("emailVerifyDTO") EmailVerifyDTO emailVerifyDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/email-verify");
		mav.addAllObjects(accountService.emailverify(emailVerifyDTO));
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/logoutAction", method = RequestMethod.POST)
	public Map<String, Object> logoutAction(HttpServletRequest request) {
		request.getSession().removeAttribute(PageParamType.user_in_session);
		request.getSession().removeAttribute(PageParamType.user_agent);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(PageParamType.BUSINESS_STATUS,1);
		result.put(PageParamType.BUSINESS_MESSAGE, "登出成功");
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/pwdChangeAction", method = RequestMethod.POST)
	public Map<String, Object> pwdChangeAction(@ModelAttribute("pwdChangeDTO") PwdChangeDTO pwdChangeDTO, HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		pwdChangeDTO.setAccount(user.getAccount());
		pwdChangeDTO.setUserId(user.getId());
		return accountService.changePassword(pwdChangeDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/forgetpassword", method = RequestMethod.POST)
	public Map<String, Object> forgetpasswordAction(@RequestParam("email") String email, HttpServletRequest request) {
		Map<String, Object>	result = accountService.forgetpassword(email);
		return result;
	}
	
	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public ModelAndView resetPasswordAction(@ModelAttribute("emailVerifyDTO") EmailVerifyDTO emailVerifyDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/password-reset");
		mav.addAllObjects(accountService.emailverify(emailVerifyDTO));
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/pwdResetAction", method = RequestMethod.POST)
	public Map<String, Object> pwdResetAction(@ModelAttribute("pwdChangeDTO") PwdChangeDTO pwdChangeDTO, HttpSession session) {
		return accountService.changePassword(pwdChangeDTO);
	}

}
