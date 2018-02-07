package dom;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.dao.user.UserMapper;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试  
@ContextConfiguration({"applicationContext-dao.xml"}) 
public class OptionalTest {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	PlayerMapper PlayerMapper;
	
	@Autowired
	PlayerService PlayerService;
	

	
	@Test
	public void tryfunc1(){
		PlayerService.test();
	}
	
	

}
