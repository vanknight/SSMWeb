<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>我的网站 |</title>

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

<!-- BEGIN SLIDER -->
<div class="page-slider margin-bottom-35">
    <div id="carousel-example-generic" class="carousel slide carousel-slider">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <!-- First slide -->
            <div class="item carousel-item-four active">
                <div class="container">
                    <div class="carousel-position-four text-center">
                        <h2 class="margin-bottom-20 animate-delay carousel-title-v3 border-bottom-title text-uppercase"
                            data-animation="animated fadeInDown">
                            商店<br/><span class="color-red-v2">UI特性的色调</span><br/>
                            设计
                        </h2>
                        <p class="carousel-subtitle-v2" data-animation="animated fadeInUp">
                            为了出众的服务而研究</br>
                            为了出众的UI而编写</p>
                    </div>
                </div>
            </div>

            <!-- Second slide -->
            <div class="item carousel-item-five">
                <div class="container">
                    <div class="carousel-position-four text-center">
                        <h2 class="animate-delay carousel-title-v4"
                            data-animation="animated fadeInDown">
                            无界限
                        </h2>
                        <p class="carousel-subtitle-v2" data-animation="animated fadeInDown">
                            布局选项
                        </p>
                        <p class="carousel-subtitle-v3 margin-bottom-30"
                           data-animation="animated fadeInUp">
                            充分响应
                        </p>
                        <a class="carousel-btn" href="#" data-animation="animated fadeInUp">See More
                            细节
                        </a>
                    </div>
                    <img class="carousel-position-five animate-delay hidden-sm hidden-xs"
                         src="${pageContext.request.contextPath}/v2/assets/pages/img/shop-slider/slide2/price.png"
                         alt="Price" data-animation="animated zoomIn">
                </div>
            </div>

            <!-- Third slide -->
            <div class="item carousel-item-six">
                <div class="container">
                    <div class="carousel-position-four text-center">
                            <span class="carousel-subtitle-v3 margin-bottom-15"
                                  data-animation="animated fadeInDown">
                                全面管理 &amp; 前端
                            </span>
                        <p class="carousel-subtitle-v4" data-animation="animated fadeInDown">
                            电子商务的用户界面
                        </p>
                        <p class="carousel-subtitle-v3" data-animation="animated fadeInDown">
                            为您的项目做好了准备
                        </p>
                    </div>
                </div>
            </div>

            <!-- Fourth slide -->
            <div class="item carousel-item-seven">
                <div class="center-block">
                    <div class="center-block-wrap">
                        <div class="center-block-body">
                            <h2 class="carousel-title-v1 margin-bottom-20"
                                data-animation="animated fadeInDown">
                                最想要的 <br/>
                                珠宝首饰
                            </h2>
                            <a class="carousel-btn" href="#" data-animation="animated fadeInUp">
                                但是现在！
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control carousel-control-shop" href="#carousel-example-generic"
           role="button" data-slide="prev">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
        </a>
        <a class="right carousel-control carousel-control-shop" href="#carousel-example-generic"
           role="button" data-slide="next">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
        </a>
    </div>
</div>
<!-- END SLIDER -->

