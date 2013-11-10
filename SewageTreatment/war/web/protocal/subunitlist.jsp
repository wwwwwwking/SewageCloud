<%@page import="com.es.sewage.protocal.model.SubunitModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>子项目列表</title>
</head>
<body>
	<div>
		<!-- 此处应该调用后台方法 -->
		<a href="/protocal/createSubunit.do">新建信息</a>
	</div>
	
	<%
			QueryResult<SubunitModel> result = null;
			try {
				result = (QueryResult<SubunitModel>) session.getAttribute("value");
			} catch (Exception e) {
				result = null;
			}
			
			if (result == null || result.getResultList() == null || result.getResultList().size() <= 0) {
		%>
			<span>暂无子单元记录</span>
	<%
		} else {
	%>
			<table border="1px solid #CCCCCC">
	<%
		for (int i = 0; i < result.getResultList().size(); ++i) {
			SubunitModel unit = result.getResultList().get(i);
	%>
				<tr>
					<td width="100"> <%=unit.getId() == null? "null": unit.getId().toString() %> </td>
					<td width="100"> <%=unit.getName() == null? "null": unit.getName().toString() %> </td>
					<td width="100"> <%=unit.getDateType() == null? "null": unit.getDateType().toString() %> </td>
					<td width="100"> <%=unit.getMaxValue() == null? "null": unit.getMaxValue().toString() %> </td>
					<td width="100"> <%=unit.getMinValue() == null ? "null": unit.getMinValue().toString() %> </td>
					<td width="200"> 
						<a href="/protocal/editSubunit.do?id=<%=unit.getId() %>">修改信息</a> 
						<a href="/protocal/deleteSubunit.do?id=<%=unit.getId() %>">删除信息</a> 
					</td>
				</tr>
	<%
			}
	%>
			</table>
	<%
		}
	%>
</body>
</html>