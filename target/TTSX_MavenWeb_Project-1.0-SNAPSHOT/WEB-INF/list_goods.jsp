<%--
  Created by IntelliJ IDEA.
  User: SDH
  Date: 2019/10/23
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model0${vs.count}">${goodsType.typeName}</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a href="${pageContext.request.contextPath}/goods/queryAllGoods?tid=${goodsType.id}" class="goods_more fr" id="fruit_more">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="../images/${goodsType.typeImg}"></div>
        <ul class="goods_list fl">
            <c:forEach items="${goodsType.goodsList}" var="gl" >
                <c:if test="${gl.show==1}">
                    <li>
                        <h4><a href="${pageContext.request.contextPath}/goods/queryDetail?id=${gl.id}">${gl.goodsName}</a></h4>
                        <a href="${pageContext.request.contextPath}/goods/queryDetail?id=${gl.id}&tid=${gl.tid}">
                            <img src="http://localhost:8089/TTSX_MavenWeb_Project/images/${gl.picture}">
                        </a>
                        <div class="prize">¥ ${gl.price}</div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
