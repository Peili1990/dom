package org.nv.dom.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController extends BaseController{
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public ModelAndView loginView(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("chat/chat");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}

}
