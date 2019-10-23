<%--
  Created by IntelliJ IDEA.
  User: SDH
  Date: 2019/10/23
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
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
    <a href="${pageContext.request.contextPath}/user/index" class="logo fl"><img src="../images/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
    <shiro:user>
        <div class="guest_cart fr">
            <a href="#" class="cart_name fl">我的购物车</a>
            <div class="goods_count fl" id="show_count">1</div>
        </div>
    </shiro:user>
</div>

</body>
</html>
