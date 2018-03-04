package org.nv.dom.plugin;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.stream.Stream;

import javax.lang.model.element.Element;

import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.nv.dom.util.ReflectionUtil;
import org.springframework.core.style.DefaultValueStyler;

@Intercepts(@Signature(
        type = Executor.class,
        method = "query",
        args = {MappedStatement.class,Object.class,RowBounds.class,ResultHandler.class,CacheKey.class,BoundSql.class}))
public class FixNullValuePlugin<E> implements Interceptor{

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		List<E> list = (List<E>) invocation.proceed();
		list.forEach(element -> {
			Field[] fields = element.getClass().getFields();
			Stream.of(fields).forEach(field -> {
				Object value = ReflectionUtil.getFieldValue(element, field.getName());
				if(value == null) {
					ReflectionUtil.setFieldValue(element, field.getName(), defaultValue(field.getType()));
				}
			});
		});
		return list;
	}

	private Object defaultValue(Class<?> type) {
		switch (type.getName()) {
		case "java.lang.String":
			return "";
		case "java.lang.Double":
			return 0.0d;
		case "java.lang.Integer":
			return 0;
		case "java.util.Date":
			return new Date();
		case "java.lang.Boolean":
			return false;
		case "java.lang.Long":
			return 0L;
		default:
			break;
		}
		return null;
	}
	@Override
	public Object plugin(Object target) {
		// TODO Auto-generated method stub
		return Plugin.wrap(target, this); 
	}

	@Override
	public void setProperties(Properties properties) {
		// TODO Auto-generated method stub
		
	}

}
