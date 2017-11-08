package org.nv.dom.plugin;

import static java.util.stream.Collectors.toList;

import java.lang.reflect.Method;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;
import java.util.Properties;
import java.util.stream.Stream;

import org.apache.ibatis.executor.resultset.DefaultResultSetHandler;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.nv.dom.util.ReflectionUtil;


@Intercepts(@Signature(
        type = ResultSetHandler.class,
        method = "handleResultSets",
        args = {Statement.class}))
public class OptionalPlugin<E> implements Interceptor {

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		DefaultResultSetHandler resultSetHandler = (DefaultResultSetHandler)invocation.getTarget();
		MappedStatement mappedStatement = (MappedStatement) ReflectionUtil.getFieldValue(resultSetHandler, "mappedStatement");
		String[] args = splitId(mappedStatement.getId());
		Class<?> clazz = Class.forName(args[0]);
		Method[] methods = clazz.getDeclaredMethods();
		Method method = Stream.of(methods).filter(me -> me.getName().equals(args[1])).findAny().get();
		List<E> list = (List<E>) invocation.proceed();
		if(Optional.class == method.getReturnType()){		
	        return list.stream().map(Optional::ofNullable).collect(toList()); 
		} else {
			return list;
		}
		
	}
	
	private String[] splitId(String id){
		int index = id.lastIndexOf(".");
		String[] args = new String[2];
		args[0]=id.substring(0, index);
		args[1]=id.substring(index+1);
		return args;
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);  
	}

	@Override
	public void setProperties(Properties properties) {  

	}

}
