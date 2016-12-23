package org.nv.dom.web.dao.rule;

import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface RuleMapper {
	
	public String getRuleContent(GetRuleContentDTO getRuleContentDTO);

}
