<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/5/18 14:43
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>订单详情 |</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css">
</head>
<body>
<div style="padding: 10px;text-align: center;">
    <c:if test="${status == 0}">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">订单ID</label>
                <div class="layui-input-block">
                    <input type="text" name="oid" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.oid}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">交易号</label>
                <div class="layui-input-block">
                    <input type="text" name="alipayOid" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.alipayOid}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">订单金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="totalAmount" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.totalAmount}">
                </div>
                <label class="layui-form-label">退款金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="refundAmount" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.refundAmount}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">退款理由</label>
                <div class="layui-input-inline">
                <textarea name="refundReason" placeholder=""
                          style="resize:none" readonly
                          class="layui-textarea">${data.refundReason}</textarea>
                </div>
            </div>
        </form>
    </c:if>
    <c:if test="${status == 1}">
        <h2 align="center">${msg}</h2>
    </c:if>
</div>
</body>
<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js?t=20180511"
        charset="UTF-8"></script>
<script>
    layui.use(['form', 'laydate', 'upload'], function () {
        var form = layui.form
            , laydate = layui.laydate
            , layer = layui.layer
            , $ = layui.$
            , upload = layui.upload;

        //日期
        laydate.render({
            elem: '#date'
        });
    });


</script>
</html>
