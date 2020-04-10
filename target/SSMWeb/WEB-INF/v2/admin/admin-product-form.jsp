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
    <title>用户修改</title>
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

<hr>
<c:if test="${status == 0}">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">商品ID</label>
            <div class="layui-input-inline">
                <input type="text" name="pid" lay-verify="require"
                       autocomplete="off" placeholder="请输入商品ID"
                <c:if test="${not empty data.pid}">
                       readonly
                </c:if>
                       class="layui-input" value="${data.pid}">
            </div>
            <label class="layui-form-label">商品名</label>
            <div class="layui-input-inline">
                <!--required-->
                <input type="text" name="name" lay-verify="require"
                       placeholder="请输入商品名" autocomplete="off"
                       class="layui-input" value="${data.name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">市场价</label>
            <div class="layui-input-inline">
                <input type="text" name="marketPrice" lay-verify="number"
                       autocomplete="off" placeholder="请输入市场价"
                       class="layui-input" value="${data.marketPrice}">
            </div>
            <label class="layui-form-label">商城价</label>
            <div class="layui-input-inline">
                <!--required-->
                <input type="text" name="shopPrice" lay-verify="number"
                       placeholder="请输入商城价" autocomplete="off"
                       class="layui-input" value="${data.shopPrice}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品库存</label>
            <div class="layui-input-inline">
                <!--required|phone-->
                <input type="text" name="stock" lay-verify="require"
                       autocomplete="no" class="layui-input"
                       value="${data.stock}">
            </div>
            <label class="layui-form-label">分类ID</label>
            <div class="layui-input-inline">
                <select name="cid" lay-filter="cid"
                        lay-verify="required" lay-search>
                    <c:forEach var="category" items="${categories}" varStatus="abc">
                        <c:if test="${category.cid == data.cid}">
                            <option value="${category.cid}" selected>${category.cname}</option>
                        </c:if>
                        <c:if test="${category.cid != data.cid}">
                            <option value="${category.cid}">${category.cname}</option>
                        </c:if>
                    </c:forEach>

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上架日期</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="date" lay-verify="date"
                       placeholder="yyyy-MM-dd" autocomplete="off"
                       class="layui-input" value="${data.date}">
            </div>
            <label class="layui-form-label">是否热品</label>
            <div class="layui-input-inline">
                <input type="radio" name="isHot" value="1" title="是" checked="">
                <input type="radio" name="isHot" value="0" title="否">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-inline">
                <textarea name="desc" placeholder="请输入内容"
                          style="resize:none"
                          class="layui-textarea">${data.desc}</textarea>
            </div>
            <label class="layui-form-label">图片路径</label>
            <div class="layui-input-inline">
                <input type="text" name="image" id="input-image-path" lay-verify="required"
                       placeholder="" autocomplete="off" readonly
                       class="layui-input" value="${data.image}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">

                <input type="radio" name="state" value="0" title="上架中"
                       <c:if test="${data.state == 0}">checked="checked"</c:if> >

                <input type="radio" name="state" value="1" title="已下架"
                       <c:if test="${data.state == 1}">checked="checked"</c:if> >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">更改图片</label>
            <div class="layui-input-inline">
                <div class="layui-upload-drag" id="file-upload"
                     style="padding:6px 10px;height:86px;">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                        <%--<input name="pimage-change" id="image-change-path" value="" type="hidden">--%>
                </div>
            </div>
            <label class="layui-form-label">图片预览</label>
            <div class="layui-input-inline">
                <div class="layui-upload-drag" lay-filter="show-img"
                     onclick="showImage(document.getElementById('show-img').src,'show-img')"
                     style="padding:6px 10px;height:86px;width:170px;border: 1px dashed #e2e2e2;overflow-y: auto">
                    <img id="show-img"
                         src="${pageContext.request.contextPath}/v2/assets/pages/img/${data.image}"
                         style="width:100%;">
                </div>
                <p>此处可以预览图片</p>
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
<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js"
        charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'laydate', 'upload'], function () {
        var form = layui.form
            , laydate = layui.laydate
            , $ = layui.$
            , upload = layui.upload
            , layer = layui.layer;

        //日期
        laydate.render({
            elem: '#date'
        });

        //监听提交
        form.on('submit(update-submit)', function (data) {
            updateProduct(data.field, layer);
            return false;
        });

        //监听上传
        upload.render({
            elem: '#file-upload'
            , url: '${pageContext.request.contextPath}/admin/products/upload-img.do'
            , auto: true //选择文件后自动上传
            , method: "POST"
            , accept: "file"
            , exts: 'jpg|png'
            , field: 'file'
            , number: 1
            , drag: true
            , before: function (obj) {
                layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
                obj.preview(function (index, file, result) {
                    $('#show-img').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (data) {
                layer.closeAll('loading');
                if (data.status === 1 || data.status === "1") {
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
                            $('#show-img').attr('src',
                                "${pageContext.request.contextPath}/v2/assets/pages/img/${data.image}");
                            layer.closeAll();
                        }
                    });
                } else {
                    layer.open({
                        type: 1
                        , area: ['250px', '200px']
                        , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        , id: 'layerMsg' + data.status //防止重复弹出
                        , content: "<hr><h2 align=\"center\">" + "更新成功" + "</h2>"
                        , btn: ['关闭']
                        , btnAlign: 'c' //按钮居中
                        , shade: 0.5 //不显示遮罩
                        , yes: function () {
                            layer.closeAll();
                        }
                    });
                    document.getElementById("input-image-path").value = data.data;
                }
            }
            , error: function () {
                layer.closeAll('loading');
                console.log('图片上传错误');
            }
        });

        function updateProduct(json, layer) {
            $.ajax({
                type: "PUT"
                , url: "${pageContext.request.contextPath}/admin/products/" + json.pid + ".do"
                , data: JSON.stringify(json)
                , dataType: "json"
                , contentType: 'application/json;charset=UTF-8'
//                , async: true
                , drag: true
                , success: function (data) {
//                console.log(data)
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

    function showImage(src, type) {
        var index = parent.layer.open({
            type: 1
            , area: ['600px', '600px']
            , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
            , id: 'layer' + type //防止重复弹出
            , content: '<img id="img-auto" src="' + src + '">'
            , btn: ['关闭']
            , btnAlign: 'c' //按钮居中
            , shade: 0.5 //显示遮罩
            , yes: function () {
                parent.layer.close(index);
            }
        });
    }


</script>

</body>
</html>