package org.nv.dom.web.service.impl;

import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.nv.dom.web.dao.rule.RuleMapper;
import org.nv.dom.web.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ruleServiceImpl")
public class RuleServiceImpl implements RuleService {
	
	private static Logger logger = Logger.getLogger(RuleServiceImpl.class);
	
	@Autowired
	RuleMapper ruleMapper;

	@Override
	public Map<String, Object> getRuleContent(GetRuleContentDTO getRuleContentDTO) {
		// TODO Auto-generated method stub
		return null;
	}

}
