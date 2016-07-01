package org.nv.dom.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AssembleController extends BaseController {
		
	@RequestMapping(value = "/assemble", method = RequestMethod.GET)
	public ModelAndView loginView(HttpSession session) {
		ModelAndView mav = new ModelAndView("assemble/assemble");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}

}
