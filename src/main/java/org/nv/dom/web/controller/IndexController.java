package org.nv.dom.web.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ipr.search.api.dto.request.SearchDocumentsDTO;
import com.ipr.search.api.dto.request.SolrQuery;
import com.ipr.search.api.enums.Operation;
import com.ipr.search.api.service.ISolrService;
import com.zhubajie.common.dto.Request;


@Controller
public class IndexController extends BaseController {
	
	@Autowired
	ISolrService solrService;
	
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
	
	@RequestMapping(value = "/solr", method = RequestMethod.GET)
	public ModelAndView solrIndexView(HttpSession session) {
		ModelAndView mav = new ModelAndView("pages/solr");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/solrSearch", method = RequestMethod.POST)
	public Map<String,Object> solrSearch(@RequestParam("regUsername") String regUsername, HttpSession session){
		SearchDocumentsDTO searchDocumentsDTO = new SearchDocumentsDTO("copyright");
		searchDocumentsDTO.setQuery(new SolrQuery().equal(Operation.AND, "regUsername", regUsername));
		Request<SearchDocumentsDTO> request = new Request<>();
		request.setData(searchDocumentsDTO);
		Map<String,Object> result = new HashMap<>();
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put("documents", solrService.searchDocuments(request));
		return result;
	}

}
