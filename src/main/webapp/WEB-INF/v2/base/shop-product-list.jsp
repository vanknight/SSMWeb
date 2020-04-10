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
    <title>商品列表 | </title>

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

<div class="title-wrapper">
    <div class="container">
        <div class="container-inner">
            <h1><span>购物</span> 就现在</h1>
            <em>这里有不少于4000件的商品</em>
        </div>
    </div>
</div>

<div class="main">

    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/view/index.do">主页</a></li>
            <li class="active">当前分类</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">

            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-5">
                <ul class="list-group margin-bottom-25 sidebar-menu" id="sidebar-ul">

                </ul>

                <div class="sidebar-products clearfix" id="random-product-list">
                    <h2>额外的商品</h2>
                    <c:forEach begin="0" end="3" varStatus="abc">
                        <div class="item">
                            <a id="random-product-item-a-${abc.index}" href="">
                                <img id="random-product-item-img-${abc.index}" src=""
                                     alt=""></a>
                            <h3>
                                <a id="random-product-item-a-html-${abc.index}" href="">商品名</a>
                            </h3>
                            <div id="random-product-item-price-${abc.index}" class="price">$00.00
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
            <!-- END SIDEBAR -->

            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <!-- BEGIN PRODUCT LIST -->
                <c:forEach begin="0" end="2" varStatus="abc">

                    <div class="row product-list">
                        <c:forEach begin="${abc.index*3}" end="${abc.index*3 + 2}"
                                   items="${data.list}" var="p" varStatus="bcd">
                            <!-- PRODUCT ITEM START -->
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="${pageContext.request.contextPath}/v2/assets/pages/img/${p.image}"
                                             class="img-responsive" alt="${p.name}">
                                        <div>
                                            <a href="${pageContext.request.contextPath}/v2/assets/pages/img/${p.image}"
                                               class="btn btn-default fancybox-button">大图</a>
                                            <a href="#product-pop-up-${bcd.index}"
                                               class="btn btn-default fancybox-fast-view">详情</a>
                                        </div>
                                    </div>
                                    <h3>
                                        <a href="${pageContext.request.contextPath}/product/one/${p.pid}.do">${p.name}</a>
                                    </h3>
                                    <div class="pi-price">￥${p.shopPrice}</div>
                                    <a href="javascript:addProductToCart('${p.pid}',1);"
                                       class="btn btn-default add2cart">添加到购物车</a>
                                </div>
                            </div>
                            <!-- PRODUCT ITEM END -->
                        </c:forEach>
                    </div>
                </c:forEach>

                <!-- END PRODUCT LIST -->
                <!-- BEGIN PAGINATOR -->
                <div class="row">
                    <div class="col-md-4 col-sm-4 items-info">共有${data.pages}页</div>
                    <div class="col-md-8 col-sm-8">
                        <ul class="pagination pull-right">
                            <li>
                                <a href="javascript:window.location.href = changeURLParam('pageNum','${data.pageNum - 1}');">&laquo;</a>
                            </li>
                            <c:forEach items="${data.navigatepageNums}" var="pageNum">
                                <c:if test="${pageNum != data.pageNum}">
                                    <li>
                                        <a href="javascript:window.location.href = changeURLParam('pageNum','${pageNum}');">${pageNum}</a>
                                    </li>
                                </c:if>

                                <c:if test="${pageNum == data.pageNum}">
                                    <li><span>${pageNum}</span></li>
                                </c:if>
                            </c:forEach>
                            <li>
                                <a href="javascript:window.location.href = changeURLParam('pageNum','${data.pageNum + 1}');">&raquo;</a>
                            </li>
                        </ul>

                    </div>
                </div>
                <!-- END PAGINATOR -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>

</div>

<jsp:include page="shop-bottom.jsp"/>

<c:forEach begin="0" end="8" varStatus="abc" items="${data.list}" var="p2">
    <!-- BEGIN fast view of a product -->
    <div id="product-pop-up-${abc.index}" style="display: none; width: 700px;">
        <div class="product-page product-pop-up">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                    <div class="product-main-image">
                        <img src="${pageContext.request.contextPath}/v2/assets/pages/img/${p2.image}"
                             alt="Cool green dress with red bell" class="img-responsive">
                    </div>
                    <div class="product-other-images">
                        <a href="javascript:;" class="active">
                            <img alt="Berry Lace Dress"
                                 src="${pageContext.request.contextPath}/v2/assets/pages/img/${p2.image}">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                    <h1>${p2.name}</h1>
                    <div class="price-availability-block clearfix">
                        <div class="price">
                            <strong><span>$</span>
                                    ${p2.marketPrice}
                            </strong>
                            <em>$<span>
                                    ${p2.shopPrice}
                            </span></em>
                        </div>
                        <div class="availability">
                            库存: <strong>${p2.stock}</strong>
                        </div>
                    </div>
                    <div class="description">
                        <p>${p2.desc}</p>
                    </div>
                    <div class="product-page-options">
                    </div>
                    <div class="product-page-cart">
                        <div class="product-quantity">
                            <input id="product-quantity-${abc.index}" type="text" value="1" readonly
                                   name="product-quantity"
                                   class="form-control input-sm">
                        </div>
                        <a class="btn btn-primary"
                           href="javascript:addProductToCart('${p2.pid}',$(product${abc.index}).val());"
                           type="submit">添加到购物车</a>
                        <a href="${pageContext.request.contextPath}/product/one/${p2.pid}.do"
                           class="btn btn-default">更多细节</a>
                    </div>
                </div>

                <div class="sticker sticker-sale"></div>
            </div>
        </div>
    </div>
    <!-- END fast view of a product -->
</c:forEach>


<script type="text/javascript">
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Layout.initSliderRange();
        getRandomProduct(4);
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>