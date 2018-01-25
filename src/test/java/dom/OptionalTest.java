package dom;

import java.util.Arrays;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.dao.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试  
@ContextConfiguration({"applicationContext-dao.xml"})
public class OptionalTest {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	PlayerMapper PlayerMapper;
	

	
	@Test
	public void tryfunc1(){
		ChangeStatusDTO changeStatusDTO = new ChangeStatusDTO();
		changeStatusDTO.setPlayerId(50);
		changeStatusDTO.setStatus(9);
		PlayerMapper.changePlayerStatus(changeStatusDTO);
		
	}
	
	

}
