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
    <title>我的订单列表 | </title>

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
    .ball-grid-pulse div {
        background: orange !important;
    }
</style>
<!-- Body BEGIN -->
<body class="ecommerce" style="">
<jsp:include page="../base/shop-header.jsp"/>

<div style="min-height:400px">
    <div class="main">
        <div class="container">
            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40">

                <!-- BEGIN CONTENT -->
                <div class="col-md-12 col-sm-12">
                    <c:if test="${status == 0}">
                        <h1>订单详情</h1>
                        <div class="goods-page">
                            <div class="goods-data clearfix">
                                <div class="table-wrapper-responsive">
                                    <table>
                                        <tr>
                                            <th width="15%" class="goods-page-image"
                                                style="text-align: center">图像
                                            </th>
                                            <th width="25%" class="goods-page-description"
                                                style="text-align: center">描述
                                            </th>
                                            <th width="15%" class="goods-page-ref-no"
                                                style="text-align: center">编号
                                            </th>
                                            <th width="15%" class="goods-page-quantity"
                                                style="text-align: center">数量
                                            </th>
                                            <th width="15%" class="goods-page-price"
                                                style="text-align: center">单价
                                            </th>
                                            <th width="15%" class="goods-page-total"
                                                style="text-align: center">总价
                                            </th>
                                        </tr>
                                    </table>
                                    <c:forEach varStatus="bcd" items="${data.list}"
                                               var="orders">
                                        <table>
                                            <tr style="background: #a0a0a0;color:#fff;">
                                                <th colspan="3"
                                                    style="text-align: center">订单号
                                                </th>
                                                <th colspan="1"
                                                    style="text-align: center">日期
                                                </th>
                                                <th colspan="1"
                                                    style="text-align: center">状态
                                                </th>
                                                <th colspan="1"
                                                    style="text-align: center">详情
                                                </th>
                                            </tr>
                                            <tr style="background: #a0a0a0;color:#fff;">
                                                <th colspan="3"
                                                    style="text-align: center">${orders.oid}</th>
                                                <th colspan="1"
                                                    style="text-align: center">${orders.orderTime}</th>
                                                <th colspan="1"
                                                    style="text-align: center"><a href="">
                                                    <c:if test="${orders.state == 0}">
                                                    未付款
                                                    </c:if>
                                                    <c:if test="${orders.state == 1}">
                                                    已付款
                                                    </c:if>
                                                    <c:if test="${orders.state == 2}">
                                                    已收货
                                                    </c:if>
                                                    <c:if test="${orders.state == 3}">
                                                    已退款
                                                    </c:if>
                                                <th colspan="1"
                                                    style="text-align: center">
                                                    <a style="height:25px;line-height:25px;display: inline-block;
                                                    text-decoration: none;"
                                                       href="${pageContext.request.contextPath}/order/${orders.oid}.do">
                                                        <i style="font-size: 25px;position: relative;top: 3px"
                                                           class="layui-icon layui-icon-menu-fill"></i>
                                                    </a>
                                                </th>
                                            </tr>
                                            <c:forEach varStatus="abc" items="${orders.list}"
                                                       var="c">
                                                <tr>
                                                    <td width="15%" align="center"
                                                        class="goods-page-image">
                                                        <a href="javascript:;"><img
                                                            src="${pageContext.request.contextPath}/v2/assets/pages/img/${c.product.image}"
                                                            alt="${c.product.name}"></a>
                                                    </td>
                                                    <td width="25%" align="center"
                                                        class="goods-page-description">
                                                        <h3>
                                                            <a href="javascript:;">${c.product.name}</a>
                                                        </h3>
                                                        <em>
                                                            <a href="${pageContext.request.contextPath}/product/one/${c.product.pid}.do">
                                                                更多信息
                                                            </a>
                                                        </em>
                                                    </td>
                                                    <td width="15%" align="center"
                                                        class="goods-page-ref-no">
                                                        编号：${c.product.pid}
                                                    </td>
                                                    <td width="15%" align="center"
                                                        class="goods-page-quantity">
                                                        <div class="product-quantity-other"
                                                             style="max-width:100px;">
                                                            <input type="text"
                                                                   value="${c.count}"
                                                                   readonly
                                                                   class="form-control input-sm">
                                                        </div>
                                                    </td>
                                                    <td width="15%" align="center"
                                                        class="goods-page-price">
                                                        <strong><span>￥</span>${c.product.shopPrice}
                                                        </strong>
                                                    </td>
                                                    <td width="15%" align="center"
                                                        class="goods-page-total">
                                                        <strong><span>￥</span>${c.subtotal}
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </c:forEach>

                                </div>
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
                    </c:if>

                    <c:if test="${status == 1}">
                        <h2 align="center">${msg}</h2>
                    </c:if>
                </div>
                <!-- END CONTENT -->
            </div>
            <!-- END SIDEBAR & CONTENT -->
        </div>
    </div>
</div>

<jsp:include page="../base/shop-bottom.jsp"/>

<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>

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
<!-- END BODY -->
</html>