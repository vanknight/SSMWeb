<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/12/19 12:06
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>商品详情设置</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css">
    <%--<script src="${pageContext.request.contextPath}/v2/assets/"></script>--%>
</head>
<body>

<hr>
<c:if test="${status == 0}">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">详情ID</label>
            <div class="layui-input-inline">
                <input type="text" name="id" lay-verify="require"
                       autocomplete="off" placeholder="请输入详情ID"
                <c:if test="${not empty data.id}">
                       readonly
                </c:if>
                       class="layui-input" value="${data.id}">
            </div>
            <label class="layui-form-label">商品ID</label>
            <div class="layui-input-inline">
                <input type="text" name="pid" lay-verify="require"
                       autocomplete="off" placeholder="请输入商品ID"
                       class="layui-input" value="${data.pid}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">详情ID</label>
            <div class="layui-input-inline">
                <input type="text" name="images" lay-verify="require" id="imagesInput"
                       autocomplete="off" placeholder="请输入商品详情图片路径"
                <c:if test="${not empty data.images}">
                       readonly
                </c:if>
                       class="layui-input" value="${data.images}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上传多图</label>
            <div class="layui-input-block">
                <div class="layui-upload">
                    <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
                    <div class="layui-upload-list">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>文件名</th>
                                <th>大小</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="demoList"></tbody>
                        </table>
                    </div>
                    <button type="button" class="layui-btn" id="testListAction">开始上传</button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="update-submit">立即提交</button>
            </div>
        </div>

    </form>
</c:if>

<c:if test="${status == 1}">
    <h2 align="center">${msg}</h2>
</c:if>
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

        //监听提交
        form.on('submit(update-submit)', function (data) {
            updateProductDetails(data.field, layer);
            return false;
        });

        function updateProductDetails(json, layer) {
            console.log(json)
            $.ajax({
                type: "PUT"
                , url: "${pageContext.request.contextPath}/admin/product-details/" + json.id + ".do"
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


        var demoListView = $('#demoList'),
            imagesInput = $('#imagesInput')
            , uploadListIns = upload.render({
                elem: '#testList'
                , url: '${pageContext.request.contextPath}/admin/product-details/upload-img.do'
                , accept: 'file'
                , multiple: true
                , auto: false
                , bindAction: '#testListAction'
                , choose: function (obj) {
                    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                    //读取本地文件
                    obj.preview(function (index, file, result) {
                        var tr = $(['<tr id="upload-' + index + '">'
                            , '<td>' + file.name + '</td>'
                            , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                            , '<td>等待上传</td>'
                            , '<td>'
                            , '<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                            , '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                            , '</td>'
                            , '</tr>'].join(''));

                        //单个重传
                        tr.find('.demo-reload').on('click', function () {
                            obj.upload(index, file);
                        });

                        //删除
                        tr.find('.demo-delete').on('click', function () {
                            delete files[index]; //删除对应的文件
                            tr.remove();
                            uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                        });

                        demoListView.append(tr);
                    });
                    imagesInput.val("");
                }
                , done: function (res, index, upload) {
                    if (res.status === 0) { //上传成功
                        var tr = demoListView.find('tr#upload-' + index)
                            , tds = tr.children();
                        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                        tds.eq(3).html(''); //清空操作
                        var reInput = imagesInput.val();
                        imagesInput.val(reInput + res.data);
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    }
                    this.error(index, upload);
                }
                , error: function (index, upload) {
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
                }
            });
    });
</script>
</html>
