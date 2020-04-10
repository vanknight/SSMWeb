<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/19 13:39
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>分类列表</title>
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

<table class="layui-table" id="parse-table-init" lay-filter="parse-table-category"
       style="display: none;">
    <button id="add-category" class="layui-btn layui-btn-sm"><i class="layui-icon"></i></button>
    <thead>
    <tr>
        <th lay-data="{field:'cid', minWidth:120,sort:true}">分类ID</th>
        <th lay-data="{field:'cname', minWidth:120,sort:true}">分类名字</th>
        <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barTool'}">单项操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${status == 0}">
        <c:forEach items="${data}" var="category">
            <tr>
                <td>${category.cid}</td>
                <td>${category.cname}</td>
            </tr>

        </c:forEach>
    </c:if>
    </tbody>
</table>

<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/v2/custom/login.js" charset="utf-8"></script>


<script type="text/html" id="barTool">
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-sm" lay-event="edit" data-type="edit"
                data-method="notice"><i class="layui-icon"></i></button>
        <button class="layui-btn layui-btn-sm" lay-event="delete" data-type="delete"
                data-method="notice"><i class="layui-icon"></i></button>
    </div>
</script>

<script>
    layui.use(['table', 'layer', 'jquery'], function () {
        var table = layui.table,
            $ = layui.$,
            layer = layui.layer;
        var addButton = $("#add-category");

        layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
        var tableInitJson = {
            height: 'full-100',
            page: true,
            id: 'id',
            done: function () {
                layer.closeAll('loading');
            }
        }

        table.init('parse-table-category', tableInitJson);

        table.on('tool(parse-table-category)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                var type = obj.type;
                var timeLong = +new Date();
                layer.open({
                    type: 2
                    ,
                    area: [window.parent.formWidth, window.parent.formHeight]
                    ,
                    offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,
                    id: 'layer' + type //防止重复弹出
                    ,
                    content: '${pageContext.request.contextPath}/admin/categories/' + data.cid
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
                        deleteCategory(data.cid);
                    }
                    , btn2: function () {
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
                , content: '${pageContext.request.contextPath}/admin/categories/.do?_=' + timeLong
                , btn: ['关闭']
                , btnAlign: 'c' //按钮居中
                , shade: 0.5 //不显示遮罩
                , yes: function () {
                    layer.closeAll();
                    window.location.reload(true);
                }
            });
        });

        function deleteCategory(cid) {
            $.ajax({
                type: "DELETE"
                , url: "${pageContext.request.contextPath}/admin/categories/" + cid + ".do"
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