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
    <title>订单列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css"
          media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<style>
    #img-auto {
        height: calc(100% - 30px);
        margin: 10px auto;
        border: 5px solid #a0a0a0;
        display: block;
    }
</style>
<body>

<table class="layui-table" id="parse-table-init" lay-filter="parse-table-orders"
       style="display: none;">
    <thead>
    <tr>
        <th lay-data="{field:'oid', minWidth:50,align:'center',sort:true}">订单ID</th>
        <th lay-data="{field:'orderTime', minWidth:90,align:'center',sort:true}">修改时间</th>
        <th lay-data="{field:'total', width:80,align:'center',sort:true}">金额</th>
        <th lay-data="{field:'name', width:80,align:'center',sort:true}">收货人姓名</th>
        <th lay-data="{field:'telephone', minWidth:50,align:'center'}">收货人电话</th>
        <th lay-data="{field:'address', minWidth:50,align:'center'}">发货地址</th>
        <th lay-data="{field:'uid', width:90,align:'center',sort:true}">买家ID</th>
        <th lay-data="{field:'oid',minWidth:120,align:'center',event:'see-order-item-list', style:'cursor: pointer;'}">
            订单项(点击查看)
        </th>
        <th lay-data="{field:'state', minWidth:50,align:'center',sort:true}">状态</th>
        <th lay-data="{fixed:'right', minWidth:100, align:'center', toolbar: '#barTool'}"></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${status == 0}">
        <c:forEach items="${data}" var="order">
            <tr>
                <td>${order.oid}</td>
                <td>${order.orderTime}</td>
                <td>${order.total}</td>
                <td>${order.name}</td>
                <td>${order.telephone}</td>
                <td>${order.address}</td>
                <td>${order.uid}</td>
                <td>${order.oid}</td>
                <td>${order.state}</td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<h2 id="test-html"></h2>

<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js?t=20180511"
        charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/v2/custom/login.js?t=20180511"
        charset="UTF-8"></script>
<script type="text/html" id="barTool">
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-sm" lay-event="edit"
                data-type="edit"><i class="layui-icon"></i>
        </button>
        <button class="layui-btn layui-btn-sm" lay-event="delete"
                data-type="delete"><i class="layui-icon"></i>
        </button>
        <button class="layui-btn layui-btn-sm" lay-event="see-order-express"
                data-type="see-order-item-list"><i class="layui-icon layui-icon-release"> </i>
        </button>
    </div>
</script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script charset="UTF-8">
    layui.use(['table', 'layer', 'jquery'], function () {
        var table = layui.table,
            $ = layui.$,
            layer = layui.layer;

        layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
        var tableInitJson = {
            height: 'full-100',
            page: true,
            id: 'id',
            done: function () {
                layer.closeAll('loading');
            }
        }

        table.init('parse-table-orders', tableInitJson);

        table.on('tool(parse-table-orders)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                var type = obj.type;
                var timeLong = +new Date();
                layer.open({
                    type: 2
                    , area: [window.parent.formWidth, window.parent.formHeight]
                    , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'layer' + type //防止重复弹出
                    , content: '${pageContext.request.contextPath}/admin/orders/' + data.oid
                    + '.do?_=' + timeLong
                    , btn: ['关闭']
                    , btnAlign: 'c' //按钮居中
                    , shade: 0.5 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                        window.location.reload(true);
                    }
                });

            } else if (obj.event === 'delete') {
                var type = obj.type;
                var timeLong = +new Date();
                layer.open({
                    type: 1
                    , offset: 'confirm' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'layer' + 'confirm' //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + '确认删除?' + '</div>'
                    , btn: ['确认', '关闭']
                    , btnAlign: 'c' //按钮居中
                    , shade: 0.5 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                        deleteOrder(data.oid);
                    }
                    , btn2: function () {
                        layer.closeAll();
                    }
                });

            } else if (obj.event === 'see-order-item-list') {
                layer.open({
                    type: 2
                    ,
                    area: ['900px', '700px']
                    ,
                    offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,
                    id: 'layer' + type //防止重复弹出
                    ,
                    content: '${pageContext.request.contextPath}/admin/orders/item/' + data.oid
                    + '.do?_=' + timeLong
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
            } else if (obj.event === 'see-order-express') {
                layer.open({
                    type: 2
                    ,
                    area: ['800px', '600px']
                    ,
                    offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,
                    id: 'layer' + type //防止重复弹出
                    ,
                    content: '${pageContext.request.contextPath}/admin/express/' + data.oid
                    + '.do?_=' + timeLong
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
            }
        });

        function deleteOrder(oid) {
            $.ajax({
                type: "DELETE"
                , url: "${pageContext.request.contextPath}/admin/orders/" + oid + ".do"
                , data: {}
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