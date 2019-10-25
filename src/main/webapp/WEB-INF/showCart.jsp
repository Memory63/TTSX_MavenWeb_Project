<%--
  Created by IntelliJ IDEA.
  User: SDH
  Date: 2019/10/25
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${cartList.size()!=0}">
        <div class="total_count">全部商品<em>${cartList.size()}</em>件</div>
        <ul class="cart_list_th clearfix">
            <li class="col01">商品名称</li>
            <li class="col02">商品单位</li>
            <li class="col03">商品价格</li>
            <li class="col04">数量</li>
            <li class="col05">小计</li>
            <li class="col06">操作</li>
        </ul>
        <c:forEach var="g" items="${cartList}" varStatus="vs">
            <ul class="cart_list_td clearfix" >
                <li class="col01"><input type="checkbox" name="gc"  onclick="goods(${g.gid})" checked></li>
                <li class="col02"><img src="../images/${g.goods.picture}"></li>
                <li class="col03">${g.goods.goodsName}<br><em>${g.goods.price}元/${g.goods.weight}g</em></li>
                <li class="col04">${g.goods.weight}g</li>
                <li class="col05">${g.goods.price}元</li>
                <li class="col06">
                    <div class="num_add">
                        <input type="button" onclick="addAndSub(12,${g.gid},'add',${g.num})" value="+" class="add fl">
                        <input type="text" id="gnum" class="num_show fl" value="${g.num}">
                        <input type="button" onclick="addAndSub(12,${g.gid},'sub',${g.num})" value="-" class="minus fl">
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

