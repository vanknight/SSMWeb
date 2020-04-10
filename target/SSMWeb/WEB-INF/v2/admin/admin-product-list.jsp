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
    <title>商品列表</title>
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

<table class="layui-table" id="parse-table-init" lay-filter="parse-table-product"
       style="display: none;">
    <button id="add-product" class="layui-btn layui-btn-sm"><i class="layui-icon"></i></button>
    <thead>
    <tr>
        <th lay-data="{field:'pid', width:120,align:'center',sort:true}">商品ID</th>
        <th lay-data="{field:'name', minWidth:100,align:'center',sort:true}">商品名</th>
        <th lay-data="{field:'marketPrice', minWidth:120,align:'center',sort:true}">市场价</th>
        <th lay-data="{field:'shopPrice', minWidth:120,align:'center',sort:true}">商城价</th>
        <th lay-data="{field:'image',minWidth:120,align:'center',event:'see-image', style:'cursor: pointer;'}">
            商品图片
        </th>
        <th lay-data="{field:'date', minWidth:120,align:'center',sort:true}">上架日期</th>
        <th lay-data="{field:'isHot', width:100,align:'center',sort:true}">是否热品</th>
        <th lay-data="{field:'desc', minWidth:120,align:'center'}">商品描述</th>
        <th lay-data="{field:'stock', minWidth:80,align:'center',sort:true}">库存</th>
        <th lay-data="{field:'state', minWidth:30,align:'center',sort:true}">状态</th>
        <th lay-data="{field:'cid', width:100,align:'center',sort:true}">分类ID</th>
        <th lay-data="{fixed:'right', minWidth:120, align:'center', toolbar: '#barTool'}">单项操作</th>

    </tr>
    </thead>
    <tbody>
    <c:if test="${status == 0}">
        <c:forEach items="${data}" var="product">
            <tr>
                <td>${product.pid}</td>
                <td>${product.name}</td>
                <td>${product.marketPrice}</td>
                <td>${product.shopPrice}</td>
                <td>${product.image}</td>
                <td>${product.date}</td>
                <td>${product.isHot}</td>
                <td>${product.desc}</td>
                <td>${product.stock}</td>
                <td>${product.state}</td>
                <td>${product.cid}</td>
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
        <button class="layui-btn layui-btn-sm" lay-event="edit" data-type="edit"
                data-method="notice"><i class="layui-icon"></i></button>
        <%--<button class="layui-btn layui-btn-sm" lay-event="delete" data-type="delete"--%>
        <%--data-method="notice"><i class="layui-icon"></i></button>--%>
    </div>
</script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script charset="UTF-8">
    layui.use(['table', 'layer', 'jquery'], function () {
        var table = layui.table,
            $ = layui.$,
            layer = layui.layer;
        var addButton = $("#add-product");

        layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
        var tableInitJson = {
            height: 'full-100',
            page: true,
            limit:100,
            id: 'id',
            done: function () {
                layer.closeAll('loading');
            }
        };

        table.init('parse-table-product', tableInitJson);

        table.on('tool(parse-table-product)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                var type = obj.type;
                var timeLong = +new Date();
                layer.open({
                    type: 2
                    , area: [window.parent.formWidth, window.parent.formHeight]
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

            } else if (obj.event === 'see-image') {
                console.log("see-image");

                layer.open({
                    type: 1
                    ,
                    area: ['400px', '600px']
                    ,
                    offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,
                    id: 'layer' + type //防止重复弹出
                    ,
                    content: '<img id="img-auto" src="${pageContext.request.contextPath}/v2/assets/pages/img/'
                    + data.image + '">'
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

        addButton.click(function () {
            var timeLong = +new Date();
            layer.open({
                type: 2
                , area: [window.parent.formWidth, window.parent.formHeight]
                , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                , id: 'layer' + 'add' //防止重复弹出
                , content: '${pageContext.request.contextPath}/admin/products/.do?_=' + timeLong
                , btn: ['关闭']
                , btnAlign: 'c' //按钮居中
                , shade: 0.5 //不显示遮罩
                , yes: function () {
                    layer.closeAll();
                    window.location.reload(true);
                }
            });
        });

    });


</script>

</body>
</html>