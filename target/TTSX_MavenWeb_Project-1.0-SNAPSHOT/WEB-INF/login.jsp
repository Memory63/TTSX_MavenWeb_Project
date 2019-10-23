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
	<title>天天生鲜-登录</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../js/login.js"></script>
	<script type="text/javascript" src="../js/jquery.serializejson.js"></script>
</head>
<body>
	<div class="login_top clearfix">
		<a href="index.jsp" class="login_logo"><img src="../images/logo02.png"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="${pageContext.request.contextPath}/user/register">立即注册</a>
				</div>
				<div class="form_input">
					<form id="user_form" >
						<input type="text" name="username" id="username" class="name_input" placeholder="请输入用户名">
						<div class="user_error">输入错误</div>
						<input type="password" id="password" name="password" class="pass_input" placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>
						<div style="position: absolute;left: 0;top: 120px;">
							<img id="captcha" style="border: 1px solid red;float: left" src="${pageContext.request.contextPath}/captcha" width="90px" height="35px"/>
							<input type="text" name="code"  id="code" style="background: #fdfdfd;height: 38px;width: 90px;vertical-align: middle;margin-left: 10px;margin-right: 15px;">
							<span id="codeMsg" style="font-size: 15px"></span>
						</div>
						<div class="more_input clearfix">
							<input type="checkbox" name="remember">
							<label>记住用户名</label>
							<a href="#">忘记密码</a>
						</div>
						<input type="button" id="sub" value="登录" class="input_submit">
					</form>
				</div>
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