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
	<title>天天生鲜-购物车</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function () {

			/* 购物车全选和反选 */
			$("#all").click(function () {
				$("[name=gc]").prop("checked", this.checked);
				var num = $("input[name='gc']:checked").length;
				if(num==0){
					$("#price").text("0.00");
				}else{
					var moneys = [];
					var sum=0;
					$(".col07").each(function(i) {
						moneys[i] = $(this).text();
						sum = parseFloat(moneys[i])+parseFloat(sum);
					});
					$("#price").text(Number(sum).toFixed(2));
				}
				$("#num").text(num);
			});

		})

		/* 购物车是否被选中,价钱逻辑处理 */
        function goods(gid) {
			var checkbox = $("input[name='gc']:checked").length;
			var num = $("#num").text();
			var sum;
			if(checkbox==$("#total").text()){
				$("#all").prop("checked",true);
				$("#price").text("${price}");
			}else if(checkbox>num){
				sum = parseFloat($("#price").text())+parseFloat($("#"+gid).text());
				$("#all").removeAttr("checked")
				$("#price").text(Number(sum).toFixed(2));
			}else if(checkbox<num){
				sum = parseFloat($("#price").text())-parseFloat($("#"+gid).text());
				$("#all").removeAttr("checked")
				$("#price").text(Number(sum).toFixed(2));
			}
			/*var ch = $("input[name='gc']:checked").length;*/
			$("#num").text(checkbox);
		}

		/* 删除购物车商品 */
        function deleteCart(gid) {
        	var goodsGid = $("#goods"+gid);
            if(confirm("你确定要删除吗?")){
				$.ajax({
					url:"${pageContext.request.contextPath}/cart/deleteCart",
					type:'get',
					data:'gid='+gid,
					success:function (data) {
						if(data==1){
							alert("删除成功");
							var m = parseFloat($("#"+gid).text());/* 获取删除商品的价格 */
							goodsGid.remove();/* 删除该商品的标签 */
							if(!goodsGid.is(':checked')){
								var p = parseFloat($("#price").text())-m;/* 获取选中商品的总价钱减去删除商品钱 */
								$("#price").text(Number(p).toFixed(2));/* 给选中商品重新赋值 */
							}
							var checkbox = $("input[name='gc']:checked").length;/* 获取选中的商品的商品数量 */
							$("#num").text(checkbox);/* 修改选中的商品数量 */
							$("#total").text($("#total").text()-1)/* 购物车商品数量减一 */
							window.load(cart());/* 重新加载购物车的商品数量 */
						}else{
							alert("删除失败")
						}
					}
				})
			}
		}

		/* 修改购物车中的商品数量 */
        function addAndSub(uid,gid,sign,num) {
			if(num<=1&&sign=='sub'){
			    deleteCart(gid)
			}else{
			    $.ajax({
					url:'${pageContext.request.contextPath}/cart/updateCart',
					type:'get',
					data:'uid='+uid+'&gid='+gid+'&sign='+sign,
					success:function (data) {

					}
				})
			}
		}

	</script>
</head>
<body>

<%--
	<shiro:guest>
		<script type="text/javascript">
			location.href="${pageContext.request.contextPath}/user/login"
		</script>
	</shiro:guest>


	<c:if test="${sessionScope.user}">
		<script type="text/javascript">
			location.href="${pageContext.request.contextPath}/user/login"
		</script>
	</c:if>

--%>
	<%@ include file="head.jsp"%>


	<shiro:authenticated>

    <c:choose>
		<c:when test="${cartList.size()!=0}">
			<div class="total_count">全部商品<em id="total">${cartList.size()}</em>件</div>
			<ul class="cart_list_th clearfix">
				 <li class="col01">商品名称</li>
				 <li class="col02">商品单位</li>
				 <li class="col03">商品价格</li>
				 <li class="col04">数量</li>
				 <li class="col05">小计</li>
				 <li class="col06">操作</li>
			 </ul>
			<c:forEach var="g" items="${cartList}" varStatus="vs">
				 <ul class="cart_list_td clearfix" id="goods${g.gid}">
					 <li class="col01"><input type="checkbox" name="gc"  onclick="goods(${g.gid})" checked></li>
					 <li class="col02"><img src="../images/${g.goods.picture}"></li>
					 <li class="col03">${g.goods.goodsName}<br><em>${g.goods.price}元/${g.goods.weight}g</em></li>
					 <li class="col04">${g.goods.weight}g</li>
					 <li class="col05" id="price3">${g.goods.price}元</li>
					 <li class="col06">
					 <div class="num_add">
					 <input type="button" onclick="addAndSub(${uid},${g.gid},'add',${g.num})" value="+" class="add fl">
					 <input type="text" id="gnum" class="num_show fl" value="${g.num}">
					 <input type="button" onclick="addAndSub(${uid},${g.gid},'sub',${g.num})" value="-" class="minus fl">
					 </div>
					 </li>
					 <li class="col07" id="${g.gid}">${g.money}元</li>
					 <li class="col08"><input type="button"  onclick="deleteCart(${g.gid})" value="删除"></li>
				 </ul>
			 </c:forEach>
			<ul class="settlements">
			   <li class="col01"><input type="checkbox" id="all" checked="checked"></li>
			   <li class="col02">全选</li>
			   <li class="col03">合计(不含运费)：<span>¥</span><em id="price">${price}</em><br>共计<b id="num">${cartList.size()}</b>件商品</li>
			   <li class="col04"><a href="place_order.jsp">去结算</a></li>
		   </ul>
		</c:when>
		<c:otherwise>
			<hr style="margin: 0 auto;width: 70%"/>
            <div style="text-align: center">
		<p id="notCart">
			您的购物车还是空的，赶紧行动吧！您可以：<br/>
			看看 <a href="#">我的收藏夹</a><br/>
			看看 <a href="#">已买到的宝贝</a>
		</p>
	</div>
	</c:otherwise>
	</c:choose>
	<%@include file="footer.jsp"%>
	</shiro:authenticated>
</body>
</html>