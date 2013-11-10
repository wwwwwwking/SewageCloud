<%@page import="com.es.sewage.user.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>
<style type="text/css">
body {
	font-family: '寰蒋闆呴粦';
    font-size: 18px;
	padding: 0;
	margin: 0;
	background-color: #F2F2F2;
	color: #464646;
	background: url("/web/img/indexbg.png") repeat-x scroll 0 0 transparent;
}

#useropeartor {
	float: right;
	display: block;
}

.left_f {
	float: left;
}

.right_f {
	float: right;
}

.header {
	height: 61px;
	display: block;
}

.menu {
	padding-top: 25px;
}

.fl-li {
	list-style: none outside none;
	font-size: 14px;
	font-weight: bold;
}

.fl-li li {
	float: left;
	margin: 3px;
}

.fl-li li a {
	color: #0B739B;
	display: block;
	line-height: 28px;
	padding: 0;
	text-decoration: none;
	padding-left: 20px;
	padding-right: 20px;
}

.fl-li li a:hover {
	background-color: #6EB1EB;
	border-radius: 4px 4px 4px 4px;
	color: #FFFFFF;
	text-decoration: none;
	padding-left: 20px;
	padding-right: 20px;
}

.active {
	background-color: #6EB1EB;
	border-radius: 4px 4px 4px 4px;
	text-decoration: none;
	color: #FFF;
}
</style>
</head>
<body>
	<div class="header">
		<div class="left_f">
			<img src="./img/blackcloud.png" height="61" />
		</div>
		<div class="left_f" style="margin-left:20px;margin-top:25px;display:block;">
			XX污水处理中心
		</div>
		
		<div class="right_f" style="margin-right:10px; display:block;" >
			<%
			UserModel user = (UserModel) session.getAttribute("APPUSER");
			%>
			<ul class="fl-li">
				<%
				if (user != null && user.getName() != null) {
				%>
				 	<li> <a href="javascript:void(0);">当前用户：<%=user.getName() %></a> </li>
				 	<li> <a href="javascript:void(0);">个人信息</a></li>
				 	<li> <a href="/sys/doLogout.do" target="_parent">注销登录</a> </li>
				<%
				} else {
				%>
					<li><a href="/sys/gotoLogin.do" target="_parent">登录系统</a></li>
				<%
				}
				%>	
			</ul>
		
		</div>
	</div>
</body>
</html>