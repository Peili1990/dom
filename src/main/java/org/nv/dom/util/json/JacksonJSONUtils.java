/**
 * com.rightoo.util.json
 * JSONUtils.java
 * 2015年4月7日 下午3:05:19
 * @author: z```s
 * @version 1.0
 */
package org.nv.dom.util.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * <p></p>
 * 2015年4月7日 下午3:05:19
 * @author: z```s
 * @version 1.0 BY jackson-all-1.9.2
 */
public class JacksonJSONUtils {

	static ObjectMapper objectMapper;
	
	/**
	 * <p>使用泛型方法，把json字符串转换为相应的JavaBean对象</p>
	 * <p>转换为普通JavaBean：readValue(json,Student.class)</p>
	 * <p>转换为List:readValue(json,List.class).但是如果我们想把json转换为特定类型的List，比如List<Student>，就不能直接进行转换了。</p>
	 * <p>因为readValue(json,List.class)返回其实是List<Map>类型，你不能指定readValue()的第二个参数是List<Student>.class，所以不能直接转换。</p>
	 * <p>我们可以把readValue()的第二个参数传递为Student[].class.然后使用Arrays.asList();方法把得到的数组转换为特定类型的List。</p>
	 * <p>转换为Map：readValue(json,Map.class)</p>
	 * @param content 原始json字符串数据
	 * @param valueType 要转换的JavaBean类型
	 * @return JavaBean对象
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 * 2015年4月7日 下午3:08:41
	 * @author: z```s
	 * @version 1.0
	 */
	public static <T> T jsonToBean(String content, Class<T> valueType) 
			throws JsonParseException, JsonMappingException, IOException {
		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}
		return objectMapper.readValue(content, valueType);
	}
	
	/**
	 * <p>把JavaBean转换为json字符串</p>
	 * <p>普通对象转换：toJson(Student)</p>
	 * <p>List转换：toJson(List)</p>
	 * <p>Map转换:toJson(Map)</p>
	 * @param object JavaBean对象
	 * @return json字符串
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 * 2015年4月7日 下午3:12:52
	 * @author: z```s
	 * @version 1.0
	 */
	public static String beanToJSON(Object object) 
			throws JsonGenerationException, JsonMappingException, IOException {
		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}
		return objectMapper.writeValueAsString(object);
	}
	
	/**
	 * <p></p>
	 * @param collectionClass
	 * @param elementClasses
	 * @return
	 * 2015年4月7日 下午3:29:55
	 * @author: z```s
	 * @version 1.0
	 */
	public static JavaType getCollectionType(Class<?> collectionClass, Class<?>...elementClasses) {
		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}
		return objectMapper.getTypeFactory().constructParametrizedType(collectionClass, collectionClass, elementClasses);
	}
	
	/**
	 * <p></p>
	 * @param content
	 * @param elementClass
	 * @return
	 * 2015年4月7日 下午3:33:22
	 * @author: z```s
	 * @version 1.0
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonParseException 
	 */
	public static <T> List<T> jsonToList(String content, Class<T> elementClass) 
			throws JsonParseException, JsonMappingException, IOException {
		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}
		return objectMapper.readValue(content, getCollectionType(ArrayList.class, elementClass));
	}
	
	/**
	 * <p></p>
	 * @param content
	 * @param keyClass
	 * @param valueClass
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 * 2015年4月7日 下午3:37:10
	 * @author: z```s
	 * @version 1.0
	 */
	public static <K, V> Map<K, V> jsonToMap(String content, Class<K> keyClass, Class<V> valueClass) 
			throws JsonParseException, JsonMappingException, IOException {
		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}
		return objectMapper.readValue(content, getCollectionType(Map.class, keyClass, valueClass));
	}
	
}
