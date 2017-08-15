package org.nv.dom.web.operation.sign.official;

import org.nv.dom.config.EventList;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class LiaisonMan extends Operation {

	public LiaisonMan() {
		operationId = 7;
	}

	@Override
	public void settle(String param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.GAME_START_EVENT, this);
	}

}
