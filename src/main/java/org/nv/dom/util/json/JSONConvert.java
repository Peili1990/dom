/**    
 * @FileName: JSONConvert.java  
 * @Package:com.timeocean.util  
 * @Description: JSON包
 */
package org.nv.dom.util.json;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * @ClassName: JSONConvert
 * @Description: JSON数据转化
 */
public class JSONConvert {

	public static final String TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	
	/**
	 * @Title: getObjectJSON
	 * @Description: 获取泛型类型的JSON对象
	 * @param <T> 泛型类型
	 * @param t 泛型实体
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> JSONObject getObjectJSON(T t) {
		JSONObject jsonObject = new JSONObject();
		try {
			Class<? extends Object> classType = t.getClass();
			Field[] fields = classType.getDeclaredFields();
			for (Field field : fields) {
				String fieldName = field.getName();
				if (!fieldName.equals("serialVersionUID")){
					String getMethodName = "get"
							+ fieldName.substring(0, 1).toUpperCase()
							+ fieldName.substring(1);
					Method getMethod = classType.getMethod(getMethodName,
							new Class[] {});
					Object value = getMethod.invoke(t, new Object[] {});
					Object textValue = null;
					if (value == null) {
						textValue = "";
					} else {
						if (value instanceof Date) {
							SimpleDateFormat sdf = new SimpleDateFormat(
									TIME_FORMAT);
							textValue = sdf.format(value);
						} else if (value instanceof Integer) {
							textValue = Integer.parseInt(value.toString());
						} else if (value instanceof Double) {
							textValue = Double.parseDouble(value.toString());
						} else if (value instanceof Long) {
							textValue = Long.parseLong(value.toString());
						} else if (value instanceof byte[]) {
							textValue = "";
						} else if (value instanceof List) {
							List<Object> collection = (List<Object>) value;
							if (collection == null || collection.isEmpty()) {
								textValue = "";
							} else {
								textValue = getCollectionJSON((List<Object>) value);
							}
						}
						else {
							textValue = value.toString();
						}
					}
					jsonObject.put(fieldName, textValue);
				}
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	/**
	 * @Title: getObjectJSON
	 * @Description: 获取泛型类型的JSON对象
	 * @param <T> 泛型类型
	 * @param t 泛型实体
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> JSONObject getObjectJSON(T t, String dateFormat) {
		JSONObject jsonObject = new JSONObject();
		try {
			Class<? extends Object> classType = t.getClass();
			Field[] fields = classType.getDeclaredFields();
			for (Field field : fields) {
				String fieldName = field.getName();
				if (!fieldName.equals("serialVersionUID")) {
					String getMethodName = "get"
							+ fieldName.substring(0, 1).toUpperCase()
							+ fieldName.substring(1);
					Method getMethod = classType.getMethod(getMethodName,
							new Class[] {});
					Object value = getMethod.invoke(t, new Object[] {});
					Object textValue = null;
					if (value == null) {
						textValue = "";
					} else {
						if (value instanceof Date) {
							SimpleDateFormat sdf = new SimpleDateFormat(
									dateFormat);
							textValue = sdf.format(value);
						} else if (value instanceof Double) {
							textValue = Double.parseDouble(value.toString());
						} else if (value instanceof Long) {
							textValue = Long.parseLong(value.toString());
						} else if (value instanceof byte[]) {
							textValue = "";
						} else if (value instanceof List) {
							List<Object> collection = (List<Object>) value;
							if (collection == null || collection.isEmpty()) {
								textValue = "";
							} else {
								textValue = getCollectionJSON((List<Object>) value);
							}
						}
						else {
							textValue = value.toString();
						}
					}
					jsonObject.put(fieldName, textValue);
				}
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	/**
	 * @Title: getCollectionJSON
	 * @Description: 获取集合的JSON
	 * @param <T> 泛型类型
	 * @param collection 泛型集合
	 * @return
	 */
	public static <T> JSONArray getCollectionJSON(Collection<T> collection) {
		JSONArray objectArray = new JSONArray();
		Iterator<T> iterator = collection.iterator();
		while (iterator.hasNext()) {
			T t = (T) iterator.next();
			objectArray.put(getObjectJSON(t));
		}
		return objectArray;
	}
	
	/**
	 * @Title: getCollectionJSON
	 * @Description: 获取集合的JSON
	 * @param <T> 泛型类型
	 * @param collection 泛型集合
	 * @return
	 */
	public static <T> JSONArray getCollectionJSON(Collection<T> collection, String dateFormat) {
		JSONArray objectArray = new JSONArray();
		Iterator<T> iterator = collection.iterator();
		while (iterator.hasNext()) {
			T t = (T) iterator.next();
			objectArray.put(getObjectJSON(t, dateFormat));
		}
		return objectArray;
	}

}
