<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航菜单</title>
<script src="/web/jslib/prototype.lite.js" type="text/javascript"></script>
<script src="/web/jslib/moo.fx.js" type="text/javascript"></script>
<script src="/web/jslib/moo.fx.pack.js" type="text/javascript"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F2F2F2;
}

#container {
	width: 182px;
}

H1 {
	font-size: 15px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;
}

H1 a {
	display: block;
	width: 182px;
	color: #0B739B;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(/web/img/menubg.png);
	background-repeat: repeat-x;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}

.type {
	background-image: url(/web/img/menubg.png);
}

.content {
	width: 182px;
	height: 26px;
}

.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}

.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}

.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px, 0px, 0px, 0px);
}

.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	line-height: 26px;
	color: #0B739B;
	background-image: url(../Public/images/menubg.gif);
	background-repeat: repeat-x;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}

.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	line-height: 26px;
	color: #333333;
	background-image: url(../Public/images/menubg.gif);
	background-repeat: repeat-x;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}

.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	line-height: 26px;
	color: #FFFFFF;
	background: #6EB1EB;
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}

.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	line-height: 26px;
	font-weight: bold;
	color: #FFFFFF;
	background: #6EB1EB;
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
</head>
<body>
	<table width="100%" height="280" border="0" cellpadding="0"
		cellspacing="0" bgcolor="#F2F2F2">
		<tr>
			<td width="182" valign="top"><div id="container">
					<h1 class="type">
						<a href="javascript:void(0);">实时监控</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="../Public/images/menu_topline.gif"
									width="182" height="5" />
								</td>
							</tr>
						</table>
						<ul class="MM">
							<li><a href="/status/preLoadStatusMap.do" target="contentFrame">地图模式</a>
							</li>
							<li><a href="__ROOT__/index.php/Index/main" target="content">列表模式</a>
							</li>
						</ul>
					</div>
					
					<h1 class="type">
						<a href="javascript:void(0)">数据查询</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="../Public/images/menu_topline.gif"
									width="182" height="5" />
								</td>
							</tr>
						</table>
						<ul class="MM">
							<li><a href="__ROOT__/index.php/SpotCategory/view"
								target="content">故障列表</a>
							</li>
							<li><a href="__ROOT__/index.php/Spot/index" target="content">故障历时</a>
							</li>
						</ul>
					</div>
					
					
					<h1 class="type">
						<a href="javascript:void(0)">系统配置</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="../Public/images/menu_topline.gif"
									width="182" height="5" />
								</td>
							</tr>
						</table>
						<ul class="MM">
							<li><a href="__ROOT__/index.php/SpotCategory/view"
								target="content">故障列表</a>
							</li>
							<li><a href="__ROOT__/index.php/Spot/index" target="content">故障历时</a>
							</li>
						</ul>
					</div>
					
					
					<h1 class="type">
						<a href="javascript:void(0)">故障处理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="../Public/images/menu_topline.gif"
									width="182" height="5" />
								</td>
							</tr>
						</table>
						<ul class="MM">
							<li><a href="__ROOT__/index.php/SpotCategory/view"
								target="content">故障列表</a>
							</li>
							<li><a href="__ROOT__/index.php/Spot/index" target="content">故障历时</a>
							</li>
						</ul>
					</div>

					<h1 class="type">
						<a href="javascript:void(0)">用户管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="../Public/images/menu_topline.gif"
									width="182" height="5" />
								</td>
							</tr>
						</table>
						<ul class="MM">
							<li><a href="__APP__/AdminInfo/index" target="content">角色管理</a>
							</li>
							<li><a href="__APP__/AdminPassword/index" target="content">用户管理</a>
							</li>
							<li><a href="__APP__/AdminPassword/index" target="content">个人信息</a>
							</li>
						</ul>
					</div>
					
					<h1 class="type">
						<a href="javascript:void(0)">元数据管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="../Public/images/menu_topline.gif"
									width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="MM">
							<li><a href="__APP__/ShareInfo/index" target="content">协议类型</a></li>
							<li><a href="__APP__/ShareChat/index" target="content">协议列表</a></li>						</ul>
					</div>
					
					
					<h1 class="type">
						<a href="javascript:void(0)">计费系统</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="../Public/images/menu_topline.gif"
									width="182" height="5" />
								</td>
							</tr>
						</table>
						<ul class="MM">
							<li><a href="__APP__/AdminInfo/index" target="content">计算计费</a>
							</li>
							<li><a href="__APP__/AdminPassword/index" target="content">存储计费</a>
							</li>
							<li><a href="__APP__/AdminPassword/index" target="content">缴费管理</a>
							</li>
						</ul>
					</div>
					<script type="text/javascript">
						var contents = document
								.getElementsByClassName('content');
						var toggles = document.getElementsByClassName('type');

						var myAccordion = new fx.Accordion(toggles, contents, {
							opacity : true,
							duration : 400
						});
						myAccordion.showThisHideOpen(contents[0]);
					</script>
			</td>
		</tr>
	</table>
	
	<div class="other" style="margin:0px auto; padding-bottom:10000px; margin-bottom:-10000px; border-right: 1px solid #E0E0E0;">
	
	</div>
</body>
</html>