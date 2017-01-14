package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.nv.dom.web.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RuleController extends BaseController{
	
	@Autowired
	RuleService ruleService;
	
	@RequestMapping(value = "/rule", method = RequestMethod.GET)
	public ModelAndView ruleView(HttpSession session) {
		ModelAndView mav = new ModelAndView("rule/rule");
		mav.addAllObjects(ruleService.getRuleRow());
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/getRuleContent", method = RequestMethod.POST)
	public Map<String,Object> getApplyingGames(@ModelAttribute("getRuleContentDTO") GetRuleContentDTO getRuleContentDTO){
		return ruleService.getRuleContent(getRuleContentDTO);
	} 

}
