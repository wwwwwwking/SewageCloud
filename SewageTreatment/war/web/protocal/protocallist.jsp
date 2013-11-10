<%@page import="java.util.List"%>
<%@page import="com.es.sewage.protocal.model.ProtocalModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户协议列表</title>
</head>
<body>

	<span>
		<a href="/protocal/listCachedProtocal.do">新增协议</a>
	</span> <br /><br />

	<%
		List<ProtocalModel> list = (List<ProtocalModel>)session.getAttribute("values");
		if (list == null || list.size() <= 0) {
	%>
		<p>暂无协议</p>
	<%
		} else {
	%>
		<table border="1px solid #FFFFFF">
	<%
			for (int i = 0; i < list.size(); ++i) {
				ProtocalModel model = list.get(i);
	%>
			<tr>
				<td><%=model.getId() %></td>
				<td><%=model.getSubunitList().toString() %></td>
				<td>
					<a href="/protocal/initCachedProtocal.do?id=<%=model.getId() %>">修改</a>
					<a href="/protocal/deleteProtocal.do?id=<%=model.getId() %>">删除</a>
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