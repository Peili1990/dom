package org.nv.dom.web.service.impl;

import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurGame;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameServiceImpl")
public class GameServiceImpl implements GameService {
	
	@Autowired
	GameMapper gameMapper;

	@Override
	public UserCurGame getUserCurGame(User user) {
		UserCurGame ucg = gameMapper.getUserCurGameDao(user.getId());
		return ucg;
	}

}
