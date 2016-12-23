package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.dto.rule.GetRuleContentDTO;

public interface RuleService {

	Map<String, Object> getRuleContent(GetRuleContentDTO getRuleContentDTO);

}
