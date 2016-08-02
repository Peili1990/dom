package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.service.AssembleService;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AssembleController extends BaseController {
	
	@Autowired
	AssembleService assembleService;
	
	@Autowired
	PlayerService playerService;
		
	@RequestMapping(value = "/assemble", method = RequestMethod.GET)
	public ModelAndView loginView(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("assemble/assemble");
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		mav.addObject("playerInfoStr",JacksonJSONUtils.beanToJSON(playerService.getPlayerInfoByUserId(user.getId())));
		mav.addAllObjects(assembleService.getNewspaperList(user.getId()));
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAssembleDetail", method = RequestMethod.POST)
	public Map<String, Object> getNewspaperDetail(@RequestParam("newspaperId") long newspaperId, HttpSession session) {
		return assembleService.getNewspaperDetail(newspaperId);
	}

}
