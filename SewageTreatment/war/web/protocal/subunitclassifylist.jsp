<%@page import="com.es.sewage.protocal.model.SubunitClassifyModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>子单元分类</title>
</head>
<body>
	<div>
		<a href="/web/protocal/subunitclassifydetail.jsp">新建信息</a>
	</div>
	
	<%
			QueryResult<SubunitClassifyModel> result = (QueryResult<SubunitClassifyModel>)session.getAttribute("subunitClassify"); 
				if (result == null || result.getResultList() == null || result.getResultList().size() <= 0) {
		%>
			<span>暂无子单元类别记录</span>
	<%
		} else {
	%>
			<table width="500" border="1px solid #CCCCCC">
	<%
		for (int i = 0; i < result.getResultList().size(); ++i) {
			SubunitClassifyModel classify = result.getResultList().get(i);
	%>
				<tr>
					<td width="100"> <%=classify.getId().toString() %> </td>
					<td width="200"> <%=classify.getDesc() %> </td>
					<td width="200"> 
						<a href="/protocal/editSubunitClassify.do?id=<%=classify.getId() %>">修改信息</a> 
						<a href="/protocal/deleteSubunitClassify.do?id=<%=classify.getId() %>">删除信息</a> 
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