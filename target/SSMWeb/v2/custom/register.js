function checkUserName(obj, msg) {
    var returnValue = checkUserNameBase(obj, msg);
    if (returnValue) {
        $.ajax({
            type: "GET"
            , url: contextPath + "/user/checkUserName/" + $(obj)[0].value + ".do"
            , data: {}
            , dataType: "json"
            , async: false
            , success: function (data) {
                if (data.status === 0 || data.status === "0") {
                    $(msg).html("<span class=''>" + data.msg + "</span>");
                    returnValue = true;
                } else {
                    $(msg).html("<span class='msg-error'>" + data.msg
                        + "</span>");
                    returnValue = false;
                }
            }
            , error: function (e) {
                returnValue = false;
            }
        })
    }
    return returnValue;
}

function checkEmail(obj, msg) {
    var returnValue = checkEmailBase(obj, msg);
    if (returnValue) {
        $.ajax({
            type: "GET"
            , url: contextPath + "/user/checkEmail/" + $(obj)[0].value + ".do"
            , data: {}
            , dataType: "json"
            , async: false
            , success: function (data) {
                if (data.status === 0 || data.status === "0") {
                    $(msg).html("<span class=''>" + data.msg + "</span>");
                    returnValue = true
                } else {
                    $(msg).html("<span class='msg-error'>" + data.msg
                        + "</span>");
                    returnValue = false;
                }
            }
            , error: function (e) {
                returnValue = false;
            }
        });
    }
    return returnValue;
}

function checkUserNameBase(obj, msg) {
    var en_pattern = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;
    var returnValue = false;
    var value = $(obj)[0].value;

    if (en_pattern.exec(value)) {
        $(obj).val("");
        $(msg).html("<span class='msg-error'>用户名必须是纯英文</span>");
        returnValue = false;
    }else {
        if (value === null || value === undefined || value.length < 3
            || value.length > 12) {
            $(obj).val("");
            $(msg).html("<span class='msg-error'>用户名长度要大于3且小于12</span>");
            returnValue = false;
        } else {
            returnValue = true;
        }
    }
    return returnValue;
}

function checkEmailBase(obj, msg) {
    var returnValue = false;
    var value = $(obj)[0].value;
    if (value === null || value === undefined || value.split("@").length !== 2
        ||
        value.split("@")[1].split(".").length !== 2) {
        $(msg).html("<span class='msg-error'>邮箱不可用</span>");
        returnValue = false;
    } else {
        returnValue = true;
    }
    return returnValue;
}

function checkName(obj, msg) {
    var nameValue = $(obj)[0].value;

    if (nameValue === null || nameValue.length <= 1 ||
        nameValue.length > 18) {
        $(msg).html("<span class='msg-error'>名字长度要大于且小于18</span>");
        return false;
    } else {
        $(msg).html("<span class=''>填写你的名字</span>");
        return true;
    }
}

function checkPassword(obj, msg) {
    var value = $(obj)[0].value;
    if (value !== null && value.length >= 6 && value.length <= 18) {
        $(msg).html("<span class=''>用于登陆</span>");
        return true;
    } else {
        $(msg).show();
        $(msg).html("<span class='msg-error'>密码要大于5且小于19</span>");
        return false;
    }
}

function checkPasswordEqual(obj1, obj2, msg) {
    var value1 = $(obj1)[0].value;
    var value2 = $(obj2)[0].value;

    if (value1 !== value2) {
        $(msg).show();
        $(msg).html("<span class='msg-error'>两次密码不一致</span>");
        return false;
    } else {
        $(msg).html("<span class=''>再次输入密码</span>");
        return true;
    }
}

var registerFunction = function (username, password, name, email, telephone,
    birthday, sex) {

    var json = {
        username: username.val(),
        password: password.val(),
        name: name.val(),
        email: email.val(),
        telephone: telephone.val(),
        birthday: birthday.val(),
        sex: sex
    };

    $.ajax({
        type: "POST"
        , url: contextPath + "/user/register.do"
        , data: json
        , dataType: "json"
        , async: true
        , success: function (data) {
            console.log(data);
            if (data.status === 0 || data.status === "0") {
                window.location.href = contextPath + "/view/shop-msg/"
                    + data.msg + ".do";
                // msg.val(data.msg);
            } else {
                $(msg).html(data.msg);
            }
        }
        , error: function (e) {

        }
    })

};

var changePasswordFunction = function (enCode, password) {
    $.ajax({
        type: "POST"
        , url: contextPath + "/user/forget-password/" + enCode.val() + ".do"
        , data: {password: password.val()}
        , dataType: "json"
        , async: false
        , success: function (data) {
            console.log(data);
            if (data.status === 0 || data.status === "0") {
                window.location.href = contextPath + "/view/shop-msg/"
                    + data.msg + ".do";
            } else {
                layerMsg(data.msg);
            }
        }
        , error: function (e) {

        }
    })
};

var forgetPasswordFunction = function (username, email) {
    $.ajax({
        type: "POST"
        , url: contextPath + "/user/forget-password.do"
        , data: {username: username.val(),email:email.val()}
        , dataType: "json"
        , async: false
        , success: function (data) {
            console.log(data);
            if (data.status === 0 || data.status === "0") {
                window.location.href = contextPath + "/view/shop-msg/"
                    + data.msg + ".do";
            } else {
                layerMsg(data.msg);
            }
        }
        , error: function (e) {

        }
    })
};

function layerMsg(msg) {
    layui.use(['layer'], function () {
        var layer = layui.layer;
        layer.open({
            type: 1
            , area: ['250px', '200px']
            , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
            , id: 'layerMsg' + 'msg' //防止重复弹出
            , content: "<hr><h2 align=\"center\">" +msg+ "</h2>"
            , btn: ['关闭']
            , btnAlign: 'c' //按钮居中
            , shade: 0.5 //不显示遮罩
            , yes: function () {
                layer.closeAll();
            }
        });

    });
}











