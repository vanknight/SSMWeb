<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/19 13:39
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css">
</head>
<style>
    #img-auto {
        width: calc(100% - 30px);
        margin: 10px auto;
        border: 5px solid #a0a0a0;
        display: block;
    }
</style>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/view/index.do">返回主页</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void (0);">未实现</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">

                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath}/admin/users.do"
                        target="vk-frame">用户列表</a></li>
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath}/admin/products.do"
                        target="vk-frame">商品列表</a></li>
                <li class="layui-nav-item"><a
                    href="${pageContext.request.contextPath}/admin/product-details.do"
                    target="vk-frame">商品详情</a></li>
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath}/admin/categories.do"
                        target="vk-frame">分类列表</a></li>
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath}/admin/orders.do"
                        target="vk-frame">订单管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 0px 15px;height:100%;margin:0px;overflow:hidden;">

            <iframe id="option" name="vk-frame" src=""
                    style="overflow: hidden;" scrolling="no" frameborder="no"
                    width="100%" height="100%"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © xxx.com - 品牌力量
    </div>
</div>
<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js?t=20180511"
        charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/v2/custom/admin-constants.js?t=78321345311"
        charset="utf-8"></script>
<script charset="UTF-8">
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>