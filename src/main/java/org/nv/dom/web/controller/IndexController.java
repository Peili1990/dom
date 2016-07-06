package org.nv.dom.web.controller;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController extends BaseController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView indexView(HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		if(session.getAttribute(PageParamType.user_in_session)==null){
			mav.setViewName("account/login");
			return mav;
		}
		mav.addAllObjects(basicService.getSessionUserService(session));
		mav.addObject("userInfo", userService.getUserCurRole((User) session.getAttribute(PageParamType.user_in_session)));
		return mav;
	}

}
