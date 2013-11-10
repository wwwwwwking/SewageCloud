<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主菜单</title>
<script type="text/javascript" src="jslib/jquery-1.9.1.js"></script>
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background-color: #F2F2F2;
	color: #464646;
}
dl, dt, dd, form {
    margin: 0;
    padding: 0;
}

a {
	color: #0B739B;
	display: block;
	line-height: 28px;
	padding: 0;
	text-decoration: none;
	padding-left: 20px;
	padding-right: 20px;
}

a:hover {
	background-color: #6EB1EB;
	border-radius: 4px 4px 4px 4px;
	color: #FFFFFF;
	text-decoration: none;
	padding-left: 20px;
	padding-right: 20px;
}

dl dd {
	margin-left:30px;
}

dl dt {
	font-weight: bold;
}

</style>
</head>
<body>
	<div style="border-right: 1px solid #E0E0E0; margin:0; padding:0; height:100%; display:block;">
	<div style="height:20dip;display:block;">&nbsp;</div>
	
	<dl>
		<a href="javascript:void(0);">
			<dt>
				<span></span>
				<span>实时监控</span>
			</dt>
		</a>
		<a href="/status/spotmap.jsp" target="contentFrame">
			<dd>
				<span></span>
				<span>地图模式</span>
			</dd>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>列表模式</span>
			</dd>
		</a>
	</dl>
	
	<dl>
		<a href="javascript:void(0);">
			<dt>
				<span></span>
				<span>元数据配置</span>
			</dt>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>企业信息配置</span>
			</dd>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>协议信息配置</span>
			</dd>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>流程信息配置</span>
			</dd>
		</a>
	</dl>
	
	<dl>
		<a href="javascript:void(0);">
			<dt>
				<span></span>
				<span>设备管理</span>
			</dt>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>设备列表</span>
			</dd>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>历史数据</span>
			</dd>
		</a>
	</dl>
	
	<dl>
		<a href="javascript:void(0);">
			<dt>
				<span></span>
				<span>用户管理</span>
			</dt>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>公司用户</span>
			</dd>
		</a>
		<a href="javascript:void(0);">
			<dd>
				<span></span>
				<span>个人信息</span>
			</dd>
		</a>
	</dl>
	</div>
	
	<div class="other" style="margin:0px auto; padding-bottom:10000px; margin-bottom:-10000px; border-right: 1px solid #E0E0E0;"></div>
	<!-- 
	<ul>
		<li>
			<h3>协议部分</h3>
			<ul>
				<li><a href="/protocal/listSubunitClassify.do" target="contentFrame">组件类别</a></li>
				<li><a href="/protocal/listSubunit.do" target="contentFrame">组件列表</a></li>
				<li><a href="/protocal/listProtocal.do" target="contentFrame">协议列表</a>
				<li><a href="/protocal/listCachedProtocal.do" target="contentFrame">协议测试</a></li>
			</ul>
		</li>
		
		<li>
			<h3>用户管理</h3>
			<ul>
				<li> <a href="/user/listCompany.do" target="contentFrame">公司管理</a> </li>
				<li> <a href="/user/listUser.do" target="contentFrame">用户管理</a> </li>
				<li> <a href="/sys/gotoLogin.do" target="contentFrame">用户登录</a> </li>
			</ul>
		</li>
	</ul>
	-->
</body>
</html>