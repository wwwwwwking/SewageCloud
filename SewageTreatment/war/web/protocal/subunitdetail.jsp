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
	<%
		String errorMsg = null;
		try{
			errorMsg = (String)session.getAttribute("errorMsg"); 
		} catch(Exception e) {
			errorMsg = null;
		}
		if (errorMsg != null) {
	%>
		<span style="color: red;"> <%=errorMsg%> </span>
	<%
		}
	%>
	<form action="/protocal/addSubunit.do" id="subunitClassify" name="subunitClassify" method="post">
		<label for="name">组件名称</label>
		<input type="text" id="name" name="subunit.name" /> <br />
		
		<label for="subunit.subunitClassify">所属类别</label>
		<select name="subunit.subunitClassify">
			<%
				QueryResult<SubunitClassifyModel> list = (QueryResult<SubunitClassifyModel>)
						session.getAttribute("classify");
					if (list != null && list.getResultList() != null && list.getResultList().size() > 0) {
						for (int i = 0; i < list.getResultList().size(); ++i) {
							SubunitClassifyModel classify = list.getResultList().get(i);
			%>
						<option value="<%=classify.getId() %>"> <%=classify.getDesc() %> </option>
			<%
					}
				}
			%>
		</select> <br />
		
		<label for="subunit.dateType">数据类型</label>
		<select name="subunit.dateType" id="dateType">
			<option value="BYTE">整形(8位)</option>
			<option value="SHORT">整形(16位)</option>
			<option value="INT">整形(32位)</option>
			<option value="FLOAT">浮点型(32位)</option>
			<option value="DOUBLE">浮点型(64位)</option>
		</select> <br />
		
		<label for="subunit.minValue">最小值</label>
		<input type="text" name="subunit.minValue" /> <br />
		
		<label for="subunit.maxValue">最大值</label>
		<input type="text" name="subunit.maxValue" /> <br />
		
		<input type="submit" value="提交" />
	</form>
</body>
</html>