package dom;

import org.junit.Test;
import org.nv.dom.util.RedisClient;



public class RedisTest {
	
	RedisClient redisClient = new RedisClient("localhost", 6379, "slave");
	

	@Test
	public void testGet() {
		redisClient.setHSet("gameId", "1", "12347832");
	}
	
	@Test
	public void test(){
		String result = "1234";
		result = redisClient.getHSet("gameId", "1");
		System.out.println(result);
	}

}
