<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>订单详情 | </title>

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
    .center-title {
        text-align: center;
    }

    .center-center {
        line-height: 100px;
        text-align: center;
    }

    .a-review {
        text-decoration: none;
        color: white !important;
    }

    .a-review:hover {
        text-decoration: none;
        color: white !important;
    }

    .a-reviewed {
        text-decoration: none;
        color: #767F88 !important;
    }

    .a-reviewed:hover {
        text-decoration: none;
        color: #767F88 !important;
    }

    .a-checkout {
        text-decoration: none;
        color: white !important;
    }

    .a-checkout:hover {
        text-decoration: none;
        color: white !important;
    }
</style>
<!-- Body BEGIN -->
<body class="ecommerce">

<jsp:include page="../base/shop-header.jsp"/>

<div class="main" style="min-height: 400px;">

    <c:if test="${status == 0}">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/view/shop-index.do">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/order/all.do">订单列表</a></li>
                <li class="active">付款</li>
            </ul>
            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40">
                <!-- BEGIN CONTENT -->
                <div class="col-md-12 col-sm-12">
                    <h1>订单详情</h1>
                    <!-- BEGIN CHECKOUT PAGE -->
                    <div class="panel-group checkout-page accordion scrollable"
                         id="checkout-page">

                        <!-- BEGIN PAYMENT ADDRESS -->
                        <div class="panel-body row">
                            <div class="col-md-6 col-sm-6">
                                <h3>收货人信息</h3>
                                <div class="form-group">
                                    <label for="name">收货人姓名
                                        <span class="require">*</span>
                                    </label>
                                    <input name="name" type="text" id="name"
                                           class="form-control" lay-verify="require" readonly
                                           value="${data.name}"
                                           autocomplete="name">
                                </div>
                                <div class="form-group">
                                    <label for="telephone">个人电话
                                        <span class="require">*</span>
                                    </label>
                                    <input type="text" id="telephone"
                                           lay-verify="require|telephone" readonly
                                           name="telephone" class="form-control"
                                           value="${data.telephone}"
                                           autocomplete="tel">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <h3>收货地址</h3>
                                <div class="form-group">
                                    <label for="address">具体位置 <span
                                        class="require">*</span></label>
                                    <textarea name="address" id="address" rows="8"
                                              style="resize:none" lay-verify="require"
                                              autocomplete="no" readonly
                                              class="form-control">${data.address}
                                    </textarea>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <!-- END PAYMENT ADDRESS -->

                        <!-- BEGIN CONFIRM -->
                        <div class="panel-body row">

                            <div class="col-md-12 clearfix">
                                <div class="table-wrapper-responsive">
                                    <table>
                                        <tr>
                                            <th width="110" class="center-title goods-page-image">图像</th>
                                            <th width="220" class="center-title goods-page-description">描述</th>
                                            <th width="110" class="center-title goods-page-ref-no">编号</th>
                                            <th width="110" class="center-title goods-page-quantity">数量</th>
                                            <th width="110" class="center-title goods-page-price">单价</th>
                                            <th width="110" class="center-title goods-page-total">总价</th>
                                            <c:if test="${data.state == 2}">
                                                <th width="110" class="center-title goods-page-total">操作</th>
                                            </c:if>
                                        </tr>
                                        <c:forEach varStatus="abc" items="${data.list}"
                                                   var="orderItem">
                                            <tr>
                                                <td class="center-center goods-page-image">
                                                    <a href="javascript:;"><img
                                                        src="${pageContext.request.contextPath}/v2/assets/pages/img/${orderItem.product.image}"
                                                        alt="${orderItem.product.name}">
                                                    </a>
                                                </td>
                                                <td class="goods-page-description">
                                                    <h3 style="display: inline-block;width:300px;margin: 0!important;padding: 0!important;">
                                                        <a href="javascript:;"
                                                           style="display: inline-block;width:100%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;box-sizing: border-box;">
                                                                ${orderItem.product.name}
                                                        </a>
                                                    </h3>
                                                    <p style="display: inline-block;width: 300px;">
                                                        <strong
                                                            style="display: inline-block;width:100%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;box-sizing: border-box;">
                                                                ${orderItem.product.desc}
                                                        </strong>
                                                    </p>
                                                    <em style="display: inline-block;width: 300px;">
                                                        <a href="${pageContext.request.contextPath}/product/one/${orderItem.product.pid}.do">
                                                            更多信息
                                                        </a>
                                                    </em>
                                                </td>
                                                <td class="center-center goods-page-ref-no">
                                                    <span style="display: inline-block;width:100%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;box-sizing: border-box;">
                                                        编号：${orderItem.product.pid}
                                                    </span>
                                                </td>
                                                <td class="center-center goods-page-quantity">
                                                    <div class="center-center ">
                                                        <input style="display: inline-block;" type="text"
                                                               value="${orderItem.count}" readonly
                                                               class="form-control input-sm">
                                                    </div>
                                                </td>
                                                <td class="center-center goods-page-price">
                                                    <strong><span>￥</span>${orderItem.product.shopPrice}
                                                    </strong>
                                                </td>
                                                <td class="center-center goods-page-total">
                                                    <strong><span>￥</span>${orderItem.subtotal}</strong>
                                                </td>
                                                <c:if test="${data.state == 2}">
                                                    <td class="center-center"
                                                        style="padding: 20px 0px 20px 0;vertical-align: top;border-bottom: solid 1px #ecebeb;">
                                                        <c:if test="${orderItem.state == 1}">
                                                            <a id="review-btn" href="javascript:void (0);"
                                                               onclick="review('${orderItem.itemId}')"
                                                               class="layui-btn a-review">评论</a>
                                                        </c:if>
                                                        <c:if test="${orderItem.state == 2}">
                                                            <a id="review-btn" href="javascript:void (0);"
                                                               class="layui-btn a-reviewed layui-btn-disabled">已评论</a>
                                                        </c:if>
                                                        <c:if test="${orderItem.state == 3}">
                                                            <a id="review-btn" href="javascript:void (0);"
                                                               class="layui-btn a-checkout layui-btn-warm a-clear">评论审核中</a>
                                                        </c:if>

                                                    </td>

                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <div class="checkout-total-block">
                                    <ul>
                                        <li>
                                            <em>小计</em>
                                            <strong class="price"><span>￥</span>${data.total}</strong>
                                        </li>
                                        <li>
                                            <em>运费</em>
                                            <strong class="price"><span>￥</span>${data.expressFee}</strong>
                                        </li>
                                        <li class="shopping-total-price">
                                            <em>合计</em>
                                            <strong class="price"><span>￥</span>${data.total}</strong>
                                        </li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                                <a href="${pageContext.request.contextPath}/order/del/${data.oid}.do"
                                   class="btn btn-primary pull-right"
                                   style="color:#fff;">
                                    删除订单
                                </a>
                                <c:if test="${data.state == 0}">
                                    <a href="${pageContext.request.contextPath}/order/check/${data.oid}.do"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        确认支付
                                    </a>
                                </c:if>
                                <c:if test="${data.state == 1}">
                                    <a href="javascript:void(0);" onclick="refund('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        发起退款
                                    </a>
                                    <a href="javascript:void(0);" onclick="receiptConfirmation('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        收货确认
                                    </a>
                                    <a href="javascript:void(0);" onclick="query('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        订单详情
                                    </a>
                                    <a href="javascript:void(0);"
                                       onclick="queryExpress('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        快递详情
                                    </a>
                                </c:if>
                                <c:if test="${data.state == 2}">
                                    <a href="javascript:void(0);"
                                       onclick="query('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        查询订单
                                    </a>
                                    <a href="javascript:void(0);"
                                       onclick="queryExpress('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        快递详情
                                    </a>
                                </c:if>
                                <c:if test="${data.state == 3}">
                                    <a href="javascript:void(0);"
                                       onclick="query('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        查询订单
                                    </a>
                                    <a href="javascript:void(0);"
                                       onclick="refundQuery('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        查询退款
                                    </a>
                                    <a href="javascript:void(0);"
                                       onclick="queryExpress('${data.oid}')"
                                       class="btn btn-primary pull-right"
                                       style="color:#fff;">
                                        快递详情
                                    </a>
                                </c:if>
                            </div>

                        </div>
                        <!-- END CONFIRM -->
                    </div>
                    <!-- END CHECKOUT PAGE -->
                </div>
                <!-- END CONTENT -->
            </div>
            <!-- END SIDEBAR & CONTENT -->
        </div>
    </c:if>
    <c:if test="${status == 1}">
        <h2 align="center">${msg}</h2>
    </c:if>
