<%@page import="com.es.sewage.user.model.CompanyModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司管理</title>
</head>
<body>

<!-- 新建 -->
<a href="/web/user/companydetail.jsp">新建公司</a>

<%
	QueryResult<CompanyModel> value = (QueryResult<CompanyModel>) session.getAttribute("value");
	if (value == null || value.getResultList() == null || value.getResultList().size() <= 0) {
%>
		<span>暂无信息</span>
<%
	} else {
%>
		<table border="1px">
<%
		for (int i = 0 ;i < value.getResultList().size(); ++i) {
			CompanyModel model = value.getResultList().get(i);
			// 将信息显示在表格中
%>
			<tr>
				<td><%=model.getId()==null? " ": model.getId().toString() %></td>
				<td><%=model.getCompanyName() == null? " ": model.getCompanyName() %></td>
				<td><%=model.getAddress() == null? " " : model.getAddress() %></td>
				<td><%=model.getRemarkContent() == null? " ": 
					model.getRemarkContent().length() > 10? 
							model.getRemarkContent().substring(0, 10):  model.getRemarkContent() %></td>
				<td>
					<a href="/user/editCompany.do?id=<%=model.getId() %>">修改信息</a>
					<a href="/user/deleteCompany.do?id=<%=model.getId() %>">删除信息</a>
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