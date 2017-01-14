package org.nv.dom.web.controller;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.web.service.AssembleService;
import org.nv.dom.web.service.EssayService;
import org.nv.dom.web.service.PlayerService;
import org.nv.dom.web.service.SystemService;
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
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	AssembleService assembleService;
	
	@Autowired
	EssayService essayService;
	
	@Autowired
	SystemService systemService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView indexView(HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		mav.addAllObjects(basicService.getSessionUserService(session));
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		UserCurRole userInfo = userService.getUserCurRole(user);
		mav.addObject("userInfo", userInfo);
		if(userInfo.getPlayerId()>0L){
			session.setAttribute(PageParamType.game_id_in_session, userInfo.getGameId());
			session.setAttribute(PageParamType.player_id_in_session, userInfo.getPlayerId());
			mav.addObject("playerInfo", playerService.getPlayerInfoByUserId(user.getId()));
			mav.addAllObjects(assembleService.getLatestNewspaperInfo(userInfo.getGameId()));
		}	
		mav.addAllObjects(essayService.getEssayList(null));
		mav.addObject("infoMessage",systemService.getInfoMessage());
		return mav;
	}
	
	@RequestMapping(value = "/pcIndex", method = RequestMethod.GET)
	public ModelAndView pcIndexView(HttpSession session) {
		ModelAndView mav = new ModelAndView("pages/pc-index");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/notSupport", method = RequestMethod.GET)
	public ModelAndView notSupportView(HttpSession session) {
		ModelAndView mav = new ModelAndView("pages/not-support");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}

}
