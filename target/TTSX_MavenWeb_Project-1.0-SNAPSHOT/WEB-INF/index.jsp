<%--
  Created by IntelliJ IDEA.
  User: SDH
  Date: 2019/10/21
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-首页</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/slide.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<shiro:user>
					<div class="login_info fl">
							欢迎您：<em><shiro:principal/></em>
						<span>|</span>
						<em><a href="${pageContext.request.contextPath}/user/logout">退出</a></em>
					</div>
				</shiro:user>
                <shiro:guest>
					<div class="login_btn fl">
						<a href="${pageContext.request.contextPath}/user/login">登录</a>
						<span>|</span>
						<a href="${pageContext.request.contextPath}/user/register">注册</a>
					</div>
				</shiro:guest>
                <shiro:user>
					<div class="user_link fl">
						<span>|</span>
						<a href="user_center_info.jsp">用户中心</a>
						<span>|</span>
						<a href="cart.jsp">我的购物车</a>
						<span>|</span>
						<a href="user_center_order.jsp">我的订单</a>
					</div>
				</shiro:user>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.jsp" class="logo fl"><img src="../images/logo.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<a href="#" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">1</div>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="center_con clearfix">
        <div id="goodsType">
			<%-- 商品类别 --%>
		</div>
		<div class="slide fl">
			<ul class="slide_pics">
				<li><img src="../images/slide.jpg" alt="幻灯片"></li>
				<li><img src="../images/slide02.jpg" alt="幻灯片"></li>
				<li><img src="../images/slide03.jpg" alt="幻灯片"></li>
				<li><img src="../images/slide04.jpg" alt="幻灯片"></li>
			</ul>
			<div class="prev"></div>
			<div class="next"></div>
			<ul class="points"></ul>
		</div>
		<div class="adv fl">
			<a href="#"><img src="../images/adv01.jpg"></a>
			<a href="#"><img src="../images/adv02.jpg"></a>
		</div>
	</div>

    <div id="fresh_list">
		<%-- 新鲜水果 --%>
	</div>

	<div id="seafood">
		<%-- 海鲜水产 --%>
	</div>

    <div id="meat">
		<%-- 肉类 --%>
	</div>

	<div id="egg">
		<%-- 蛋类 --%>
	</div>

    <div id="vegetables">
		<%-- 新鲜蔬菜 --%>
	</div>

	<div id="ice">
		<%-- 速冻食品 --%>
	</div>



	<div class="footer">
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
	<script type="text/javascript" src="../js/slideshow.js"></script>
	<script type="text/javascript">
		BCSlideshow('focuspic');
		var oFruit = document.getElementById('fruit_more');
		var oShownum = document.getElementById('show_count');

		var hasorder = localStorage.getItem('order_finish');

		if(hasorder)
		{
			oShownum.innerHTML = '2';
		}

		oFruit.onclick = function(){
			window.location.href = 'list.jsp';
		}
	</script>
</body>
</html>