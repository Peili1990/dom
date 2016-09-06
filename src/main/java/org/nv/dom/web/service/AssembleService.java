package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.dto.message.GetSpeechListDTO;

public interface AssembleService {
	
	public Map<String, Object> getNewspaperList(long userId);
	
	public Map<String, Object> getNewspaperDetail(GetSpeechListDTO getSpeechListDTO);
	
	public Map<String, Object> getLatestNewspaperInfo(long gameId);

}
