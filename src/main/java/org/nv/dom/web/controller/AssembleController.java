package org.nv.dom.web.controller;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.web.service.AssembleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AssembleController extends BaseController {
	
	@Autowired
	AssembleService assembleService;
		
	@RequestMapping(value = "/assemble", method = RequestMethod.GET)
	public ModelAndView loginView(HttpSession session) {
		ModelAndView mav = new ModelAndView("assemble/assemble");
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		mav.addAllObjects(assembleService.getNewspaperList(user.getId()));
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}

}
