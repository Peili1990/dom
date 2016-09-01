package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.cache.CacheData;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.user.AvatarUploadDTO;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "/getOfflineMessage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getOfflineMessage(HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.getOfflineMessage(user.getId());
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveOfflineSpeech", method = RequestMethod.POST)
	public Map<String, Object> saveOfflineSpeech(@ModelAttribute("offlineMessage") OfflineMessage offlineMessage , HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		offlineMessage.setUserId(user.getId());
		return userService.saveOfflineSpeech(offlineMessage);
	}
	
	@ResponseBody
	@RequestMapping(value = "/avatarUpload", method = RequestMethod.POST)
	public Map<String, Object> avatarUploadAction(@ModelAttribute("AvatarUploadDTO") AvatarUploadDTO avatarUploadDTO , HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		avatarUploadDTO.setUserId(user.getId());
		avatarUploadDTO.setPath(CacheData.getBasePath());
		Map<String, Object> result = userService.avatarUpload(avatarUploadDTO);
		return result;
	}
	
	

}
