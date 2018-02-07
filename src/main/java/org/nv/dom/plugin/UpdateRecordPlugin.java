package org.nv.dom.plugin;

import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Stream;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.apache.ibatis.executor.CachingExecutor;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.Configuration;
import org.nv.dom.util.ObjectUtil;
import org.nv.dom.util.ReflectionUtil;

import com.alibaba.fastjson.JSON;

@Intercepts(@Signature(
        type = Executor.class,
        method = "update",
        args = {MappedStatement.class, Object.class}))
public class UpdateRecordPlugin implements Interceptor{

	@Override
	public Object intercept(Invocation invocation) throws Throwable {	
		String preModifiedSql = buildSelectSql(invocation);		
		Connection con = getConnection(invocation);	
		ResultSet resultSet = con.prepareStatement(preModifiedSql).executeQuery();	
		String tableName = resultSet.getMetaData().getTableName(1);	
		String primaryKey = findPrimaryKey(con, resultSet);
		Map<Long, Map<String, Object>> preModifiedData = buildMap(resultSet, primaryKey);
		System.out.println(JSON.toJSONString(preModifiedData));
		
		Object object = invocation.proceed();	
		
		String afterModifiedSql = buildSelectSql(preModifiedData, primaryKey, tableName);	
		resultSet = con.prepareStatement(afterModifiedSql).executeQuery();	
		Map<Long, Map<String, Object>> afterModifiedData = buildMap(resultSet, primaryKey);	
		
//		List<ModifiedResult> modifiedResult = compareModifiedResult(preModifiedData, afterModifiedData);
		System.out.println(JSON.toJSONString(afterModifiedData));
		
		con.close();
		
		return object;
	}
	
	private List<ModifiedResult> compareModifiedResult(Map<Long, Map<String, Object>> pre, Map<Long, Map<String, Object>> after){
		return pre.keySet().stream()
				.map(id -> {
					ModifiedResult modifiedResult = new ModifiedResult(id);
					Map<String, Object> preData = pre.get(id);
					Map<String, Object> afterData = after.get(id);
					modifiedResult.setDetail(preData.keySet().stream()
						.filter(key -> !preData.get(key).equals(afterData.get(key)))
						.map(key -> {
							ModifiedDetail modifiedDetail = new ModifiedDetail();
							modifiedDetail.setColumnName(key);
							modifiedDetail.setPreValue(preData.get(key));
							modifiedDetail.setAfterValue(afterData.get(key));
							return modifiedDetail;
						}).collect(toList()));
					return modifiedResult;
				})
				.filter(result -> !result.getDetail().isEmpty())
				.collect(toList());
	}
	
	private String buildSelectSql(Map<Long, Map<String, Object>> preModifiedData, String primaryKey, String tableName) {
		StringBuilder builder = new StringBuilder();
		builder.append("select * from ");
		builder.append(tableName);
		builder.append(" where ");
		builder.append(primaryKey);
		builder.append(" in (");
		builder.append(preModifiedData.keySet().stream().map(String::valueOf).collect(joining(",")));
		builder.append(")");
		return builder.toString();
	}

	private Map<Long, Map<String, Object>> buildMap(ResultSet resultSet, String primaryKey) throws Throwable{
		Map<Long, Map<String, Object>> dataMap = new HashMap<>();
		
		ResultSetMetaData metaData = resultSet.getMetaData();
		int columnCount = metaData.getColumnCount();
	
		while(resultSet.next()){
			Long primaryKeyValue = 0L;
			Map<String, Object> valueMap = new HashMap<>();
			for(int i=1; i<=columnCount; i++){	
				if(metaData.getColumnName(i).equals(primaryKey)){
					primaryKeyValue = (Long) resultSet.getObject(i);
				} else {
					valueMap.put(metaData.getColumnName(i), resultSet.getObject(i));
				}
			}
			dataMap.put(primaryKeyValue, valueMap);
		}
		return dataMap;
	}
	
	private String findPrimaryKey(Connection con, ResultSet resultSet) throws Throwable{
		ResultSetMetaData metaData = resultSet.getMetaData();
		String tableName = metaData.getTableName(1);		
		ResultSet pkResultSet = con.getMetaData().getPrimaryKeys(null, null, tableName);
		String primaryKey = "";
		while(pkResultSet.next()) {
			primaryKey = pkResultSet.getString(4);
		}
		return primaryKey;
	}
	
	private Connection getConnection(Invocation invocation) throws Throwable {
		Executor executor = (Executor) invocation.getTarget();
		if(executor instanceof CachingExecutor){
			executor = (Executor) ReflectionUtil.getFieldValue(executor, "delegate");
		}
		Configuration configuration = (Configuration) ReflectionUtil.getFieldValue(executor, "configuration");
		Connection con = configuration.getEnvironment().getDataSource().getConnection();
		return con;
	}
	
	@SuppressWarnings({"unchecked","rawtypes"})
	private String buildSelectSql(Invocation invocation) throws Throwable{
		Object args2 = invocation.getArgs()[1];
		MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
		BoundSql sql = mappedStatement.getBoundSql(args2);
		String update = sql.getSql().toLowerCase().trim();
		List<Object> paramList = null;
		Map<String, Object> paramMap = null;
		StringBuilder builder = new StringBuilder();
		int index = 0,count = 0,lastIndex = 0;
		boolean flag = false;
		if(sql.getParameterObject() instanceof ParamMap){
			Map<String, Object> temp = (ParamMap)sql.getParameterObject();
			paramList = (List<Object>) temp.keySet().stream()
				.filter(key -> key.contains("param"))
				.flatMap(key -> {
					if(temp.get(key) instanceof List){
						return ((List)temp.get(key)).stream();
					} else {
						return Stream.of(temp.get(key));
					}
				}).collect(toList());
			flag = true;
		} else {
			paramMap = ObjectUtil.objectToMap(sql.getParameterObject());	
		}	
		while(index < update.length()){
			if(update.charAt(index) == '?'){
				builder.append(update.substring(lastIndex,index));
				builder.append(flag ? paramList.get(count) : paramMap.get(sql.getParameterMappings().get(count).getProperty()));
				count ++;
				lastIndex = index + 1;
			}
			index ++;
		}
		update = builder.toString();	
		builder = new StringBuilder();
		builder.append("select * from ");
		builder.append(update.substring(update.indexOf("update")+6, update.indexOf("set")).trim());
		builder.append(" "+ update.substring(update.indexOf("where")).trim());
		return builder.toString();
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
