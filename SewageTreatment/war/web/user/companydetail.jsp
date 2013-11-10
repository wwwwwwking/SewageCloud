<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业注册</title>
<link href="/web/style/login.css" rel="stylesheet" type="text/css">
<link href="/web/style/style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="bgt">
		<div class="mid">
			<div class="header">
				<div class="left_f">
					<img src="/web/img/blackcloud.png" height="61" />
				</div>
				<div class="right_f">
					<ul class="fl-li">
						<li><a href="index.html"> 首页 </a>
						</li>
						<li class="active"><a href="/web/user/companydetail.jsp"><span
								style="color: #FFF;"> 企业注册 </span> </a>
						</li>
						<li><a href="/user/createUser.do"> 用户注册 </a>
						</li>
						<li><a href="/sys/gotoLogin.do"> 登录 </a></li>
					</ul>
				</div>
			</div>

			<div class="span30"></div>

			<div class="ac-bg ac-t lh0 mt30"></div>
			<div class="clearfix ac-m p20">
				<div class="right_f" style="width: 650px;">
					<div style="margin: 20px 25px 0 0; width: 500px;">
						<div class="login" id="login">
							<p id="error-tip" class="error-tip">

								<%
									String str = "";
									try {
										str = (String) session.getAttribute("errorMsg");
										if (str.equals("null")) str = "";
									} catch (Exception e) {
										str = "";
									}
								%>
								<%=str%>

							</p>
							<form action="/user/addCompany.do" method="post" name="company" id="company">
								<table>
									<tr>
										<td><label for="companyName">公司名称：</label>
										</td>
										<td><input class="input-box" type="input" id="companyName" name="company.companyName" />
										</td>
									</tr>

									<tr>
										<td><label for="address">公司地址：</label>
										</td>
										<td><input class="input-box" type="text" id="address" name="company.address" />
										</td>
									</tr>

									<tr>
										<td><label for="remarkContent">描述信息：</label>
										</td>
										<td><textarea rows="3" cols="35" id="remarkContent" name="company.remarkContent"></textarea>
										</td>
									</tr>

									<tr>
										<td colspan="2" align="center"><input type="submit"
											value="立即注册" id="login-submit" /> 
										</td>
									</tr>
								</table>

							</form>
						</div>
					</div>

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
					<p class="tc mb10">© 2013 WuYun All Rights Reserved Eager
						studio. 江南大学 苏ICP备88888888号</p>
				</center>

			</div>
		</div>
	</div>

	

</body>
</html>