<div class="alipayServiceImpl">
    <div class="container">

        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-4">
                <ul class="list-group margin-bottom-25 sidebar-menu" id="sidebar-ul-product-item">
                </ul>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-8">
                <h2>分类商品</h2>
                <div class="owl-carousel owl-carousel3" id="category-product-list">
                    <c:forEach begin="0" end="2" varStatus="abc">
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img id="category-product-item-img-src-${abc.index}"
                                         src="" class="img-responsive"
                                         alt="">
                                    <div>
                                        <a id="category-product-item-a-img-src-${abc.index}"
                                           href=""
                                           class="btn btn-default fancybox-button">大图</a>
                                        <a href="#product-pop-up-category-${abc.index}"
                                           class="btn btn-default fancybox-fast-view">详情</a>
                                    </div>
                                </div>
                                <h3><a id="category-product-item-a-href-html-${abc.index}"
                                       href="">商品名</a>
                                </h3>
                                <div id="category-product-item-div-html-${abc.index}"
                                     class="pi-price">￥00.00
                                </div>
                                <a id="category-product-item-a-add-href-${abc.index}"
                                   href="javascript:void (0);" class="btn btn-default add2cart">添加到购物车</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
        <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2>最新商品</h2>
                <div class="owl-carousel owl-carousel5" id="new-product-list">
                    <c:forEach begin="0" end="4" varStatus="abc">
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img id="new-product-item-img-src-${abc.index}" src=""
                                         class="img-responsive" alt="">
                                    <div>
                                        <a id="new-product-item-a-img-src-${abc.index}" href=""
                                           class="btn btn-default fancybox-button">大图
                                        </a>
                                        <a href="#product-pop-up-new-${abc.index}"
                                           class="btn btn-default fancybox-fast-view">详情
                                        </a>
                                    </div>
                                </div>
                                <h3>
                                    <a id="new-product-item-a-href-html-${abc.index}"
                                       href="">商品名</a>
                                </h3>
                                <div id="new-product-item-div-html-${abc.index}" class="pi-price">
                                    ￥00.00
                                </div>
                                <a id="new-product-item-a-add-href-${abc.index}"
                                   href="javascript:void (0);" class="btn btn-default add2cart">添加到购物车</a>
                                <div class="sticker sticker-new"></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->
        <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2>最热商品</h2>
                <div class="owl-carousel owl-carousel5" id="hot-product-list">
                    <c:forEach begin="0" end="4" varStatus="abc">
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img id="hot-product-item-img-src-${abc.index}" src=""
                                         class="img-responsive" alt="">
                                    <div>
                                        <a id="hot-product-item-a-img-src-${abc.index}" href=""
                                           class="btn btn-default fancybox-button">大图
                                        </a>
                                        <a href="#product-pop-up-hot-${abc.index}"
                                           class="btn btn-default fancybox-fast-view">详情
                                        </a>
                                    </div>
                                </div>
                                <h3>
                                    <a id="hot-product-item-a-href-html-${abc.index}"
                                       href="">商品名</a>
                                </h3>
                                <div id="hot-product-item-div-html-${abc.index}" class="pi-price">
                                    ￥00.00
                                </div>
                                <a id="hot-product-item-a-add-href-${abc.index}"
                                   href="javascript:void (0);" class="btn btn-default add2cart">添加到购物车</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->
    </div>
</div>

<!-- BEGIN BRANDS -->
<div class="brands">
    <div class="container">
        <div class="owl-carousel owl-carousel6-brands">
            <c:forEach begin="0" end="6" varStatus="abc">
                <a href="${pageContext.request.contextPath}/product/list.do">
                    <img src="${pageContext.request.contextPath}/v2/assets/pages/img/brands/gap.jpg"
                         alt="canon" title="canon">
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<!-- END BRANDS -->

<!-- BEGIN FOOTER -->
<jsp:include page="shop-bottom.jsp"/>
<!-- END FOOTER -->

<c:forEach begin="0" end="4" varStatus="abc">
    <c:set var="name" value="hot"/>
    <!-- BEGIN fast view of a product -->
    <%--product-pop-up-category-${abc.index}--%>
    <div id="product-pop-up-${name}-${abc.index}" style="display: none; width: 700px;">
        <div class="product-page product-pop-up">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                    <div class="product-main-image">
                        <img src="" id="${name}-product-up-img-src-${abc.index}"
                             alt="Cool green dress with red bell" class="img-responsive">
                    </div>
                    <div class="product-other-images">
                        <a href="javascript:;" class="active">
                            <img alt="" id="${name}-product-up-a-img-src-${abc.index}"
                                 src="">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                    <h1 id="${name}-product-up-h2-html-${abc.index}"></h1>
                    <div class="price-availability-block clearfix">
                        <div class="price">
                            <strong><span>$</span>
                                <span id="${name}-product-up-span-1-html-${abc.index}">${p2.marketPrice}</span>
                            </strong>
                            <em>$<span>
                                    <span id="${name}-product-up-span-2-html-${abc.index}">${p2.shopPrice}</span>
                            </span></em>
                        </div>
                        <div class="availability">
                            库存: <strong id="${name}-product-up-strong-html-${abc.index}"></strong>
                        </div>
                    </div>
                    <div class="description">
                        <p id="${name}-product-up-p-html-${abc.index}"></p>
                    </div>
                    <div class="product-page-options">
                    </div>
                    <div class="product-page-cart">
                        <div class="product-quantity">
                            <input id="product-quantity-${name}-${abc.index}" type="text" value="1"
                                   name="product-quantity" class="form-control input-sm">
                        </div>
                        <a id="${name}-product-up-a-add-href-${abc.index}" class="btn btn-primary"
                           type="submit">添加到购物车</a>

                        <a id="${name}-product-up-a-more-href-${abc.index}"
                           href="${pageContext.request.contextPath}/product/one/${p2.pid}.do"
                           class="btn btn-default">更多细节</a>
                    </div>
                </div>

                <div class="sticker sticker-sale"></div>
            </div>
        </div>
    </div>
    <!-- END fast view of a product -->
</c:forEach>

