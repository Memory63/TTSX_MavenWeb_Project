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
	<title>天天生鲜-商品详情</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		/* 修改购买数量 */
		function change(data) {
		    var num = parseFloat($("#number").val());
		    var price1 = $("#price1").text();
			if(data=="+"){
			    num = num + 1;
			}else{
			    num = num - 1;
				if(num<1){
					num = 1;
				}
			}
			var price = Number(price1*num).toFixed(2);
			$("#number").attr("value",num);
			$("#price2").text(price);
		}

		/* 添加购物车 */
        function addCart(gid,price){
			var num = $("#number").val();
			<%--window.location='/TTSX_MavenWeb_Project/cart/insert?uid=${uid}&gid='+gid+'&num='+num+'&money='+price;--%>
			$.ajax({
				url:'/TTSX_MavenWeb_Project/cart/insert',
				type:'post',
                data:'gid='+gid+'&num='+num+'&money='+price,
                success:function (data) {
					if(data==1){
						alert("添加成功")
                        // window.load(cart());
					}else{
						alert("添加失败")
					}
				},
				error:function () {
					alert("添加购物车异常");
				}

			})
		}
	</script>
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
		<a href="#">${goodsType.typeName}</a>
		<span>></span>
		<a href="#">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix">
		<div class="goods_detail_pic fl"><img src="../images/${goods.pictureDetail}"></div>

		<div class="goods_detail_list fr">
			<h3>${goods.goodsName}</h3>
			<p>${goods.intro}</p>
			<div class="prize_bar">
				<span class="show_pirze" >¥<em id="price1"  value="${goods.price}">${goods.price}</em></span>
				<span class="show_unit">单  位：${goods.weight}g</span>
			</div>
			<div class="goods_num clearfix">
				<div class="num_name fl">数 量：</div>
				<div class="num_add fl">
					<input type="text" id="number" class="num_show fl" value="1">
					<a href="javascript:;" onclick="change('+')" class="add fr">+</a>
					<a href="javascript:;" onclick="change('-')" class="minus fr">-</a>
				</div> 
			</div>
			<div class="total">总价：<em id="price2" >${goods.price}</em>元</div>
			<div class="operate_btn">
				<a href="javascript:;" class="buy_btn">立即购买</a>
				<a href="javascript:;" onclick="addCart(${goods.id},${goods.price})" class="add_cart" id="add_cart">加入购物车</a>
			</div>
		</div>
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
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>

			<div class="tab_content">
				<dl>
					<dt>商品详情：</dt>
					<dd>${goods.detail}</dd>
				</dl>
			</div>

		</div>
	</div>

    <%@ include file="footer.jsp"%>

	<div class="add_jump"></div>

	<script type="text/javascript" src="js/jquery-1.12.2.js"></script>
	<script type="text/javascript">
		var $add_x = $('#add_cart').offset().top;
		var $add_y = $('#add_cart').offset().left;

		var $to_x = $('#show_count').offset().top;
		var $to_y = $('#show_count').offset().left;

		$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
		$('#add_cart').click(function(){
			$(".add_jump").stop().animate({
				'left': $to_y+7,
				'top': $to_x+7},
				"fast", function() {
					$(".add_jump").fadeOut('fast',function(){
						// $('#show_count').html();
                        cart();
					});

			});
		})
	</script>
	
</body>
</html>