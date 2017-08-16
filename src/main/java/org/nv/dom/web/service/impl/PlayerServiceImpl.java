package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOpreation;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.nv.dom.dto.player.SubmitOpreationDTO;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.HttpClientUtil;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service("playerServiceImpl")
public class PlayerServiceImpl implements PlayerService {
	
	private static Logger logger = Logger.getLogger(PlayerServiceImpl.class);
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public PlayerInfo getPlayerInfoByUserId(long userId) {
		try{
			PlayerInfo playerInfo = playerMapper.getPlayerInfo(userId);
			if(playerInfo == null){
				return null;
			}else if(testChandler(playerInfo)){
				playerInfo.setSign(NVTermConstant.UNKNOWN_SIGN);
				playerInfo.setSignAvatar(NVTermConstant.UNKNOWN_SIGN_AVATAR);
				playerInfo.setCamp(NVTermConstant.GOOD_CAMP);
				playerInfo.setIdentityDesc(NVTermConstant.UNKNOWN_IDENTITY);
			}
			if(PlayerStatus.INDENTITY_OBTAINED.getCode() == playerInfo.getStatus()){
				ChangeStatusDTO changeStatusDTO = new ChangeStatusDTO();
				changeStatusDTO.setPlayerId(playerInfo.getPlayerId());
				changeStatusDTO.setStatus(PlayerStatus.INDENTITY_KNOWN.getCode());
				playerMapper.changePlayerStatus(changeStatusDTO);
			}
			return playerInfo;
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return null;
		}		
	}

	@Override
	public Map<String, Object> getPlayerOpreation(long playerId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(playerId > 0 , "参数异常");
		PlayerOpreation opreation = playerMapper.getPlayerOpreation(playerId);
		Map<String, String> param = new HashMap<>();
		param.put("playerId", String.valueOf(playerId));
		result.putAll(HttpClientUtil.doPostAndGetMap(ConfigUtil.getVersionConfigProperty("judger.server")+"/getPlayerOpreation", param));
		result.put("opreation", opreation);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取玩家操作成功");
		return result;
	}
	
	@Override
	public Map<String, Object> submitOpreation(SubmitOpreationDTO submitOpreationDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(submitOpreationDTO.getPlayerId() > 0, "参数异常");
		Assert.isTrue(playerMapper.submitOpreationDao(submitOpreationDTO) == 1, "提交操作失败！");
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "提交操作成功！");
		return result;
	}
	
	private boolean testChandler(PlayerInfo playerInfo){
		Integer sign = playerInfo.getSign();
		return playerInfo.getCharacterId() == 42 
					&& NVTermConstant.IS_SP.equals(playerInfo.getIsSp())
					&& !(sign == 11 || sign == 12 || sign == 23);
	}

	@Override
	public Map<String, Object> getPlayerReplaceSkin(long playerId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerReplaceSkin> replaceList = playerMapper.getPlayerReplaceSkinDao(playerId);
		if(replaceList!=null &&!replaceList.isEmpty()){
			result.put("replaceList", replaceList);	
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取替代发言称呼成功");
		return result;
	}
	
}
