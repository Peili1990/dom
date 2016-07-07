package org.nv.dom.web.controller;

import javax.servlet.http.HttpSession;

import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController extends BaseController{
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/mine", method = RequestMethod.GET)
	public ModelAndView mineView(HttpSession session){
		ModelAndView mav = new ModelAndView("mine/mine");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}

}