</div>

<div id="reviewForm" class="reviews-form" style="display: none;width:700px;height:280px;margin:0 auto;">
    <h2>写评论</h2>
    <div class="form-group">
        <label for="review-content">内容 <span
            class="require">*</span></label>
        <textarea style="resize: none;" class="form-control" rows="8" name="content"
                  id="review-content"></textarea>
    </div>
    <div class="form-group">
        <div style="width: 200px;text-align: center;height: 43px;display: inline-block;">
            <div style="display: flex;flex-direction: row;align-items: center;">
                <span>评级:</span>
                <div class="rating"></div>
            </div>
        </div>
        <input type="hidden" id="review-rating" name="rating" value="0.5">
        <input type="hidden" id="review-itemId" value="">
        <a href="javascript:void (0);" onclick="reviewSubmit()"
           class="layui-btn a-review">提交</a>
    </div>
</div>

<jsp:include page="../base/shop-bottom.jsp"/>
</body>
<script src="${pageContext.request.contextPath}/v2/custom/select.js?t=20180513"></script>
<script src="${pageContext.request.contextPath}/v2/custom/checkout.js?t=20180513"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Checkout.init();
    });

    function refund(oid) {
        layui.use(['layer', 'jquery'], function () {
            var timeLong = +new Date();
            var layer = layui.layer;
            layer.open({
                type: 2
                , title: '退款'
                , area: [800 + "px", 400 + "px"]
                , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                , id: 'layer' + 'refund' //防止重复弹出
                , content: '${pageContext.request.contextPath}/view/refundUI/' + oid + '.do?_='
                + timeLong
                , btn: ['关闭']
                , btnAlign: 'c' //按钮居中
                , shade: 0.5 //不显示遮罩
                , yes: function () {
                    layer.closeAll();
                    window.parent.replace(true);
                }
            });
        });
    }

    function receiptConfirmation(oid) {
        layui.use(['layer', 'jquery'], function () {
            var timeLong = +new Date();
            var layer = layui.layer;
            $.ajax({
                type: "post",
                url: contextPath+"/order/receipt/"+oid+".do",
                dataType: "json",
                success: function (data) {
                    var type = "msg";
                    if (data.status === "0") {
                        layer.open({
                            type: 1
                            , offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                            , id: 'layerDemo' + type //防止重复弹出
                            , content: '<div style="padding: 20px 100px;">' + data.msg + '</div>'
                            , btn: '关闭'
                            , btnAlign: 'c' //按钮居中
                            , shade: 0 //不显示遮罩
                            , yes: function () {
                                layer.closeAll();
                                window.location.reload(true);
                            }
                        });
                    } else {
                        layer.open({
                            type: 1
                            , offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                            , id: 'layerDemo' + type //防止重复弹出
                            , content: '<div style="padding: 20px 100px;">' + data.msg + '</div>'
                            , btn: '关闭'
                            , btnAlign: 'c' //按钮居中
                            , shade: 0 //不显示遮罩
                            , yes: function () {
                                layer.closeAll();
                                window.location.reload(true);
                            }
                        });
                    }
                },
                error: function (e) {
                    window.location.reload(true);
                }
            });

        });
    }

    function query(oid) {
        layui.use(['layer', 'jquery'], function () {
            var timeLong = +new Date();
            var layer = layui.layer;
            layer.open({
                type: 2
                , title: '详情'
                , area: [800 + "px", 600 + "px"]
                , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                , id: 'layer' + 'query' //防止重复弹出
                , content: '${pageContext.request.contextPath}/order/query/' + oid + '.do?_='
                + timeLong
                , btn: ['关闭']
                , btnAlign: 'c' //按钮居中
                , shade: 0.5 //不显示遮罩
                , yes: function () {
                    layer.closeAll();
                }
            });
        });
    }

    function refundQuery(oid) {
        layui.use(['layer', 'jquery'], function () {
            var timeLong = +new Date();
            var layer = layui.layer;
            layer.open({
                type: 2
                , title: '详情'
                , area: [800 + "px", 600 + "px"]
                , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                , id: 'layer' + 'refundQuery' //防止重复弹出
                , content: '${pageContext.request.contextPath}/order/refund-query/' + oid + '.do?_='
                + timeLong
                , btn: ['关闭']
                , btnAlign: 'c' //按钮居中
                , shade: 0.5 //不显示遮罩
                , yes: function () {
                    layer.closeAll();
                }
            });
        });
    }

    function queryExpress(oid) {
        layui.use(['layer', 'jquery'], function () {
            var timeLong = +new Date();
            var layer = layui.layer;
            layer.open({
                type: 2
                ,
                title: '详情'
                ,
                area: [800 + "px", 600 + "px"]
                ,
                offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                ,
                id: 'layer' + 'query' //防止重复弹出
                ,
                content: '${pageContext.request.contextPath}/order/express-query/' + oid + '.do?_='
                + timeLong
                ,
                btn: ['关闭']
                ,
                btnAlign: 'c' //按钮居中
                ,
                shade: 0.5 //不显示遮罩
                ,
                yes: function () {
                    layer.closeAll();
                }
            });
        });
    }

    function review(oiid) {

        $("#reviewForm")[0].style.display = "block";

        $("#review-itemId").attr("value", oiid);
        layui.use(['layer', 'rate'], function () { //独立版的layer无需执行这一句
            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
            var rate = layui.rate;
            layer.open({
                type: 1,
                title: '商品评论',
                area: ['800px', '340px'],
                fixed: false, //不固定
                maxmin: false,
                shadeClose: true,
                content: $("#reviewForm"),
                cancel: function (index) {
                    layer.close(index);
                    $("#reviewForm")[0].style.display = "none";
                },
                end: function () {
                    $("#reviewForm")[0].style.display = "none";
                }
            });
            rate.render({
                elem: '.rating'
                , value: 1
                , text: true
                , half: true
                , choose: function (value) {
                    $("#review-rating").val(value);
                }
            });
        });
    }

    function reviewSubmit() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var content = $("#review-content").val();
        var itemId = $("#review-itemId").val();
        var rating = $("#review-rating").val();
        $.ajax({
            type: "post",
            url: contextPath + "/order/item/review/" + itemId + ".do",
            data: {
                content: content,
                rating: rating
            },
            dataType: "json",
            success: function (data) {
                if (data.status === 0) {
                    $("#review-btn")[0].className = "layui-btn a-reviewed layui-btn-disabled";
                    $("#review-btn")[0].innerText = "已评论";
                    parent.layer.closeAll();
                    layer.alert(data.msg, {icon: 6});
                } else {
                    layer.alert(data.msg, {icon: 6});

                }
            }, error: function (e) {
                layer.alert('服务出错了', {icon: 6});
            }

        })
    }

</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
<!-- END BODY -->
</html>