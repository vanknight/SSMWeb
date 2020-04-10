function isChecked(obj, msg) {
    if ($(obj).attr("checked") === "checked") {
        $(msg).html("");
        return true;
    } else {
        $(msg).html("<span class='msg-error'>请同意协议</span>");
        return false;
    }
}

function checkObj(obj, msg) {
    var value = $(obj).val();
    if (value === null || value === undefined ||
        value.length <= 1) {
        $(msg).html("<span class='msg-error'>不能为空</span>");
        return false;
    } else {
        $(msg).html("");
        return true;
    }
}

function checkAddress(address1, address2, address3, msg) {
    var value1 = $(address1).val();
    var value2 = $(address2).val();
    var value3 = $(address3).val();
    var mark1 = false;
    var mark2 = false;
    var mark3 = false;

    var string = "";
    if (value1 !== null && value1 !== undefined &&
        value1 !== "") {
        string += value1;
        mark1 = true;
    }
    string += "-";
    if (value2 !== null && value2 !== undefined &&
        value2 !== "") {
        string += value2;
        mark2 = true;
    }
    string += "-";
    if (value3 !== null && value3 !== undefined &&
        value3 !== "") {
        string += value3;
        mark3 = true;
    }
    string += "-";

    if (mark3 && mark2 && mark1) {
        $(msg).html("<span class='msg-error'>不能为空</span>");
        return string;
    } else {
        return "";
    }

}

function createOrder(oid, json, token) {

    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
            type: 1
            , offset: 'confirm' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
            , id: 'layer' + 'confirm' //防止重复弹出
            , content: '<div style="padding: 20px 100px;">' + '确认支付?' + '</div>'
            , btn: ['确认', '关闭']
            , btnAlign: 'c' //按钮居中
            , shade: 0.5 //不显示遮罩
            , yes: function () {
                layer.closeAll();
                submitOrder(oid, json, token);
            }
            , btn2: function () {
                layer.closeAll();
            }
        });
    });
}

function submitOrder(oid, json, token) {
    var form1 = document.createElement("form");
    form1.id = "orderForm";
    form1.name = "orderForm";

    // 添加到 body 中
    document.body.appendChild(form1);

    // 创建一个输入
    var input0 = document.createElement("input");
    // 设置相应参数
    input0.type = "text";
    input0.name = "token";
    input0.value = token;
    // 创建一个输入
    var input1 = document.createElement("input");
    // 设置相应参数
    input1.type = "text";
    input1.name = "name";
    input1.value = json.name;
    // 创建一个输入
    var input2 = document.createElement("input");
    // 设置相应参数
    input2.type = "text";
    input2.name = "telephone";
    input2.value = json.telephone;
    // 创建一个输入
    var input4 = document.createElement("input");
    // 设置相应参数
    input4.type = "text";
    input4.name = "address";
    input4.value = json.address;
    // 创建一个输入
    var input5 = document.createElement("input");
    // 设置相应参数
    input5.type = "text";
    input5.name = "payMethod";
    input5.value = json.payMethod;

    // 将该输入框插入到 form 中
    form1.appendChild(input1);
    form1.appendChild(input2);
    form1.appendChild(input4);
    form1.appendChild(input5);

    // form 的提交方式
    form1.method = "POST";
    // form 提交路径
    form1.action = contextPath + "/order/pay/" + oid + ".do";

    // 对该 form 执行提交
    form1.submit();
    // 删除该 form
    document.body.removeChild(form1);
}
