<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>商品详情 | </title>

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
<style>
    .font-important-12 * {
        font-size: 14px !important;
    }
</style>
<!-- Body BEGIN -->
<body class="ecommerce">
<jsp:include page="shop-header.jsp"/>

<div style="min-height:400px">
    <div class="main">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/view/index.do">Home</a></li>
                <li><a href="">商品列表</a></li>
                <li class="active">商品名</li>
            </ul>
            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40">
                <!-- BEGIN SIDEBAR -->
                <div class="sidebar col-md-3 col-sm-5">
                    <ul class="list-group margin-bottom-25 sidebar-menu" id="sidebar-ul">

                    </ul>
                </div>
                <!-- END SIDEBAR -->

                <c:if test="${status == 0}">
                    <!-- BEGIN CONTENT -->
                    <div class="col-md-9 col-sm-7">
                        <div class="product-page">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="product-main-image">
                                        <img src="${pageContext.request.contextPath}/v2/assets/pages/img/${data.image}"
                                             alt="Cool green dress with red bell"
                                             class="img-responsive"
                                             data-BigImgsrc="${pageContext.request.contextPath}/v2/assets/pages/img/${data.image}">
                                    </div>
                                    <div class="product-other-images">
                                        <a href="${pageContext.request.contextPath}/v2/assets/pages/img/${data.image}"
                                           class="fancybox-button" rel="photos-lib">
                                            <img
                                                src="${pageContext.request.contextPath}/v2/assets/pages/img/${data.image}"
                                                alt="Berry Lace Dress">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <h1>${data.name}</h1>
                                    <div class="price-availability-block clearfix">
                                        <div class="price">
                                            <strong><span>￥</span>${data.marketPrice}</strong>
                                            <em>￥<span>${data.shopPrice}</span></em>
                                        </div>
                                        <div class="availability">
                                            库存: <strong>${data.stock}</strong>
                                        </div>
                                    </div>
                                    <div class="description" style="font-family: 'Open Sans', sans-serif;
                                    border-bottom: 1px solid #f4f4f4;padding-bottom: 18px;margin-bottom: 20px;font-weight: 300;">
                                        <p>${data.desc}.</p>
                                    </div>

                                    <div class="review">
                                        <div style="display: flex;flex-direction: row;align-items: center;">
                                            <span>评级:</span>
                                            <fmt:formatNumber var="dataRating" value="${data.rating*10}" pattern="#"/>
                                            <div class="rating-readonly-half-${dataRating}"></div>
                                        </div>
                                        <p>${data.listReview.size()} 评论</p>
                                    </div>
                                    <div class="product-page-cart">
                                        <div class="product-quantity">
                                            <input id="product-quantity" type="text" value="1"
                                                   class="form-control input-sm">
                                        </div>
                                        <a class="btn btn-primary" type="submit"
                                           href="javascript:addProductToCart('${data.pid}',$('#product-quantity').val())">添加到购物车</a>
                                        <a class="btn btn-primary" type="submit"
                                           href="javascript:addProductToWish('${data.pid}');">添加到我喜欢</a>
                                    </div>
                                </div>

                                <div class="product-page-content">
                                    <ul id="myTab" class="nav nav-tabs">
                                        <li><a href="#Description" data-toggle="tab">图文介绍</a></li>
                                        <li class="active"><a href="#Reviews" data-toggle="tab">累计评论</a></li>
                                    </ul>
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade" id="Description">

                                            <c:if test="${data.details.images != '' && data.details.images != null}">
                                                <c:set var="images" value="${fn:split(data.details.images, ';')}"/>
                                                <c:forEach items="${images}" var="image">
                                                    <img style="width:100%;height:auto;margin-bottom:15px;"
                                                         src="${pageContext.request.contextPath}/v2/assets/pages/img/${image}"
                                                         alt="">
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${data.details.images == '' || data.details.images == null}">
                                                <h2 align="center">暂无介绍</h2>
                                            </c:if>
                                        </div>
                                        <div class="tab-pane fade in active" id="Reviews">

                                            <c:if test="${data.listReview != null && fn:length(data.listReview) > 0}">
                                                <c:forEach items="${data.listReview}" var="review" varStatus="abc">
                                                    <div class="review-item clearfix">
                                                        <div class="review-item-submitted">
                                                            <strong>${review.user.username}</strong>
                                                            <em>${review.time}</em>
                                                        </div>
                                                        <div class="review-item-content" style="font-size: 15px;">
                                                            <p>${review.content}</p>
                                                        </div>
                                                        <div class="font-important-12"
                                                             style="width: 200px;text-align: center;display: inline-block;">
                                                            <div
                                                                style="display: flex;flex-direction: row;align-items: center;">
                                                                <span>评级:</span>
                                                                <fmt:formatNumber var="reviewRating"
                                                                                  value="${review.rating*10}"
                                                                                  pattern="#"/>
                                                                <div class="rating-readonly-half-${reviewRating}"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${data.listReview == null || fn:length(data.listReview) <= 0}">
                                                <h2 align="center">暂无评论</h2>

                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <div class="sticker sticker-sale"></div>
                            </div>
                        </div>
                    </div>
                    <!-- END CONTENT -->
                </c:if>
                <c:if test="${status == 1}">
                    <h2 align="center">${msg}</h2>
                </c:if>
            </div>
            <!-- END SIDEBAR & CONTENT -->

        </div>
    </div>
</div>
<jsp:include page="shop-bottom.jsp"/>

<script>
    layui.use(['rate'], function () {
        var rate = layui.rate;
        rate.render({
            elem: '.rating'
            , value: 5
            , half: true
            , text: true
        });
    });
</script>

<script type="text/javascript">
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
    });
    layui.use(['rate'], function () {
        var rate = layui.rate;
        rate.render({
            elem: '.rating-readonly'
            , value: 5
            , half: true
            , text: true
            , readonly: true
        });
        for (var i = 10; i <= 50; i++) {
            rate.render({
                elem: '.rating-readonly-half-' + i
                , value: parseFloat(i / 10.0)
                , half: true
                , text: true
                , readonly: true
            });
        }
        rate.render({
            elem: '.rating'
            , value: 3.5
            , half: true
            , text: true
        });
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>