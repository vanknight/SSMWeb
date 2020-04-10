<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/5/18 14:25
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>快递详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css"
          media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<style>
    body {
        font-size: 12px;
    }

    ul li {
        list-style: none;
    }

    .track-rcol {
        width: 900px;
        border: 1px solid #eee;
    }

    .track-list {
        margin: 20px;
        padding-left: 5px;
        position: relative;
    }

    .track-list li {
        position: relative;
        padding: 9px 0 0 25px;
        line-height: 18px;
        border-left: 1px solid #d9d9d9;
        color: #999;
    }

    .track-list li.first {
        color: red;
        padding-top: 0;
        border-left-color: #fff;
    }

    .track-list li .node-icon {
        position: absolute;
        left: -6px;
        top: 50%;
        width: 11px;
        height: 11px;
        /*background: url(http://demo.daimabiji.com/3531/img/order-icons.png) -21px -72px no-repeat;*/
    }

    .track-list li.first .node-icon {
        background-position: 0 -72px;
    }

    .track-list li .time {
        margin-right: 20px;
        position: relative;
        top: 4px;
        display: inline-block;
        vertical-align: middle;
    }

    .track-list li .txt {
        max-width: 600px;
        position: relative;
        top: 4px;
        display: inline-block;
        vertical-align: middle;
    }

    .track-list li.first .time {
        margin-right: 20px;
    }

    .track-list li.first .txt {
        max-width: 600px;
    }
</style>
<body>
<div class="track-rcol" style="width:90%;margin: 10px auto;">
    <c:if test="${status == 1}">
        <h2 align="center">${msg}</h2>
    </c:if>
    <c:if test="${status == 0}">
        <div class="track-list">
            <ul>
                <c:forEach var="traces" items="${logistics.traces}" varStatus="abc">
                    <li class="first">
                        <i class="node-icon"></i>
                        <span class="time">${traces.acceptTime2}</span>
                        <span class="txt">${traces.acceptStation}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">订单ID</label>
            <div class="layui-input-inline">
                <input type="text" name="oid" lay-verify="require"
                       autocomplete="off" placeholder="请输入订单ID"
                <c:if test="${not empty express.oid}">
                       readonly
                </c:if>
                       class="layui-input" value="${express.oid}">
            </div>
            <label class="layui-form-label">物流ID</label>
            <div class="layui-input-inline">
                <input type="text" name="eid" lay-verify="require"
                       autocomplete="off" placeholder="请输入物流ID"
                       readonly
                       class="layui-input" value="${express.eid}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">快递代号</label>
            <div class="layui-input-inline">
                <input type="text" name="shipperCode" lay-verify="require"
                       autocomplete="off" placeholder="请输入快递公司代号"
                       class="layui-input" value="${express.shipperCode}">
            </div>
            <label class="layui-form-label">快递运单号</label>
            <div class="layui-input-inline">
                <input type="text" name="logisticCode" lay-verify="require"
                       autocomplete="off" placeholder="请输入快递运单号"
                       class="layui-input" value="${express.logisticCode}">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="update-submit">立即提交</button>
            </div>
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js"
        charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'laydate', 'layer'], function () {
        var form = layui.form
            , laydate = layui.laydate
            , layer = layui.layer
            , $ = layui.$;

        //日期
        laydate.render({
            elem: '#date'
        });

        //监听提交
        form.on('submit(update-submit)', function (data) {
            insertExpress(data.field, layer);
            return false;
        });

        function insertExpress(json, layer) {
            console.log(json);
            $.ajax({
                type: "PUT"
                , url: "${pageContext.request.contextPath}/admin/express/" + json.oid + ".do"
                , data: JSON.stringify(json)
                , dataType: "json"
                , contentType: 'application/json;charset=UTF-8'
                , async: true
                , success: function (data) {
                    layer.open({
                        type: 1
                        , area: ['250px', '200px']
                        , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        , id: 'layerMsg' + data.status //防止重复弹出
                        , content: "<hr><h2 align=\"center\">" + data.msg + "</h2>"
                        , btn: ['关闭']
                        , btnAlign: 'c' //按钮居中
                        , shade: 0.5 //不显示遮罩
                        , yes: function () {
                            layer.closeAll();
                            window.location.reload(true);
                        }
                    });
                }

            })
        }
    });


</script>

</body>
</html>
