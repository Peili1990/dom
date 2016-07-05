package org.nv.dom.web.dao.game;

import org.nv.dom.domain.user.UserCurGame;
import org.springframework.stereotype.Repository;

@Repository
public interface GameMapper {
	
	public UserCurGame getUserCurGameDao(long userId);

}
