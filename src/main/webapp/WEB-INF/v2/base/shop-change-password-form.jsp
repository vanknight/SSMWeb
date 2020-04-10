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
<style>
    .msg-error {
        color: red !important;
    }
</style>
<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>重置密码 | </title>

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

<div style="min-height: 600px">
    <div class="main">
        <div class="container">
            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40" style="margin-left: 15%;">

                <!-- BEGIN CONTENT -->
                <div class="col-md-9 col-sm-9">
                    <h1>密码</h1>
                    <div class="content-form-page">
                        <div class="form-horizontal form-without-legend">
                            <input type="hidden" id="enCode" name="enCode"
                                   class="form-control" value="${enCode}">
                            <div class="form-group">
                                <label class="col-lg-2 control-label" for="password">
                                    密码 <span class="require">*</span></label>
                                <div class="col-lg-8">
                                    <input type="password" id="password"
                                           class="form-control" value="">
                                    <p class="help-block" id="password-msg">重置的密码.</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label" for="password-2">
                                    确认密码 <span class="require">*</span></label>
                                <div class="col-lg-8">
                                    <input type="password" id="password-2"
                                           class="form-control" value="">
                                    <p class="help-block" id="password-2-msg">用于验证密码.</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label" for="enCode">
                                    <span class="require"></span>
                                </label>
                                <div class="col-md-12 col-lg-8">
                                    <button class="btn btn-primary" id="change-password-submit"
                                            type="submit">
                                        重置
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>

<jsp:include page="shop-bottom.jsp"/>
<script src="${pageContext.request.contextPath}/v2/custom/register.js?t=20180601"
        type="text/javascript" charset="UTF-8"></script>

<script>
    var $enCode = $("#enCode");
    var $password = $("#password");
    var $password2 = $("#password-2");

    var $passwordMsg = $("#password-msg");
    var $password2Msg = $("#password-2-msg");

    var $submit = $("#change-password-submit");
</script>
<script type="text/javascript">
    $submit.click(function () {
        var b0 = checkPassword($password, $passwordMsg);
        var b = checkPasswordEqual($password, $password2, $password2Msg);

        if (b0 && b) {
            changePasswordFunction($enCode, $password);
        } else {
            layui.use('table', function () {
                var layer = layui.layer;
                layer.open({
                    type: 1
                    , offset: 'confirm' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'layer' + 'confirm' //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + '填写信息有误，请检查' + '</div>'
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

    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>