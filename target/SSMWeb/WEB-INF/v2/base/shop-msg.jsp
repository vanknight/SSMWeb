<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/23 15:17
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>提示信息</title>
    <!-- Custom Theme files -->

    <!-- Custom Theme files -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="提示信息"/>
</head>
<body>

<jsp:include page="shop-header.jsp"/>
<div style="min-height:600px">
    <div class="main">
        <div class="container">
            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40">
                <h2 align="center">${msg}</h2>
            </div>
            <!-- END SIDEBAR & CONTENT -->
        </div>
    </div>
</div>

<jsp:include page="shop-bottom.jsp"/>
</body>
</html>
