<%@page import="com.es.sewage.user.model.CompanyModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 判断是否存在
	try {
		CompanyModel model = (CompanyModel) session.getAttribute("value");
		if (model != null) {
%>
			<form action="/user/updateCompany.do" method="post">
				<input type="hidden" name="company.id" value="<%=model.getId() %>" />
				<label for="companyName">公司名称</label>
				<input type="text" id="companyName" name="company.companyName" value="<%=model.getCompanyName() %>" /> <br />
				
				<label for="address">公司地址</label>
				<input type="text" id="address" name="company.address" value="<%=model.getCompanyName() %>" /> <br />
				
				<label for="remarkContent">描述信息</label>
				<textarea rows="3" cols="30" id="remarkContent" name="company.remarkContent">
					<%=model.getRemarkContent() %>
				</textarea>
				
				<input type="submit" value="提交" />
			</form>
<%
		}
	} catch (Exception e) {
%>
		<span>暂无要修改的信息</span>
<%
	}
%>

</body>
</html>