package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.essay.Essay;
import org.nv.dom.domain.user.User;
import org.nv.dom.web.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EssayController {
	
	@Autowired
	EssayService essayService;

	@ResponseBody
	@RequestMapping(value = "/publishEssay", method = RequestMethod.POST)
	public Map<String, Object> publish(@ModelAttribute("essay") Essay essay, HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		essay.setUserId(user.getId());
		return essayService.publishEssay(essay);
	} 

}
