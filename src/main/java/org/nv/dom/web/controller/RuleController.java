package org.nv.dom.web.controller;

import java.util.Map;

import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.nv.dom.web.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RuleController {
	
	@Autowired
	RuleService ruleService;
	
	@ResponseBody
	@RequestMapping(value = "/getRuleContent", method = RequestMethod.POST)
	public Map<String,Object> getApplyingGames(@ModelAttribute("getRuleContentDTO") GetRuleContentDTO getRuleContentDTO){
		return ruleService.getRuleContent(getRuleContentDTO);
	} 

}
