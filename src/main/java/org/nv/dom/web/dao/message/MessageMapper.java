package org.nv.dom.web.dao.message;

import java.util.List;

import org.nv.dom.domain.message.speech.Speech;
import org.nv.dom.dto.message.GetSpeechListDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageMapper {
	
	public List<Speech> getSpeechListDao(GetSpeechListDTO getSpeechListDTO);

	public Speech getLatestSpeechDao(long gameId);

}
