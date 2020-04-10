<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/19 13:39
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>我喜欢的商品 | </title>

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
<jsp:include page="../base/shop-header.jsp"/>

<div style="min-height:400px">
    <div class="main">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/view/index.do">主页</a></li>
                <li class="active">我喜欢的商品</li>
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
                        <h1>我喜欢</h1>
                        <div class="goods-page">
                            <div class="goods-data clearfix">
                                <div class="table-wrapper-responsive">
                                    <table summary="Shopping cart">
                                        <tr>
                                            <th class="goods-page-image">图像d</th>
                                            <th class="goods-page-description">描述</th>
                                            <th class="goods-page-ref-no">库存</th>
                                            <th class="goods-page-price">单价</th>
                                        </tr>
                                        <c:forEach varStatus="abc" items="${data.list}" var="wp">
                                            <tr>
                                                <td class="goods-page-image">
                                                    <a href="javascript:;"><img
                                                            src="${pageContext.request.contextPath}/v2/assets/pages/img/${wp.product.image}"
                                                            alt="${wp.product.name}"></a>
                                                </td>
                                                <td class="goods-page-description">
                                                    <h3>
                                                        <a href="javascript:;">${wp.product.name}</a>
                                                    </h3>
                                                    <p>
                                                        <strong>${wp.product.name}</strong> - 颜色:
                                                        绿色;
                                                        大小: S
                                                    </p>
                                                    <em>
                                                        <a href="${pageContext.request.contextPath}/product/one/${wp.product.pid}.do">
                                                            更多信息
                                                        </a>
                                                    </em>
                                                </td>
                                                <td class="goods-page-price">
                                                    <strong><span> </span>${wp.product.stock}
                                                    </strong>
                                                </td>
                                                <td class="goods-page-price">
                                                    <strong><span>￥</span>${wp.product.shopPrice}
                                                    </strong>
                                                </td>
                                                <td class="del-goods-col">
                                                    <a class="del-goods"
                                                       href="javascript:deleteWishProduct('${wp.product.pid}');">&nbsp;</a>
                                                    <a class="add-goods"
                                                       href="javascript:addProductToCart('${wp.product.pid}',1);">&nbsp;</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>

                                    <!-- BEGIN PAGINATOR -->
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4 items-info">
                                            共有${data.pages}页
                                        </div>
                                        <div class="col-md-8 col-sm-8">
                                            <ul class="pagination pull-right">
                                                <li>
                                                    <a href="javascript:window.location.href = changeURLParam('pageNum','${data.pageNum - 1}');">&laquo;</a>
                                                </li>
                                                <c:forEach items="${data.navigatepageNums}"
                                                           var="pageNum">
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

<jsp:include page="../base/shop-bottom.jsp"/>


<c:forEach varStatus="abc" items="${data.list}" var="wp2">
    <!-- BEGIN fast view of a product -->
    <div id="product-pop-up-${abc.index}" style="display: none; width: 700px;">
        <div class="product-page product-pop-up">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                    <div class="product-main-image">
                        <img src="${pageContext.request.contextPath}/v2/assets/pages/img/${wp2.product.image}"
                             alt="${wp2.product.name}" class="img-responsive">
                    </div>
                    <div class="product-other-images">
                        <a href="javascript:;" class="active">
                            <img alt="${wp2.product.name}"
                                 src="${pageContext.request.contextPath}/v2/assets/pages/img/${wp2.product.image}">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                    <h1>${wp2.product.name}</h1>
                    <div class="price-availability-block clearfix">
                        <div class="price">
                            <strong><span>$</span>
                                    ${wp2.product.marketPrice}
                            </strong>
                            <em>$<span>
                                    ${wp2.product.shopPrice}
                            </span></em>
                        </div>
                        <div class="availability">
                            库存: <strong>${wp2.product.stock}</strong>
                        </div>
                    </div>
                    <div class="description">
                        <p>${wp2.product.desc}</p>
                    </div>
                    <div class="product-page-options">
                        <div class="pull-left">
                            <label class="control-label">Size:</label>
                            <select class="form-control input-sm">
                                <option>L</option>
                                <option>M</option>
                                <option>XL</option>
                            </select>
                        </div>
                        <div class="pull-left">
                            <label class="control-label">Color:</label>
                            <select class="form-control input-sm">
                                <option>Red</option>
                                <option>Blue</option>
                                <option>Black</option>
                            </select>
                        </div>
                    </div>
                    <div class="product-page-cart">
                        <div class="product-quantity">
                            <input id="product-quantity-${abc.index}" type="text" value="1" readonly
                                   name="product-quantity"
                                   class="form-control input-sm">
                        </div>
                        <a class="btn btn-primary"
                           href="javascript:addProductToCart('${wp2.product.pid}',$('#product-quantity-${abc.index}').val());"
                           type="submit">添加到购物车</a>
                        <a href="${pageContext.request.contextPath}/product/one/$productoduct.pid}.do"
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
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>