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
    <title>支付确认 | </title>

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

<div class="main" style="min-height: 400px;">

    <c:if test="${status == 0}">
        <c:if test="${not empty user}">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/view/shop-index.do">主页</a></li>
                    <li><a href="${pageContext.request.contextPath}/cartItem.do">购物车</a></li>
                    <li class="active">付款</li>
                </ul>
                <!-- BEGIN SIDEBAR & CONTENT -->
                <div class="row margin-bottom-40">
                    <!-- BEGIN CONTENT -->
                    <div class="col-md-12 col-sm-12">
                        <h1>付款</h1>
                        <!-- BEGIN CHECKOUT PAGE -->
                        <div class="panel-group checkout-page accordion scrollable"
                             id="checkout-page">

                            <!-- BEGIN PAYMENT ADDRESS -->
                            <div id="payment-address" class="panel panel-default">
                                <div class="panel-heading">
                                    <h2 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#checkout-page"
                                           href="#payment-address-content" class="accordion-toggle">
                                            第一：快递详情
                                        </a>
                                    </h2>
                                </div>
                                <div id="payment-address-content" class="panel-collapse collapse">
                                    <div class="panel-body row">
                                        <div class="col-md-6 col-sm-6">
                                            <h3>收货人信息</h3>
                                            <div class="form-group">
                                                <label for="name">收货人姓名
                                                    <span class="require">*</span>
                                                </label>
                                                <input name="name" type="text" id="name"
                                                       class="form-control" lay-verify="require"
                                                       autocomplete="no"
                                                <c:if test="${empty data.name}">
                                                       value="${user.name}"
                                                </c:if>
                                                <c:if test="${not empty data.name}">
                                                       value="${data.name}"
                                                </c:if>
                                                       autocomplete="name">
                                                <p class="help-block" id="name-msg"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="telephone">个人电话
                                                    <span class="require">*</span>
                                                </label>
                                                <input type="text" id="telephone"
                                                       lay-verify="require|telephone"
                                                       autocomplete="no"
                                                       name="telephone" class="form-control"
                                                <c:if test="${empty data.telephone}">
                                                       value="${user.telephone}"
                                                </c:if>
                                                <c:if test="${not empty data.telephone}">
                                                       value="${data.telephone}"
                                                </c:if>
                                                       autocomplete="tel">
                                                <p class="help-block" id="telephone-msg"></p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <h3>收货地址</h3>
                                            <div class="form-group">
                                                <label for="province-select">省份 <span
                                                        class="require"></span></label>
                                                <select name="province"
                                                        class="form-control input-sm"
                                                        id="province-select"
                                                        autocomplete="address-level1">
                                                </select>
                                                <p class="help-block" id="address-msg"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="urban-select">城区 <span
                                                        class="require"></span></label>
                                                <select name="urban" class="form-control input-sm"
                                                        id="urban-select"
                                                        autocomplete="address-level2">
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="address">具体位置 <span
                                                        class="require">*</span></label>
                                                <textarea name="address" id="address" rows="8"
                                                          style="resize:none" lay-verify="require"
                                                          autocomplete="no"
                                                          class="form-control"></textarea>
                                            </div>
                                        </div>

                                        <hr>
                                        <div class="col-md-12">
                                            <button class="btn btn-primary  pull-right"
                                                    type="submit"
                                                    data-toggle="collapse"
                                                    data-parent="#checkout-page"
                                                    data-target="#payment-method-content"
                                                    id="button-payment-address">继续
                                            </button>
                                            <div class="checkbox pull-right">
                                                <label>
                                                    <input id="check-privacy-policy"
                                                           lay-verify="require"
                                                           autocomplete="no"
                                                           type="checkbox">我已经阅读并同意
                                                    <a title="Privacy Policy" target="_blank"
                                                       href="${pageContext.request.contextPath}/view/shop-privacy-policy.do">
                                                        隐私政策
                                                    </a> &nbsp;&nbsp;&nbsp;
                                                    <p class="help-block" id="checked-msg-1"></p>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END PAYMENT ADDRESS -->

                            <!-- BEGIN PAYMENT METHOD -->
                            <div id="payment-method" class="panel panel-default">
                                <div class="panel-heading">
                                    <h2 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#checkout-page"
                                           href="#payment-method-content" class="accordion-toggle">
                                            第二：付款方式
                                        </a>
                                    </h2>
                                </div>
                                <div id="payment-method-content" class="panel-collapse collapse">
                                    <div class="panel-body row">
                                        <div class="col-md-12">
                                            <p>选择订单的付款方式.</p>
                                            <p class="help-block" id="pay-method-msg"></p>
                                            <div class="radio-list">
                                                <label>
                                                    <input id="pay-method-alipay" type="radio"
                                                           name="payMethod" lay-verify="require"
                                                           autocomplete="no"
                                                           value="alipay">支付宝
                                                </label>
                                                    <%--<label>--%>
                                                    <%--<input id="pay-method-bank" type="radio"--%>
                                                    <%--name="payMethod" lay-verify="require"--%>
                                                    <%--autocomplete="no"--%>
                                                    <%--value="bank">银行--%>
                                                    <%--</label>--%>
                                            </div>
                                            <button class="btn btn-primary  pull-right"
                                                    type="submit"
                                                    id="button-payment-method"
                                                    data-toggle="collapse"
                                                    data-parent="#checkout-page"
                                                    data-target="#confirm-content">继续
                                            </button>
                                            <div class="checkbox pull-right">
                                                <label>
                                                    <input id="check-terms-conditions"
                                                           lay-verify="require"
                                                           autocomplete="no"
                                                           type="checkbox"> 我已阅读并同意 <a
                                                        title="Terms & Conditions"
                                                        href="${pageContext.request.contextPath}/view/shop-terms-conditions-page.do">
                                                    条款与条件
                                                </a> &nbsp;&nbsp;&nbsp;
                                                    <p class="help-block" id="checked-msg-2"></p>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END PAYMENT METHOD -->

                            <!-- BEGIN CONFIRM -->
                            <div id="confirm" class="panel panel-default">
                                <div class="panel-heading">
                                    <h2 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#checkout-page"
                                           href="#confirm-content" class="accordion-toggle">
                                            第三：确认订单
                                        </a>
                                    </h2>
                                </div>
                                <div id="confirm-content" class="panel-collapse collapse">
                                    <div class="panel-body row">
                                        <div class="col-md-12 clearfix">
                                            <div class="table-wrapper-responsive">
                                                <table>

                                                    <tr>
                                                        <th class="goods-page-image">图像</th>
                                                        <th class="goods-page-description">描述</th>
                                                        <th class="goods-page-ref-no">编号</th>
                                                        <th class="goods-page-quantity">数量</th>
                                                        <th class="goods-page-price">单价</th>
                                                        <th class="goods-page-total" colspan="2">
                                                            总价
                                                        </th>
                                                    </tr>
                                                    <c:forEach varStatus="abc" items="${data.list}"
                                                               var="orderItem">
                                                        <tr>
                                                            <td class="goods-page-image">
                                                                <a href="javascript:;"><img
                                                                        src="${pageContext.request.contextPath}/v2/assets/pages/img/${orderItem.product.image}"
                                                                        alt="${orderItem.product.name}">
                                                                </a>
                                                            </td>
                                                            <td class="goods-page-description">
                                                                <h3>
                                                                    <a href="javascript:;">
                                                                            ${fn:substring(orderItem.product.name,0,9)}...
                                                                    </a>
                                                                </h3>
                                                                <p>
                                                                    <strong>${orderItem.count}</strong>
                                                                    - 颜色:
                                                                    绿色; 大小: S</p>
                                                                <em>
                                                                    <a href="${pageContext.request.contextPath}/product/one/${orderItem.product.pid}.do">
                                                                        更多信息
                                                                    </a>
                                                                </em>
                                                            </td>
                                                            <td class="goods-page-ref-no">
                                                                编号：${orderItem.product.pid}
                                                            </td>
                                                            <td class="goods-page-quantity">
                                                                <div>
                                                                    <input type="text"
                                                                           value="${orderItem.count}"
                                                                           readonly
                                                                           class="form-control input-sm">
                                                                </div>
                                                            </td>
                                                            <td class="goods-page-price">
                                                                <strong><span>￥</span>${orderItem.product.shopPrice}
                                                                </strong>
                                                            </td>
                                                            <td class="goods-page-total">
                                                                <strong><span>￥</span>${orderItem.subtotal}
                                                                </strong>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>


                                                </table>
                                            </div>


                                            <div class="checkout-total-block">
                                                <ul>
                                                    <li>
                                                        <em>小计</em>
                                                        <strong class="price"><span>￥</span>${data.total}
                                                        </strong>
                                                    </li>
                                                    <li>
                                                        <em>运费</em>
                                                        <strong class="price"><span>￥</span>0.00</strong>
                                                    </li>
                                                    <li class="shopping-total-price">
                                                        <em>合计</em>
                                                        <strong class="price"><span>￥</span>${data.total}
                                                        </strong>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                            <button class="btn btn-primary pull-right" type="submit"
                                                    id="pay-submit">
                                                确认订单
                                            </button>
                                            <button type="button"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/cartItem.do'"
                                                    class="btn btn-default pull-right margin-right-20">
                                                取消
                                            </button>
                                        </div>
                                    </div>
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
    </c:if>
    <c:if test="${status == 1}">
        <h2 align="center">${msg}</h2>
    </c:if>
