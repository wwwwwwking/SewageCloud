<%@page import="com.es.sewage.protocal.model.SubunitClassifyModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@page import="com.es.sewage.protocal.model.SubunitModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>
</head>
<body>
	<%
		SubunitModel subunit = (SubunitModel) session.getAttribute("value");
		if (subunit == null) {
	%>
	<span>错误的请求数据</span>
	<%
		} else {
	%>
	<form action="/protocal/updateSubunit.do" id="subunitClassify"
		name="subunitClassify" method="post">
		<input type="hidden" id="id" name="subunit.id"
			value="<%=subunit.getId()%>" /> <label for="name">组件名称</label> <input
			type="text" id="name" name="subunit.name"
			value="<%=subunit.getName()%>" /> <br /> <label
			for="subunit.subunitClassify">所属类别</label> <select
			name="subunit.subunitClassify"
			value="<%=subunit.getSubunitClassify() %>">
			<%
				QueryResult<SubunitClassifyModel> list = (QueryResult<SubunitClassifyModel>) session
							.getAttribute("classify");
					if (list != null && list.getResultList() != null
							&& list.getResultList().size() > 0) {
						for (int i = 0; i < list.getResultList().size(); ++i) {
							SubunitClassifyModel classify = list.getResultList()
									.get(i);
							if (classify.getId().longValue() == subunit
									.getSubunitClassify().longValue()) {
						%>
								<option value="<%=classify.getId()%>" selected="selected">
									<%=classify.getDesc()%>
								</option>
						<%
							} else {
						%>
								<option value="<%=classify.getId()%>">
									<%=classify.getDesc()%>
								</option>
						<%
							}
						}
					}
			%>
		</select> <br /> <label for="subunit.dateType">数据类型</label> <select
			name="subunit.dateType" id="dateType">
			<option value="BYTE" <% if (subunit.getDateType().equals("BYTE")) { %> selected="selected" <%} %> >整形(8位)</option>
			<option value="SHORT" <% if (subunit.getDateType().equals("SHORT")) { %> selected="selected" <%} %> >整形(16位)</option>
			<option value="INT"  <% if (subunit.getDateType().equals("INT")) { %> selected="selected" <%} %> >整形(32位)</option>
			<option value="FLOAT" <% if (subunit.getDateType().equals("FLOAT")) { %> selected="selected" <%} %> >浮点型(32位)</option>
			<option value="DOUBLE" <% if (subunit.getDateType().equals("DOUBLE")) { %> selected="selected" <%} %> >浮点型(64位)</option>
		</select> <br /> <label for="subunit.minValue">最小值</label> <input type="text"
			name="subunit.minValue" value="<%=subunit.getMinValue()%>" /> <br />

		<label for="subunit.maxValue">最大值</label> <input type="text"
			name="subunit.maxValue" value="<%=subunit.getMaxValue()%>" /> <br />

		<input type="submit" value="提交" />
	</form>
	<%
		}
	%>
</body>
</html>