<c:forEach begin="0" end="4" varStatus="abc">
    <c:set var="name" value="new"/>
    <!-- BEGIN fast view of a product -->
    <%--product-pop-up-category-${abc.index}--%>
    <div id="product-pop-up-${name}-${abc.index}" style="display: none; width: 700px;">
        <div class="product-page product-pop-up">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                    <div class="product-main-image">
                        <img src="" id="${name}-product-up-img-src-${abc.index}"
                             alt="Cool green dress with red bell" class="img-responsive">
                    </div>
                    <div class="product-other-images">
                        <a href="javascript:;" class="active">
                            <img alt="" id="${name}-product-up-a-img-src-${abc.index}"
                                 src="">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                    <h1 id="${name}-product-up-h2-html-${abc.index}"></h1>
                    <div class="price-availability-block clearfix">
                        <div class="price">
                            <strong><span>$</span>
                                <span id="${name}-product-up-span-1-html-${abc.index}">${p2.marketPrice}</span>
                            </strong>
                            <em>$<span>
                                    <span id="${name}-product-up-span-2-html-${abc.index}">${p2.shopPrice}</span>
                            </span></em>
                        </div>
                        <div class="availability">
                            库存: <strong id="${name}-product-up-strong-html-${abc.index}"></strong>
                        </div>
                    </div>
                    <div class="description">
                        <p id="${name}-product-up-p-html-${abc.index}"></p>
                    </div>
                    <div class="product-page-options">
                    </div>
                    <div class="product-page-cart">
                        <div class="product-quantity">
                            <input id="product-quantity-${name}-${abc.index}" type="text" value="1"
                                   name="product-quantity" class="form-control input-sm">
                        </div>
                        <a id="${name}-product-up-a-add-href-${abc.index}" class="btn btn-primary"
                           type="submit">添加到购物车</a>

                        <a id="${name}-product-up-a-more-href-${abc.index}"
                           href="${pageContext.request.contextPath}/product/one/${p2.pid}.do"
                           class="btn btn-default">更多细节</a>
                    </div>
                </div>

                <div class="sticker sticker-sale"></div>
            </div>
        </div>
    </div>
    <!-- END fast view of a product -->
</c:forEach>

<c:forEach begin="0" end="2" varStatus="abc">
    <c:set var="name" value="category"/>

    <div id="product-pop-up-${name}-${abc.index}" style="display: none; width: 700px;">
        <div class="product-page product-pop-up">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                    <div class="product-main-image">
                        <img src="" id="${name}-product-up-img-src-${abc.index}"
                             alt="Cool green dress with red bell" class="img-responsive"
                             data-BigImgsrc="">
                    </div>
                    <div class="product-other-images">
                        <a href="javascript:;" class="active">
                            <img alt="" id="${name}-product-up-a-img-src-${abc.index}"
                                 src="">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                    <h1 id="${name}-product-up-h2-html-${abc.index}"></h1>
                    <div class="price-availability-block clearfix">
                        <div class="price">
                            <strong><span>$</span>
                                <span id="${name}-product-up-span-1-html-${abc.index}">${p2.marketPrice}</span>
                            </strong>
                            <em>$<span>
                                    <span id="${name}-product-up-span-2-html-${abc.index}">${p2.shopPrice}</span>
                            </span></em>
                        </div>
                        <div class="availability">
                            库存: <strong id="${name}-product-up-strong-html-${abc.index}"></strong>
                        </div>
                    </div>
                    <div class="description">
                        <p id="${name}-product-up-p-html-${abc.index}"></p>
                    </div>
                    <div class="product-page-options">
                    </div>
                    <div class="product-page-cart">
                        <div class="product-quantity">
                            <input id="product-quantity-${name}-${abc.index}" type="text" value="1"
                                   name="product-quantity" class="form-control input-sm">
                        </div>
                        <a id="${name}-product-up-a-add-href-${abc.index}" class="btn btn-primary"
                           type="submit">添加到购物车</a>

                        <a id="${name}-product-up-a-more-href-${abc.index}"
                           href="${pageContext.request.contextPath}/product/one/${p2.pid}.do"
                           class="btn btn-default">更多细节</a>
                    </div>
                </div>

                <div class="sticker sticker-sale"></div>
            </div>
        </div>
    </div>
    <!-- END fast view of a product -->
</c:forEach>

<script>

    function indexInit() {
        sidebarMenuProductItem($("#sidebar-ul-product-item"));

        getProductList(5, "new", $("#new-product-list"));
        getProductList(5, "hot", $("#hot-product-list"));
        getProductList("1/3", "category");
    }

    jQuery(document).ready(function () {
        indexInit();
        Layout.init();
        Layout.initOWL();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initTwitter();
    });
</script>
</body>
<!-- END BODY -->
</html>
