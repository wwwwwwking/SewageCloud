<%@page import="com.es.sewage.user.model.UserModel"%>
<%@page import="com.es.sewage.user.model.CompanyModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
</head>
<body>

<%
	QueryResult<CompanyModel> list = (QueryResult<CompanyModel>) session.getAttribute("companylist");
	UserModel tmpUser = (UserModel) session.getAttribute("value");
%>

	<form action="/user/updateUser.do" method="post">
		<input type="hidden" name="userModel.id" value="<%=tmpUser.getId() %>">
	
		<label for="companyId">公司名称</label>
		<select id="companyId" name="userModel.companyId">
<%
	if (list != null && list.getResultList() != null && list.getResultList().size() > 0) {
		for (int i = 0; i < list.getResultList().size(); ++i) {
			CompanyModel model = list.getResultList().get(i);
			if (model.getId().equals(tmpUser.getCompanyId())) {
%>
				<option value="<%=model.getId() %>" selected="selected"> <%=model.getCompanyName() %> </option>
<%
			} else {
%>
				<option value="<%=model.getId() %>"> <%=model.getCompanyName() %> </option>
<%
			}
		}
	} 
%>
		</select> <br />
		
		
		<label for="username">用户名</label>
		<input type="text" id="username" name="userModel.username" value="<%=tmpUser.getUsername() %>" /> <br />
		
		<label for="password">用户密码</label>
		<input type="text" id="password" name="userModel.password" value="<%=tmpUser.getPassword() %>" /> <br />
		
		<label for="name">用户姓名</label>
		<input type="text" id="name" name="userModel.name"  value="<%=tmpUser.getName() %>" /> <br />
		
		<label for="email">电子邮箱</label>
		<input type="text" id="email" name="userModel.email" value="<%=tmpUser.getEmail()== null?"": tmpUser.getEmail() %>" /> <br />
		
		<label for="gender">性别</label>
		<select id="gender" name="userModel.gender">
			<option value="0" <% if(tmpUser.getGender().intValue() == 0) {%> selected="selected" <%} %>> 女 </option>
			<option value="1" <% if(tmpUser.getGender().intValue() == 1) {%> selected="selected" <%} %>> 男 </option>
		</select>
		
		<label for="remarkContent">备注信息</label>
		<textarea rows="3" cols="30" id="remarkContent" name="userModel.remarkContent"><%=tmpUser.getRemarkContent() == null? "":tmpUser.getRemarkContent() %></textarea>
		
		<input type="submit" value="提交" />
	</form>


</body>
</html>