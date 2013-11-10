<%
	String result;
	try {
		result = (String)session.getAttribute("RESULT");
	} catch (Exception e) {
		result = "API调用出错";
	}
	
	if (result == null) {
		result = "错误的API调用";		
	}
%>
<%=result %>
