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
    <title>购物车详情 | </title>

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

                <c:if test="${status == 0}">
                    <!-- BEGIN CONTENT -->
                    <div class="col-md-12 col-sm-12">
                        <h1>购物车详情</h1>
                        <form id="cart-form" method="post"
                              action="${pageContext.request.contextPath}/order/create.do">
                            <div class="goods-page">
                                <div class="goods-data clearfix">
                                    <div class="table-wrapper-responsive">
                                        <table summary="购物车">

                                            <tr>
                                                <th class="goods-page-ref-no">选择</th>
                                                <th class="goods-page-image">图像</th>
                                                <th class="goods-page-description">描述</th>
                                                <th class="goods-page-ref-no">编号</th>
                                                <th class="goods-page-quantity">数量</th>
                                                <th class="goods-page-price">单价</th>
                                                <th class="goods-page-total" colspan="2">总价</th>
                                            </tr>

                                            <c:forEach varStatus="abc" items="${data.list}"
                                                       var="c">
                                                <tr>
                                                    <td class="goods-page-no">
                                                        <input type="checkbox" name="pid"
                                                               value="${c.product.pid}"
                                                        <c:if test="${c.product.state != 0}">
                                                               disabled
                                                        </c:if> >
                                                    </td>
                                                    <td class="goods-page-image">
                                                        <a href="javascript:;"><img
                                                            src="${pageContext.request.contextPath}/v2/assets/pages/img/${c.product.image}"
                                                            alt="${c.product.name}"></a>
                                                    </td>
                                                    <td class="goods-page-description">
                                                        <h3>
                                                            <a href="javascript:;">${c.product.name}</a>
                                                        </h3>
                                                        <em>
                                                            <a href="${pageContext.request.contextPath}/product/one/${c.product.pid}.do">
                                                                <c:if test="${c.product.state != 0}">已经下架的商品</c:if>
                                                                <c:if test="${c.product.state == 0}">更多信息</c:if>
                                                            </a>
                                                        </em>
                                                    </td>
                                                    <td class="goods-page-ref-no">
                                                        编号：${c.product.pid}
                                                    </td>
                                                    <td class="goods-page-quantity">
                                                        <div class="product-quantity">
                                                            <input id="product-quantity-${abc.index}"
                                                                   name="count" type="text"
                                                                   value="${c.count}"
                                                                   onchange="countChange()"
                                                                   class="form-control input-sm ">
                                                        </div>
                                                    </td>
                                                    <td class="goods-page-price">
                                                        <strong><span>￥</span>${c.product.shopPrice}
                                                        </strong>
                                                    </td>
                                                    <td class="goods-page-total">
                                                        <strong><span>￥</span>${c.subtotal}
                                                        </strong>
                                                    </td>
                                                    <td class="del-goods-col">
                                                        <a class="del-goods"
                                                           href="javascript:deleteCartItem('${c.product.pid}',true);">&nbsp;</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </table>
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

                                    <div class="shopping-total">
                                        <ul>
                                            <li>
                                                <em>小计</em>
                                                <strong class="price"><span>￥</span>${allTotal}
                                                </strong>
                                            </li>
                                            <li>
                                                <em>运费</em>
                                                <strong class="price"><span>￥</span>0.00</strong>

                                            </li>
                                            <li class="shopping-total-price">
                                                <em>合计</em>
                                                <strong class="price"><span>￥</span>${allTotal}</strong>

                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <button type="button" onclick="return submitCart()"
                                        class="btn btn-primary">支付确认<i
                                    class="fa fa-check"></i></button>

                                <a href="javascript:void (0);" id="cart-update"
                                   class="btn btn-primary" type="submit">更新购物车<i
                                    class="fa fa-check"></i></a>
                            </div>
                        </form>
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

<div id="loader" style="position:fixed;top:0px;left:0px;z-index:1000;
    width: 100%;height: 100%;background-color: rgba(195,195,195,0.8);
    display: none;">
    <h2 align="center" style="color:#0abfe1;margin-top:100px">请稍等</h2>
    <div class='base'>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
    </div>
</div>
<%--</div>--%>

<jsp:include page="../base/shop-bottom.jsp"/>

<script src="${pageContext.request.contextPath}/v2/custom/carts.js?t=20180527"
        type="text/javascript"></script>

<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>

<script type="text/javascript">
    saveToSession("countChange", false);
    console.log(document.getElementById('form'));
    $("#loader").hide();
    $("#cart-update").click(function () {
        createListToUpdate();
    })

    function createListToUpdate() {
        var list = [];
        var id = null;
        <c:forEach items="${data.list}" var="cartItem" varStatus="abc">
        id = "#product-quantity-${abc.index}";
        list[${abc.index}] = {
            pid: "${cartItem.pid}",
            count: $(id).val()
        };
        </c:forEach>
        updateCarts(list);
    }

    function countChange() {
        saveToSession("countChange", true);
    }

    function submitCart() {

        layui.use('table', function () {
            var layer = layui.layer;
            if ($("input[type='checkbox'][name='pid']").is(':checked')) {

                if (getByAll("countChange") !== false &&
                    getByAll("countChange") !== "false") {
                    layer.open({
                        type: 1
                        , offset: 'confrim' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        , id: 'layerDemo' + 'confrim' //防止重复弹出
                        , content: '<div style="padding: 20px 100px;">' + '未确认修改，确认提交？' + '</div>'
                        , btn: ['确认不修改提交', '取消']
                        , btnAlign: 'c' //按钮居中
                        , shade: 0.5 //不显示遮罩
                        , yes: function () {
                            layer.closeAll();
                            document.getElementById("cart-form").submit();
                        }
                        , btn2: function () {
                            layer.closeAll();
                        }
                    });
                } else {
                    document.getElementById("cart-form").submit();
                }
            } else {
                layer.open({
                    type: 1
                    , offset: 'confrim' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'layerDemo' + 'confrim' //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + '未选择要购买的商品' + '</div>'
                    , btn: '关闭'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0.5 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            }
        });
    }

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