<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/5/18 14:48
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>退款申请 |</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/v2/assets/layui/css/layui.css">
</head>
<body>
<div style="padding: 10px;">
    <c:if test="${status == 0}">
        <form class="layui-form" method="post"
              action="">
            <div class="layui-form-item">
                <label class="layui-form-label">订单号</label>
                <div class="layui-input-block">
                    <input type="text" name="oid" lay-verify="require"
                           autocomplete="off" placeholder="请输入订单编号" readonly
                           class="layui-input" value="${data}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">退款理由</label>
                <div class="layui-input-block">
                <textarea name="reason" placeholder="请输入内容"
                          style="resize:none" lay-verify="require"
                          class="layui-textarea"></textarea>
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
</div>
</body>
<script src="${pageContext.request.contextPath}/v2/assets/layui/layui.js?t=20180511"
        charset="UTF-8"></script>
<script>
    layui.use(['form', 'laydate', 'upload'], function () {
        var form = layui.form
            , laydate = layui.laydate
            , layer = parent.layer
            , $ = layui.$
            , upload = layui.upload;

        //日期
        laydate.render({
            elem: '#date'
        });

        //监听提交
        form.on('submit(update-submit)', function (data) {
            updateCategory(data.field, layer);
            return false;
        });
        //${pageContext.request.contextPath}/order/refund/${data}.do
        function updateCategory(json, layer) {
            $.ajax({
                type: "POST"
                , url: "${pageContext.request.contextPath}/order/refund/" + json.oid + ".do"
                , data: json
                , dataType: "json"
                , async: true
                , success: function (data) {
                    console.log(data);

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
                            if (data.status === 0 || data.status === "1") {
                                parent.layer.closeAll();
                                parent.location.reload();
                            }
                        }
                    });

                }

            })
        }
    });


</script>
</html>
