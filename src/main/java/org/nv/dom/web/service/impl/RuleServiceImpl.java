package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.rule.RuleIndex;
import org.nv.dom.domain.rule.RuleRow;
import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.rule.RuleMapper;
import org.nv.dom.web.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ruleServiceImpl")
public class RuleServiceImpl extends BasicServiceImpl implements RuleService {
	
	private static Logger logger = Logger.getLogger(RuleServiceImpl.class);
	
	@Autowired
	RuleMapper ruleMapper;

	@Override
	public Map<String, Object> getRuleContent(GetRuleContentDTO getRuleContentDTO) {
		Map<String, Object> result = new HashMap<>();
		try{
			String rule = redisClient.getHSet(RedisConstant.RULE_ROW+getRuleContentDTO.getRow(), RedisConstant.RULE_INDEX+getRuleContentDTO.getIndex());
			if(StringUtil.isNullOrEmpty(rule)){
				rule = ruleMapper.getRuleIndexContent(getRuleContentDTO);
			}
			result.put("rule", rule);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE,"获取规则成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE,"系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getRuleRow() {
		Map<String, Object> result = new HashMap<>();
		try{
			List<RuleRow> ruleRows = JacksonJSONUtils.jsonToList(redisClient.get(RedisConstant.RULE_ROW_CONTENT, ""), RuleRow.class);
			if(ruleRows == null || ruleRows.isEmpty()){
				ruleRows = ruleMapper.getRuleRowContent();
			}
			result.put("rules", ruleRows);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE,"获取规则成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE,"系统异常");
		}
		return result;
	}
	
	@PostConstruct
	public void storeRuleIntoRedis(){
		try {
			List<RuleRow> ruleRows = ruleMapper.getRuleRowContent();		
			redisClient.set(RedisConstant.RULE_ROW_CONTENT, JacksonJSONUtils.beanToJSON(ruleRows));			
			List<RuleIndex> ruleIndexs = ruleMapper.getAllRuleIndexContent();			
			for(RuleIndex rule : ruleIndexs){
				redisClient.setHSet(RedisConstant.RULE_ROW+rule.getChapterId(), RedisConstant.RULE_INDEX+rule.getIndexId(), rule.getContent());
			}			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

}
