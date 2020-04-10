<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/19 13:39
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>VK商城 |</title>

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

    <!-- Fonts START -->
    <!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">-->
    <!--<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">&lt;!&ndash;- fonts for slider on the index page &ndash;&gt;  -->
    <!-- Fonts END -->
    <!-- Fonts START -->
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/font-2346-or-234679.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/font-234679.css"
          rel="stylesheet" type="text/css">
    <!--- fonts for slider on the index page -->
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="${pageContext.request.contextPath}/v2/assets/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/animate.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/plugins/fancybox/source/jquery.fancybox.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/plugins/owl.carousel/assets/owl.carousel.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/plugins/uniform/css/uniform.default.css"
          type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/corporate/css/jquery-ui.css"
          rel="stylesheet" type="text/css"><!-- for slider-range -->
    <link href="${pageContext.request.contextPath}/v2/assets/plugins/rateit/src/rateit.css"
          rel="stylesheet"
          type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/components.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/slider.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/style-shop.css?t=20180428"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/v2/assets/corporate/css/style.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/corporate/css/style-responsive.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/corporate/css/themes/red.css"
          rel="stylesheet" id="style-color">
    <link href="${pageContext.request.contextPath}/v2/assets/corporate/css/custom.css?t=20180429"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/translateelement.css"
          type="text/css" rel="stylesheet" charset="UTF-8">
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/loaders.css?t=20180429"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css?t=123123"
          rel="stylesheet">
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce" style="">
<!-- BEGIN STYLE CUSTOMIZER -->
<div class="color-panel hidden-sm">
    <div class="color-mode-icons icon-color"></div>
    <div class="color-mode-icons icon-color-close"></div>
    <div class="color-mode">
        <p>THEME COLOR</p>
        <ul class="inline">
            <li class="color-red current color-default" data-style="red"></li>
            <li class="color-blue" data-style="blue"></li>
            <li class="color-green" data-style="green"></li>
            <li class="color-orange" data-style="orange"></li>
            <li class="color-gray" data-style="gray"></li>
            <li class="color-turquoise" data-style="turquoise"></li>
        </ul>
    </div>
</div>
<!-- END BEGIN STYLE CUSTOMIZER -->

<!-- BEGIN TOP BAR -->
<div class="pre-header" style="padding-bottom: 10px;">
    <div class="container">
        <div class="row">
            <!-- BEGIN TOP BAR LEFT PART -->
            <div class="col-md-6 col-sm-6 additional-shop-info">
                <ul class="list-unstyled list-inline">
                    <li><i class="fa fa-phone"></i><span>+139 **** 0844</span></li>
                    <!-- BEGIN CURRENCIES -->
                    <li class="shop-currencies">
                        <a href="javascript:void(0);" class="current">$</a>
                    </li>
                    <!-- END CURRENCIES -->
                    <!-- BEGIN LANGS -->
                    <li class="langs-block">
                        <a href="javascript:void(0);" class="current">中国</a>
                    </li>
                    <!-- END LANGS -->
                </ul>
            </div>
            <!-- END TOP BAR LEFT PART -->
            <!-- BEGIN TOP BAR MENU -->
            <div class="col-md-6 col-sm-6 additional-nav">
                <ul class="list-unstyled list-inline pull-right" id="login-user-header">
                    <li>
                        <a href="${pageContext.request.contextPath}/view/loginUI.do">
                            登陆
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/view/registerUI.do">
                            注册
                        </a>
                    </li>
                </ul>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>
</div>
<!-- END TOP BAR -->

