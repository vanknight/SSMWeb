<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/19 13:39
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>会员登录</title>
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/v2/assets/pages/css/login-style.css"
          rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="会员登录"/>
    <!--Google Fonts-->
    <!--<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    --><!--Google Fonts-->
</head>
<style>
    a.color-white{
        text-decoration: none;
        color: #fff9ec!important;
    }
    a:hover{
        color: #93D1FF!important;
    }
</style>
<body
    style="background: url(${pageContext.request.contextPath}/v2/assets/pages/img/login-img/bbb.jpg)no-repeat;">
<jsp:include page="../base/shop-header.jsp"/>


<div class="main">
    <!--header start here-->
    <div class="login-form">
        <div class="top-login">
				<span>
					<img
                        src="${pageContext.request.contextPath}/v2/assets/pages/img/login-img/group.png"
                        alt=""/>
				</span>
        </div>
        <span class="animate-line" style="width: 600px;display: block;margin: 20px auto;">
            <hr>
            </span>
        <h2 align="center" style="margin: 0px auto;font-size: 2em; color: #fff;">登陆</h2>
        <h4 align="center" id="msg"></h4>
        <div class="login-top">

            <input type="hidden" name="randomValue" id="random-value"
                   value="${random_key}">

            <div class="login-ic">
                <i style="background: url(${pageContext.request.contextPath}/v2/assets/pages/img/login-img/m.png)no-repeat 6px 6px;"></i>
                <input id="username" type="text" placeholder="用户名"/>
                <div class="clear"></div>
            </div>
            <div class="login-ic">
                <i class="icon"
                   style="background: url(${pageContext.request.contextPath}/v2/assets/pages/img/login-img/l.png)no-repeat 6px 6px;"></i>
                <input id="password" type="password" placeholder="密码"/>
                <div class="clear"></div>
            </div>
            <div id="vercode-dom" class="login-ic">
                <%--<i class="icon" style="background: url(${pageContext.request.contextPath}/v2/assets/pages/img/login-img/l.png)no-repeat 6px 6px;"></i>--%>
                <img id="vercode-img" src="" alt="" height="38px"
                     style="float: left;display: inline-block">
                <input id="vercode" type="text" placeholder="验证码"/>
                <div class="clear"></div>
            </div>
            <div class="login-ic">
                <label class="label-checkbox">
                    <input class="input-checkbox" type="checkbox" id="autoLogin" name="">
                    <span class="span-checkbox"></span>
                </label>
                <label for="autoLogin" class="label-text">记住我</label>
                <div class="clear"></div>
            </div>
            <div class="login-ic" style="background:transparent;">
                <div style="height: 100%;text-align: center;margin-right: 0px;
                   line-height: 100%;">
                    <a class="color-white" href="${pageContext.request.contextPath}/view/forget-password.do">忘记密码?</a>
                </div>
            </div>

            <div class="log-bwn">
                <input id="login-submit" type="submit" value="Login">
            </div>
        </div>
    </div>
    <!--header start here-->
</div>

<jsp:include page="../base/shop-bottom.jsp"/>
</body>
<script>
    var submit = $("#login-submit");
    var random_value = $("#random-value");
    var username = $("#username");
    var password = $("#password");
    var code = $("#vercode");
    var code_dom = $("#vercode-dom");
    var code_img = $("#vercode-img");
    var autoLogin = $("#autoLogin");
    var msg = $("#msg");
</script>

<script>
    $(submit).click(function () {
        //判断验证码存在与否
        if ($(code_dom).css("display") === "none") {
            loginFunction(username, password, random_value,
                $(autoLogin)[0], code_dom, code_img, msg)
        } else {
            //存在则验证验证码
            if (checkRegCode(code)) {
                loginFunction(username, password, random_value,
                    $(autoLogin)[0], code_dom, code_img, msg)
            } else {
                $(msg).html("验证码不正确");
                //更改验证码图片
                getVerCodeImage(code_img);
            }
        }
    });

    $(code_img).click(function () {
        getVerCodeImage(code_img);
    });

    $(function () {
        $(code_dom).hide();
        if (localStorage.getItem(loginCountID) !== null &&
            localStorage.getItem(loginCountID) > 2) {
            $(code_dom).show();
            getVerCodeImage(code_img);
        }

        if (window.localStorage.getItem(usernameSaveID) !== null) {
            username.val(window.localStorage.getItem(usernameSaveID));
        }

        if (getByAll(loginStateSaveID) === true ||
            getByAll(loginStateSaveID) === "true") {
            window.location.href = contextPath;
        }
    })

</script>
</html>