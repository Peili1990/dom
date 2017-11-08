package org.nv.dom.util;


import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
 
/**
 * 反射的Utils函数集合. 提供访问私有变量,获取泛型类型Class,提取集合中元素的属性等Utils函数.
 * 
 * @author lei
 */
public class ReflectionUtil {
 
    /**
     * 直接读取对象属性值,无视private/protected修饰符,不经过getter函数.
     */
    public static Object getFieldValue(final Object object, final String fieldName) {
        Field field = getDeclaredField(object, fieldName);
 
        if (field == null)
            throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + object + "]");
 
        makeAccessible(field);
 
        Object result = null;
        try {
            result = field.get(object);
        } catch (IllegalAccessException e) {
            return null;
        }
        return result;
    }
 
    /**
     * 直接设置对象属性值,无视private/protected修饰符,不经过setter函数.
     */
    public static void setFieldValue(final Object object, final String fieldName, final Object value) {
        Field field = getDeclaredField(object, fieldName);
 
        if (field == null)
            throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + object + "]");
 
        makeAccessible(field);
 
        try {
            field.set(object, value);
        } catch (IllegalAccessException e) {
        	return;
        }
    }
 
    /**
     * 循环向上转型,获取对象的DeclaredField.
     */
    protected static Field getDeclaredField(final Object object, final String fieldName) {
        return getDeclaredField(object.getClass(), fieldName);
    }
 
    /**
     * 循环向上转型,获取类的DeclaredField.
     */
    protected static Field getDeclaredField(final Class<?> clazz, final String fieldName) {
        for (Class<?> superClass = clazz; superClass != Object.class; superClass = superClass.getSuperclass()) {
            try {
                return superClass.getDeclaredField(fieldName);
            } catch (NoSuchFieldException e) {
                // Field不在当前类定义,继续向上转型
            }
        }
        return null;
    }
 
    /**
     * 强制转换fileld可访问.
     */
    protected static void makeAccessible(final Field field) {
        if (!Modifier.isPublic(field.getModifiers()) || !Modifier.isPublic(field.getDeclaringClass().getModifiers())) {
            field.setAccessible(true);
        }
    }
 
    /**
     * 通过反射,获得定义Class时声明的父类的泛型参数的类型. 如public UserDao extends HibernateDao<User>
     * 
     * @param clazz
     *            The class to introspect
     * @return the first generic declaration, or Object.class if cannot be
     *         determined
     */
    public static Class<?> getSuperClassGenricType(final Class<?> clazz) {
        return getSuperClassGenricType(clazz, 0);
    }
 
    /**
     * 通过反射,获得定义Class时声明的父类的泛型参数的类型. 如public UserDao extends
     * HibernateDao<User,Long>
     * 
     * @param clazz
     *            clazz The class to introspect
     * @param index
     *            the Index of the generic ddeclaration,start from 0.
     * @return the index generic declaration, or Object.class if cannot be
     *         determined
     */
 
    public static Class<?> getSuperClassGenricType(final Class<?> clazz, final int index) {
 
        Type genType = clazz.getGenericSuperclass();
 
        if (!(genType instanceof ParameterizedType)) {
            
            return Object.class;
        }
 
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
 
        if (index >= params.length || index < 0) {
            
            return Object.class;
        }
        if (!(params[index] instanceof Class)) {
            
            return Object.class;
        }
        return (Class<?>) params[index];
    }
    
    public static Object getValueByAnnotation(final Object object, final Class<? extends Annotation> annotationClass){
    	List<String> fields = getFieldsByAnnotation(object, annotationClass);
    	if(fields.size() != 1){
    		return null;
    	}
		return getFieldValue(object, fields.get(0));
    }
    
    public static List<String> getFieldsByAnnotation(final Object object, final Class<? extends Annotation> annotationClass){
    	Class<?> clazz = object.getClass();
		Field[] fields = clazz.getDeclaredFields();
		List<String> targets = new ArrayList<>();
		for(Field field:fields){
			if(field.isAnnotationPresent(annotationClass)){
				targets.add(field.getName());
			}
		}
		return targets;
    }
    
    public static Annotation getAnnotation(final Object object, final Class<? extends Annotation> annotationClass){
    	Class<?> clazz = object.getClass();
		Field[] fields = clazz.getDeclaredFields();
		for(Field field:fields){
			if(field.isAnnotationPresent(annotationClass)){
				return field.getAnnotation(annotationClass);
			}
		}
		return null;
    }
    
    public static Annotation getParameterAnnotation(final Method method, final Class<? extends Annotation> annotationClass){
    	Annotation[][] annotations = method.getParameterAnnotations();
    	for(int i=0;i<annotations.length;i++){
    		if(annotations[i].length==0){
    			continue;
    		}
    		for(int j=0;j<annotations[i].length;j++){
    			if(annotations[i][j].annotationType().equals(annotationClass)){
    				return annotations[i][j];
    			}
    		}
    	}
    	return null;
    }
    
    public static boolean isWrapClass(Class clz) {
    	if(clz.isPrimitive()){
    		return false;
    	} else {
    		try { 
    			return String.class.equals(clz) ? false : !((Class) clz.getField("TYPE").get(null)).isPrimitive();
    		} catch (Exception e) {
    			return true;
    		} 
    	}      
    } 
 
}