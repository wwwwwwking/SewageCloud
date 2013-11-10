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
	String errorMsg = null;
	try{
		errorMsg = (String)session.getAttribute("errorMsg"); 
	} catch(Exception e) {
		errorMsg = null;
	}
	if (errorMsg != null) {
	%>
		<span style="color: red;"> <%=errorMsg %> </span>
	<%
	}
	%>
	<form action="/protocal/addSubunitClassify.do" id="subunitClassify" name="subunitClassify" method="post">
		<label for="desc">类别描述</label>
		<input type="text" id="desc" name="subunitClassify.desc" />
		<input type="submit" value="提交" />
	</form>
</body>
</html>