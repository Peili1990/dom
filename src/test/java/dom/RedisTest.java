package dom;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.util.RedisClient;
import org.nv.dom.util.json.JacksonJSONUtils;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;



public class RedisTest {
	
	RedisClient redisClient = new RedisClient("localhost", 6379, "slave");
	

	@Test
	public void testGet() {
		String string = redisClient.getHSet(RedisConstant.AVAILABLE_LIST, "1");
		System.out.println(string);
	}
	
	@Test
	public void test() throws JsonGenerationException, JsonMappingException, IOException{
		Integer[] arrays = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
		                24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,
		                44,45,46,47,48,49,50,51,52,53,54};
		List<Integer> result = Arrays.asList(arrays);
		redisClient.setHSet(RedisConstant.AVAILABLE_LIST, "1", JacksonJSONUtils.beanToJSON(result).toString());
	}

}