</div>


<jsp:include page="../base/shop-bottom.jsp"/>
<script src="${pageContext.request.contextPath}/v2/custom/select.js?t=20180515"></script>
<script src="${pageContext.request.contextPath}/v2/custom/checkout.js?t=20180515"></script>

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

    var $name = $("#name");
    var $telephone = $("#telephone");
    var $address1 = $("#province-select");
    var $address2 = $("#urban-select");
    var $address3 = $("#address");
    var $checkPrivacyPolicy = $("#check-privacy-policy");
    var $checkTermsConditions = $("#check-terms-conditions");

    var $paySubmit = $("#pay-submit");

    var $nameMsg = $("#name-msg");
    var $telephoneMsg = $("#telephone-msg");
    var $addressMsg = $("#address-msg");
    var $checkPrivacyPolicyMsg = $("#checked-msg-1");
    var $checkTermsConditionsMsg = $("#checked-msg-2");
    var $payMethodMsg = $("#pay-method-msg");

    $paySubmit.click(function () {

        var $payMethod = $("input[name='payMethod']:checked");

        var mark1 = checkObj($name, $nameMsg);
        var mark2 = checkObj($telephone, $telephoneMsg);
        var address = checkAddress($address1, $address2, $address3, $addressMsg);
        var mark4 = isChecked($checkPrivacyPolicy, $checkPrivacyPolicyMsg);
        var mark5 = checkObj($payMethod, $payMethodMsg);
        var mark6 = isChecked($checkTermsConditions, $checkTermsConditionsMsg);

        if (mark1 && mark2 && mark4 && mark5 && mark6 && (address !== "")) {
            var token = getByAll(tokenSaveID);
            var json = {
                name: $name.val()
                , telephone: $telephone.val()
                , address: address
                , payMethod: $payMethod.val()
            }
            console.log(json)
            createOrder('${data.oid}', json, token);
        } else {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.open({
                    type: 1
                    , offset: 'confirm' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'layer' + 'confirm' //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + '信息不完全，请检查' + '</div>'
                    , btn: '关闭'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0.5 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            });
        }
    });

    provinceSelectInit($address1, $address2, $address3, '${data.address}');

</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>