<!-- BEGIN HEADER -->
<div class="header">
    <div class="container">
        <a class="site-logo" href="${pageContext.request.contextPath}/view/index.do">
            <img src="${pageContext.request.contextPath}/v2/assets/corporate/img/logos/logo-shop-red.png"
                 alt=""></a>

        <a id="slideToggle-mobi" href="javascript:void(0);" class="mobi-toggler">
            <i class="fa fa-bars"></i>
        </a>

        <!-- BEGIN CART -->
        <div class="top-cart-block">
            <div class="top-cart-info">
                <a href="javascript:void(0);" class="top-cart-info-count">
                    <span id="cart-count">0</span>个
                </a>
                <a href="javascript:void(0);" class="top-cart-info-value">
                    ￥<span id="cart-total">0</span>
                </a>
            </div>
            <i class="fa fa-shopping-cart"></i>

            <div class="top-cart-content-wrapper">
                <div class="top-cart-content">
                    <ul class="scroller" style="height: 250px;" id="cart-ul">

                        <h2 align="center" id="cart-msg" style="margin-top: 125px;"></h2>

                    </ul>
                    <div class="text-right">
                        <a href="javascript:;"
                           class="btn btn-primary">更新购物车</a>

                        <a href="${pageContext.request.contextPath}/cartItem.do"
                           class="btn btn-primary">购物车</a>
                    </div>


                </div>
            </div>
        </div>
        <!--END CART -->

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation" id="slideToggle-navigation">
            <ul>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#"
                       href="javascript:;">
                        分类
                    </a>

                    <!-- BEGIN DROPDOWN MENU -->
                    <ul class="dropdown-menu" id="category-ul">


                    </ul>
                    <!-- END DROPDOWN MENU -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#"
                       href="javascript:;">
                        更多
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/product/list.do">
                            所有商品
                        </a></li>
                    </ul>
                </li>

                <!-- BEGIN TOP SEARCH -->
                <li class="menu-search">
                    <span class="sep"></span>
                    <i class="fa fa-search search-btn"></i>
                    <div class="search-box">
                        <form method="get" action="${pageContext.request.contextPath}/product/search/list.do">
                            <div class="input-group">
                                <input type="text" name="search" placeholder="查找商品" class="form-control">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary">查找</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </li>
                <!-- END TOP SEARCH -->
            </ul>
        </div>
        <!-- END NAVIGATION -->
    </div>
</div>
<!-- Header END -->

</body>
<!-- END BODY -->

<!-- Load javascripts at bottom, this will reduce page load time -->
<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/v2/assets/plugins/respond.min.js"
        charset="UTF-8"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/v2/assets/plugins/jquery.min.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/plugins/jquery-migrate.min.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/plugins/bootstrap/js/bootstrap.min.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/corporate/scripts/back-to-top.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        charset="UTF-8"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="${pageContext.request.contextPath}/v2/assets/plugins/fancybox/source/jquery.fancybox.pack.js"
        charset="UTF-8"
        type="text/javascript"></script><!-- pop up -->
<script src="${pageContext.request.contextPath}/v2/assets/plugins/owl.carousel/owl.carousel.min.js"
        charset="UTF-8"
        type="text/javascript"></script><!-- slider for products -->
<script src="${pageContext.request.contextPath}/v2/assets/plugins/zoom/jquery.zoom.min.js"
        charset="UTF-8"
        type="text/javascript"></script><!-- product zoom -->
<script src="${pageContext.request.contextPath}/v2/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js?t=20180430"
        charset="UTF-8"
        type="text/javascript"></script><!-- Quantity -->
<script src="${pageContext.request.contextPath}/v2/assets/plugins/uniform/jquery.uniform.min.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/plugins/rateit/src/jquery.rateit.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/plugins/jquery-ui.js"
        charset="UTF-8"
        type="text/javascript"></script><!-- for slider-range -->
<%--<script src="${pageContext.request.contextPath}/v2/assets/plugins/gmaps/gmaps.js"--%>
<%--type="text/javascript"></script>--%>
<script src="${pageContext.request.contextPath}/v2/assets/pages/scripts/contact-us.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/corporate/scripts/layout.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/pages/scripts/bs-carousel.js"
        charset="UTF-8"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/pages/scripts/checkout.js?t=20180527"
        charset="UTF-8"
        type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/v2/custom/header.js?t=9841321231"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/custom/login.js?t=20180601"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js?t=61251321351601"
        charset="UTF-8"></script>
<!-- END PAGE LEVEL JAVASCRIPTS -->

<%--<script>--%>
<%--</script>--%>

<script>

    function headerInit() {
        $(".scroller").scrollUnique();
        getCategory($("#category-ul"));
        autoLoginFunction();
        showCartsMin();
        sidebarMenu($("#sidebar-ul"));
    }


    jQuery(document).ready(function () {
        headerInit();
    });
</script>

</html>
