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
    <title>订单项列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css"
          media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<style>
    #img-auto {
        width: calc(100% - 30px);
        margin: 10px auto;
        border: 5px solid #a0a0a0;
        display: block;
    }
</style>
<body>
<div style="width:90%;height:100%;margin: 0 auto;">
    <table class="layui-table" id="parse-table-init" lay-filter="parse-table-order-item"
           style="display: none;">
        <thead>
        <tr>
            <th lay-data="{field:'itemid', minWidth:60,align:'center',sort:true}">订单项ID</th>
            <th lay-data="{field:'pid', minWidth:120,align:'center',sort:true,event:'see-product', style:'cursor: pointer;'}">
                商品ID(点击查看）
            </th>
            <th lay-data="{field:'count', width:80,align:'center',sort:true}">数量</th>
            <th lay-data="{field:'subtotal', width:80,align:'center',sort:true}">小计</th>
            <th lay-data="{field:'oid',minWidth:60,align:'center'}">所属订单ID</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${status == 0}">
            <c:forEach items="${data}" var="orderItem">
                <tr>
                    <td>${orderItem.itemId}</td>
                    <td>${orderItem.pid}</td>
                    <td>${orderItem.count}</td>
                    <td>${orderItem.subtotal}</td>
                    <td>${orderItem.oid}</td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js?t=20180511"
        charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/v2/custom/login.js?t=20180511"
        charset="UTF-8"></script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script charset="UTF-8">
    layui.use(['table', 'layer', 'jquery'], function () {
        var table = layui.table,
            $ = layui.$,
            layer = layui.layer;
        var layerP = parent.layer;

        layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
        var tableInitJson = {
            height: 'full-100',
            page: true,
            id: 'id',
            done: function () {
                layer.closeAll('loading');
            }
        };

        table.init('parse-table-order-item', tableInitJson);

        table.on('tool(parse-table-order-item)', function (obj) {
            var data = obj.data;
            if (obj.event === 'see-product') {
                console.log('查看商品详情');
                var timeLong = +new Date();
                var type = obj.type;
                layer.open({
                    type: 2
                    , area: ['800px', '600px']
                    , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'layer' + type //防止重复弹出
                    , content: '${pageContext.request.contextPath}/admin/products/' + data.pid
                    + '.do?_=' + timeLong
                    , btn: ['关闭']
                    , btnAlign: 'c' //按钮居中
                    , shade: 0.5 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                        window.location.reload(true);
                    }
                });

            }
        });
    });


</script>

</body>
</html>