<%@page import="com.es.sewage.user.model.UserModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
</head>
<body>

<!-- 新建 -->
<a href="/user/createUser.do">新建用户</a>

<%
	QueryResult<UserModel> value = (QueryResult<UserModel>) session.getAttribute("value");
	if (value == null || value.getResultList() == null || value.getResultList().size() <= 0) {
%>
		<span>暂无信息</span>
<%
	} else {
%>
		<table border="1px">
<%
		for (int i = 0 ;i < value.getResultList().size(); ++i) {
			UserModel model = value.getResultList().get(i);
			// 将信息显示在表格中
%>
			<tr>
				<td><%=model.getId()==null? " ": model.getId().toString() %></td>
				<td><%=model.getCompanyId()==null? " ": model.getCompanyId().toString() %></td>
				<td><%=model.getUsername() == null? " " : model.getUsername() %></td>
				<td><%=model.getPassword() == null? " " : model.getPassword() %></td>
				<td><%=model.getName() == null? " " : model.getName() %></td>
				<td><%=model.getEmail() == null? " " : model.getEmail() %></td>
				<td><%=model.getGender() == null? "无" : model.getGender().intValue() == 0? "女" : "男" %></td>
				<td>
					<a href="/user/editUser.do?id=<%=model.getId() %>">修改信息</a>
					<a href="/user/deleteUser.do?id=<%=model.getId() %>">删除信息</a>
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