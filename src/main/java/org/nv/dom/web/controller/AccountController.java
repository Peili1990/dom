package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.web.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AccountController extends BaseController {
	
	@Autowired
	AccountService accountService;
	
	@ResponseBody
	@RequestMapping(value = "/loginAction.do", method = RequestMethod.POST)
	public Map<String, Object> loginAction(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request) {
		return null;
	}

}
