<%--
  Created by IntelliJ IDEA.
  User: SDH
  Date: 2019/10/23
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="subnav fl">
    <c:forEach items="${goodsTypes}" var="g" varStatus="vs">
        <li><a href="#model0${vs.count}" class="${g.typeClass}">${g.typeName}</a></li>
    </c:forEach>
</ul>
