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
    <title>注册会员 | </title>

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

<div class="main">
    <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40" style="margin-left: 15%;">

            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-9">
                <h1>注册</h1>
                <div class="content-form-page">
                    <div class="form-horizontal form-without-legend">
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="username">
                                用户名 <span class="require">*</span></label>
                            <div class="col-lg-8">
                                <input type="text" id="username"
                                       class="form-control" value="">
                                <p class="help-block" id="username-msg">用户名长度要大于3且小于12.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="password">
                                密码 <span class="require">*</span></label>
                            <div class="col-lg-8">
                                <input type="password" id="password"
                                       class="form-control" value="">
                                <p class="help-block" id="password-msg">密码要大于5且小于19.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="password-2">
                                确认密码 <span class="require">*</span></label>
                            <div class="col-lg-8">
                                <input type="password" id="password-2"
                                       class="form-control" value="">
                                <p class="help-block" id="password-2-msg">用于登陆.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="name">
                                姓名 <span class="require"></span></label>
                            <div class="col-lg-8">
                                <input type="text" id="name"
                                       class="form-control" value="">
                                <p class="help-block" id="name-msg">名字长度要大于且小于18.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="email">
                                电子邮箱 <span class="require">*</span></label>
                            <div class="col-lg-8">
                                <input type="text" id="email"
                                       class="form-control" value="">
                                <p class="help-block" id="email-msg">用于激活账号.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="birthday">
                                生日 <span class="require"></span></label>
                            <div class="col-lg-8">
                                <input type="date" id="birthday"
                                       class="form-control" value="">
                                <p class="help-block" id="birthday-msg"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="telephone">
                                电话号码 <span class="require"></span></label>
                            <div class="col-lg-8">
                                <input type="text" id="telephone"
                                       class="form-control" value="">
                                <p class="help-block" id="telephone-msg">用于联系您.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="sex-1">
                                性别 <span class="require"></span>
                            </label>
                            <div class="col-md-12 col-lg-8">
                                <div class="radio-list">
                                    <label class="col-sm-6">
                                        <input type="radio" id="sex-0" name="sex"
                                               value="0">
                                        <span style="display:inline-block;vertical-align:middle;">
                                            男
                                        </span>
                                    </label>
                                    <label class="col-sm-6">
                                        <input type="radio" id="sex-1" name="sex"
                                               value="1">
                                        <span style="display:inline-block;vertical-align:middle;">
                                            女
                                        </span>
                                    </label>
                                </div>
                                <p class="help-block" id="sex-msg">确认你的性别.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="sex-1">
                                <span class="require"></span>
                            </label>
                            <div class="col-md-12 col-lg-8">
                                <button class="btn btn-primary" id="register-submit" type="submit">
                                    注册
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

<jsp:include page="../base/shop-bottom.jsp"/>
<script src="${pageContext.request.contextPath}/v2/custom/register.js?t=7979845112"
        type="text/javascript"></script>

<script>
    var $username = $("#username");
    var $password = $("#password");
    var $password2 = $("#password-2");
    var $name = $("#name");
    var $telephone = $("#telephone");
    var $email = $("#email");
    var $birthday = $("#birthday");
    var $woman = $("#sex-1");

    var $usernameMsg = $("#username-msg");
    var $passwordMsg = $("#password-msg");
    var $password2Msg = $("#password-2-msg");
    var $nameMsg = $("#name-msg");
    var $telephoneMsg = $("#telephone-msg");
    var $emailMsg = $("#email-msg");
    var $sexMsg = $("#sex-msg");
    var $msg = $("#msg");

    var $submit = $("#register-submit");
</script>
<script type="text/javascript">
    $submit.click(function () {
        var sex = "";
        var b1 = checkUserName($username, $usernameMsg);
        var b5 = checkEmail($email, $emailMsg);
        var b2 = checkPassword($password, $passwordMsg);
        var b3 = checkPasswordEqual($password, $password2, $password2Msg);
        var b4 = checkName($name, $nameMsg);
        if ($woman[0].checked) {
            sex = "女";
        } else {
            sex = "男";
        }

        if (b1 && b2 && b3 && b4 && b5) {
            registerFunction($username, $password, $name, $email, $telephone, $birthday, sex, $msg);
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