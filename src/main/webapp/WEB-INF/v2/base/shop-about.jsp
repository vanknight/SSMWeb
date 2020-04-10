<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/19 13:39
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>关于我们 | </title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content=" description" name="description">
    <meta content=" keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <link rel="shortcut icon" href="favicon.ico">
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">

<jsp:include page="shop-header.jsp"/>

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/view/index.do">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/view/shop-product-list.do">商品列表</a></li>
            <li class="active">有关我们</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-3">
                <ul class="list-group margin-bottom-25 sidebar-menu">
                    <%--<li class="list-group-item clearfix"><a href="javascript:;"><i--%>
                    <%--class="fa fa-angle-right"></i> Login/Register</a></li>--%>
                </ul>
            </div>
            <!-- END SIDEBAR -->

            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-9">
                <h1>About us</h1>
                <div class="content-page">
                    <p><img src="${pageContext.request.contextPath}/v2/assets/pages/img/img1.jpg"
                            alt="About us" class="img-responsive"></p>

                    <p>
                    <h2 align="center">关于我们</h2></p>

                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>

<jsp:include page="shop-bottom.jsp"/>

<script type="text/javascript">
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
    });
</script>

<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>