<%@page import="java.util.List"%>
<%@page import="com.es.sewage.protocal.model.SubunitModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>协议缓存-列表</title>
</head>
<body>
	<p>
		<a href="/protocal/saveProtocal.do">保存至协议列表</a> | 导出XML格式协议内容
	</p> 
	<p>
		<form action="/protocal/addCachedProtocal.do">
			<label for="subunitId">子组件列表</label>
			<select id="subunitId" name="subunitId">
			<%
				QueryResult<SubunitModel> qr = null;
				try {
					qr = (QueryResult<SubunitModel>) session.getAttribute("allSubunit");	
				} catch (Exception e) {
					qr = null;
				}
				
				if (qr != null && qr.getResultList() != null && qr.getResultList().size() > 0) {
					for (int i = 0; i < qr.getResultList().size(); ++i) {
						SubunitModel model = qr.getResultList().get(i);
			%>
					<option value="<%=model.getId() %>"><%=model.getName() %></option>
			<%
					}
				}
			%>
			</select>
			
			<input type="submit" value="新增" />
		</form>
	</p>
	
	<p>当前协议内容</p>
	
	<%
		List<SubunitModel> protocalCache = (List<SubunitModel>) session.getAttribute("cacheProtocalList");
		if (protocalCache != null && protocalCache.size() > 0) {
	%>
		<table border="1px solid #FFFFFF">
	<%	
			for (int i = 0; i < protocalCache.size(); ++i) {
				SubunitModel model = protocalCache.get(i);
	%>
			<tr>
				<td><%=(i+1) %></td>
				<td><%=model.getId() %></td>
				<td><%=model.getName() %></td>
				<td><%=model.getDateType() %> </td>
				<td><%=model.getMaxValue() %> </td>
				<td><%=model.getMinValue() %> </td>
				
				<td>
					<a href="/protocal/deleteCachedProtocal.do?subunitPos=<%=i %>">删除组件</a>
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