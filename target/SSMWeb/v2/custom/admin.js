function updateObj(json, type, id, layer) {
    $.ajax({
        type: "PUT"
        , url: contextPath + "/admin/" + type + "/" + id + ".do"
        , data: json
        , dataType: "json"
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