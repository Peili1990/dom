package org.nv.dom.typehandler;

import static java.util.stream.Collectors.joining;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

@MappedTypes(List.class)
@MappedJdbcTypes({JdbcType.VARCHAR})
public class StringListTypeHandler extends BaseTypeHandler<List<String>> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, List<String> parameter, JdbcType jdbcType)
			throws SQLException {
		String param = parameter.stream().collect(joining(","));
		ps.setString(i, param);		
	}

	@Override
	public List<String> getNullableResult(ResultSet rs, String columnName) throws SQLException {
		String[] split = rs.getString(columnName).split(",");
        return Arrays.asList(split);
	}

	@Override
	public List<String> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		 String[] split = rs.getString(columnIndex).split(",");
	     return Arrays.asList(split);
	}

	@Override
	public List<String> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String[] split = cs.getString(columnIndex).split(",");
        return Arrays.asList(split);
	}

	

}
