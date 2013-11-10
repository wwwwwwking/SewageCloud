<%@page import="com.es.sewage.user.model.CompanyModel"%>
<%@page import="com.es.sewage.core.dao.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="./web/style/login.css" rel="stylesheet" type="text/css">
<link href="./web/style/style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="bgt">
		<div class="mid">
			<div class="header">
				<div class="left_f">
					<img src="./web/img/blackcloud.png" height="61" />
				</div>
				<div class="right_f">
					<ul class="fl-li">
						<li><a href="index.html"> 首页 </a></li>
						<li><a href="/web/user/companydetail.jsp"> 企业注册 </a></li>
						<li><a href="/user/createUser.do"> 用户注册 </a></li>
						<li class="active"><a href="#"> <span
								style="color: #FFF;">登录</span> </a>
						</li>
					</ul>
				</div>
			</div>

			<div class="span30"></div>

			<div class="ac-bg ac-t lh0 mt30"></div>
			<div class="clearfix ac-m p20">
				<div class="right_f">
					<div class="login-container">
						<div class="login" id="login">
							<p id="error-tip" class="error-tip">

								<%
									String str = "";
									try {
										str = (String) session.getAttribute("loginMsg");
									} catch (Exception e) {
										str = "";
									}
								%>
								<%=str%>

							</p>
							<form action="/sys/doLogin.do" method="post">
								<table>
									<tr>
										<td><label for="companyId">公司：</label></td>
										<td><select class="input-box" id="companyId"
											name="companyId">
												<%
													QueryResult<CompanyModel> values = (QueryResult<CompanyModel>) session
															.getAttribute("values");
													if (values != null && values.getResultList() != null
															&& values.getResultList().size() > 0) {
														for (int i = 0; i < values.getResultList().size(); ++i) {
															CompanyModel companyModel = values.getResultList().get(i);
												%>
												<option value="<%=companyModel.getId()%>">
													<%=companyModel.getCompanyName()%>
												</option>
												<%
													}
													}
												%>
										</select></td>
									</tr>

									<tr>
										<td><label for="userName">账号：</label></td>
										<td><input class="input-box" type="text" id="userName"
											name="userName" /></td>
									</tr>

									<tr>
										<td><label for="password">密码：</label></td>
										<td><input class="input-box" type="password"
											id="password" name="password" /></td>
									</tr>

									<tr>
										<td colspan="2" align="right"><a href="#">忘记密码?</a></td>
									</tr>

									<tr>
										<td colspan="2" align="center"><input type="submit"
											value="立即登录" id="login-submit" /> <input type="button"
											value="注册" id="login-register" /></td>
									</tr>
								</table>

							</form>
						</div>
					</div>

				</div>
				<div class="right_f login-img mr15">
					<img src="./web/img/wy_pic.png" />
				</div>
			</div>

			<div class="ac-bg ac-b lh0 mb40"></div>

			<div class="span30"></div>
			<div class="footer">
				<center>				
					<p class="tc">
						客服邮箱：<a href="mailto:wenchao_you@163.com" title="客服邮箱">wenchao_you@163.com</a>&nbsp;&nbsp;&nbsp;&nbsp;
						开发者邮箱：<a href="mailto:wenchao_you@163.com" title="开发者邮箱">wenchao_you@163.com</a>
					</p>
					<p class="tc mb10">© 2013 WuYun All Rights Reserved Eager studio. 江南大学 苏ICP备88888888号</p>
				</center>
				
			</div>
		</div>
	</div>

</body>
</html>