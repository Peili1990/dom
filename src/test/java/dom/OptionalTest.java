package dom;

import java.util.Optional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.web.dao.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试  
@ContextConfiguration({"applicationContext-dao.xml"})
public class OptionalTest {
	
	@Autowired
	UserMapper userMapper;
	
	@Test
	public void tryfunc(){
		Optional<ChatInfo> info = userMapper.getChatInfoByUserIdDaoOptional(1);
	}

}
