<%@page import="com.es.sewage.user.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background-color: #F2F2F2;
	color: #464646;
}
</style>

</head>
<frameset rows="61,*" cols="*" frameborder="no" border="0"	framespacing="0">
	<frame src="head.jsp" name="topFrame" scrolling="No"
		noresize="noresize" id="topFrame" />
	<frameset cols="182,*">
		<frame src="navigator.jsp" scrolling="No" noresize="noresize"
			id="leftFrame" bordercolor="#333333" />
		<frame src="main.jsp" name="contentFrame" id="contentFrame" />
	</frameset>
</frameset>

<body>
	<%
	UserModel user = (UserModel) session.getAttribute("APPUSER");
	if (user != null && user.getName() != null) {
	%>	
		<script language="javascript">
			window.location.href="../login.jsp;
		</script>
	<%
	}
	%>

	<%=session.getValue("string")%>
</body>
</html>