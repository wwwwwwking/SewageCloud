<%@page import="com.es.sewage.protocal.model.SubunitClassifyModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>子单元分类</title>
</head>
<body>
	<%
		SubunitClassifyModel classify = (SubunitClassifyModel) session.getAttribute("value");
		if (classify == null) {
	%>
		<span>错误的请求数据</span>
	<%
	} else {
	%>
		<form action="/protocal/updateSubunitClassify.do" id="subunitClassify" name="subunitClassify" method="post">
			<input type="hidden" id="subunitClassify.id" name="subunitClassify.id" value="<%=classify.getId() %>" />
			<label for="desc">类别描述</label>
			<input type="text" id="desc" name="subunitClassify.desc" value="<%=classify.getDesc() %>" />
			<input type="submit" value="提交" />
		</form>
	<%
	}
	%>
	
</body>
</html>