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
                <label class="layui-form-label">买家ID</label>
                <div class="layui-input-inline">
                    <input type="text" name="buyerUserID" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.buyerUserID}">
                </div>
                <label class="layui-form-label">买家账号</label>
                <div class="layui-input-inline">
                    <input type="text" name="buyerLoginID" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.buyerLoginID}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订单金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="totalAmount" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.totalAmount}">
                </div>
                <label class="layui-form-label">支付时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="sendPayDate" id="date" lay-verify="require"
                           placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" readonly
                           class="layui-input" value="${data.sendPayDate}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">发票金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="invoiceAmount" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.invoiceAmount}">
                </div>
                <label class="layui-form-label">积分折扣</label>
                <div class="layui-input-inline">
                    <input type="text" name="pointAmount" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.pointAmount}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">卖家收款</label>
                <div class="layui-input-inline">
                    <input type="text" name="receiptAmount" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.receiptAmount}">
                </div>
                <label class="layui-form-label">买家支付</label>
                <div class="layui-input-inline">
                    <input type="text" name="buyerPayAmount" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.buyerPayAmount}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订单状态</label>
                <div class="layui-input-inline">
                    <input type="text" name="tradeStatus" lay-verify="require"
                           autocomplete="off" placeholder="" readonly
                           class="layui-input" value="${data.tradeStatus}">
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
            elem: '#date',
            type:"datatime"
        });
    });


</script>
</html>
