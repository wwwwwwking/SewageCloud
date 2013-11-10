<%@page import="com.es.sewage.user.model.CompanyModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增信息</title>
</head>
<body>

<%
	QueryResult<CompanyModel> list = (QueryResult<CompanyModel>) session.getAttribute("value");
%>

	<form action="/user/addUser.do" method="post">
		<label for="companyId">公司名称</label>
		<select id="companyId" name="userModel.companyId">
<%
	if (list != null && list.getResultList() != null && list.getResultList().size() > 0) {
		for (int i = 0; i < list.getResultList().size(); ++i) {
			CompanyModel model = list.getResultList().get(i);
%>
			<option value="<%=model.getId() %>"> <%=model.getCompanyName() %> </option>
<%
		}
	} 
%>
		</select> <br />
		
		
		<label for="username">用户名</label>
		<input type="text" id="username" name="userModel.username" /> <br />
		
		<label for="password">用户密码</label>
		<input type="text" id="password" name="userModel.password" /> <br />
		
		<label for="name">用户姓名</label>
		<input type="text" id="name" name="userModel.name" /> <br />
		
		<label for="email">电子邮箱</label>
		<input type="text" id="email" name="userModel.email" /> <br />
		
		<label for="gender">性别</label>
		<select id="gender" name="userModel.gender">
			<option value="0"> 女 </option>
			<option value="1"> 男 </option>
		</select>
		
		<label for="remarkContent">备注信息</label>
		<textarea rows="3" cols="30" id="remarkContent" name="userModel.remarkContent"></textarea>
		
		<input type="submit" value="提交" />
	</form>


</body>
</html>