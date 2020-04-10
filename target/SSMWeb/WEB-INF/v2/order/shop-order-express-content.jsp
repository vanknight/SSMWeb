<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/5/18 14:25
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>物流详情 |</title>

</head>
<style>
    body {
        font-size: 12px;
    }

    ul li {
        list-style: none;
    }

    .track-rcol {
        width: 900px;
        border: 1px solid #eee;
    }

    .track-list {
        margin: 20px;
        padding-left: 5px;
        position: relative;
    }

    .track-list li {
        position: relative;
        padding: 9px 0 0 25px;
        line-height: 18px;
        border-left: 1px solid #d9d9d9;
        color: #999;
    }

    .track-list li.first {
        color: red;
        padding-top: 0;
        border-left-color: #fff;
    }

    .track-list li .node-icon {
        position: absolute;
        left: -6px;
        top: 50%;
        width: 11px;
        height: 11px;
        background: url(http://demo.daimabiji.com/3531/img/order-icons.png) -21px -72px no-repeat;
    }

    .track-list li.first .node-icon {
        background-position: 0 -72px;
    }

    .track-list li .time {
        margin-right: 20px;
        position: relative;
        top: 4px;
        display: inline-block;
        vertical-align: middle;
    }

    .track-list li .txt {
        max-width: 600px;
        position: relative;
        top: 4px;
        display: inline-block;
        vertical-align: middle;
    }

    .track-list li.first .time {
        margin-right: 20px;
    }

    .track-list li.first .txt {
        max-width: 600px;
    }
</style>
<body>
<div class="track-rcol" style="width:100%;">
    <c:if test="${status == 0}">
        <div class="track-list">
            <ul>
                <c:forEach var="traces" items="${data.traces}" varStatus="abc">
                    <li class="first">
                        <i class="node-icon"></i>
                        <span class="time">${traces.acceptTime2}</span>
                        <span class="txt">${traces.acceptStation}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <c:if test="${status == 1}">
        <h2 align="center">${msg}</h2>
    </c:if>
</div>
</body>
</html>
