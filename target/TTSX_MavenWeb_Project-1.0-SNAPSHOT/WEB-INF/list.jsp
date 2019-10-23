<%--
  Created by IntelliJ IDEA.
  User: SDH
  Date: 2019/10/21
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品列表</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	</head>
	<body>

	<%@ include file="head.jsp"%>

	<div class="navbar_con">
			<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
				<ul class="subnav">
					<li><a href="#" class="fruit">新鲜水果</a></li>
					<li><a href="#" class="seafood">海鲜水产</a></li>
					<li><a href="#" class="meet">猪牛羊肉</a></li>
					<li><a href="#" class="egg">禽类蛋品</a></li>
					<li><a href="#" class="vegetables">新鲜蔬菜</a></li>
					<li><a href="#" class="ice">速冻食品</a></li>
				</ul>
			</div>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">${goodsTypeName}</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="#"><img src="../images/goods/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="../images/goods/goods002.jpg"></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a id="default" href="${pageContext.request.contextPath}/goods/queryAllGoods?tid=${tid}" class="${rank==null?"active":''}">默认</a>
				<a id="desc" href="${pageContext.request.contextPath}/goods/queryAllGoods?tid=${tid}&rank=desc" class="${rank=="desc"?"active":''}">价格⬇</a>
				<a id="asc" href="${pageContext.request.contextPath}/goods/queryAllGoods?tid=${tid}&rank=asc" class="${rank=="asc"?"active":''}">价格⬆</a>
			</div>

			<ul class="goods_type_list clearfix">
                <c:forEach items="${goodsAll.getList()}" var="g" varStatus="vs">
					<li>
						<a href="${pageContext.request.contextPath}/goods/queryDetail?id=${g.id}&tid=${g.tid}"><img src="../images/${g.picture}"></a>
						<h4><a href="${pageContext.request.contextPath}/goods/queryDetail?id=${g.id}&tid=${g.tid}">${g.goodsName}</a></h4>
						<div class="operate">
							<span class="prize">￥${g.price}</span>
							<span class="unit">${g.price}/${g.weight}g</span>
							<a href="#" class="add_goods" title="加入购物车"></a>
						</div>
					</li>
				</c:forEach>
			</ul>

			<div class="pagenation">
				<a href="${pageContext.request.contextPath}/goods/queryAllGoods
				?pageNum=${goodsAll.prePage}&pageSize=${goodsAll.pageSize}&tid=${tid}&rank=${rank}">上一页</a>
                <c:forEach var="p" begin="${goodsAll.navigateFirstPage}" end="${goodsAll.navigateLastPage}" varStatus="vs" step="1">
					<a href="${pageContext.request.contextPath}/goods/queryAllGoods
				?pageNum=${vs.count}&pageSize=${goodsAll.pageSize}&tid=${tid}&rank=${rank}" class="active">${vs.count}</a>
				</c:forEach>
				<a href="${pageContext.request.contextPath}/goods/queryAllGoods
				?pageNum=${goodsAll.nextPage}&pageSize=${goodsAll.pageSize}&tid=${tid}&rank=${rank}" class="active">下一页</a>
			</div>
		</div>
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
	
</body>
</html>