<%--
  Created by IntelliJ IDEA.
  User: SDH
  Date: 2019/10/21
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-注册</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../js/register.js"></script>
	<script type="text/javascript" src="../js/jquery.serializejson.js"></script>
</head>
<body>
	<div class="register_con">
		<div class="l_con fl">
			<a class="reg_logo"><img src="../images/logo02.png"></a>
			<div class="reg_slogan">足不出户  ·  新鲜每一天</div>
			<div class="reg_banner"></div>
		</div>

		<div class="r_con fr">
			<div class="reg_title clearfix">
				<h1>用户注册</h1>
				<a href="${pageContext.request.contextPath}/user/login">登录</a>
			</div>
			<div class="reg_form">
				<form id="reg_form">
				<ul>
					<li>
						<label>用户名:</label>
						<input type="text" name="username" id="user_name" placeholder="请输入用户名">
						<span id="error_username" class="error_tip"></span>
					</li>					
					<li>
						<label>密码:</label>
						<input type="password" name="password" id="pwd" placeholder="请输入密码">
						<span class="error_tip"></span>
					</li>
					<li>
						<label>确认密码:</label>
						<input type="password" name="repassword" id="cpwd" placeholder="请重新输入密码">
						<span class="error_tip"></span>
					</li>
					<li>
						<label>邮箱:</label>
						<input type="email" name="email" id="email" placeholder="请输入邮箱">
						<span class="error_tip"></span>
					</li>
					<li class="agreement">
						<input type="checkbox" name="allow" id="allow">
						<label>同意”天天生鲜用户使用协议“</label>
						<span class="error_tip2"></span>
					</li>
					<li class="reg_sub">
						<input id="sub" type="button" value="注 册">
					</li>
				</ul>				
				</form>
			</div>

		</div>

	</div>

	<div class="footer no-mp">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	
</body>
</html>