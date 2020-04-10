var contextPath = webContextPath();
var tokenHeaderName = "Authorization";
var randomHeaderName = "RandomNumber";

var tokenPrefix = "Bearer ";
var randomPrefix = "Random ";

var tokenSaveID = "acceptToken";
var usernameSaveID = "login-username";
var userSaveID = "login-user";
var loginCountID = "login-count";
var regCodeSaveID = "login-regCode";
var loginStateSaveID = "login-state";

var loginCheckURL = "/user/checkToken.do";

//登陆界面的登陆ajax
var loginFunction = function (username, password, random_value, autoLogin,
    code_doc, code_img, msg) {
    var json = {
        "username": username.val(),
        "password": password.val(),
        "autoLogin": autoLogin.checked
    };
    $.ajax({
        type: "POST"
        , url: contextPath + "/user/login.do"
        , data: json
        , dataType: "json"
        , async: true
        , beforeSend: function (request) {
            request.setRequestHeader(randomHeaderName, randomPrefix
                + random_value.val());
        }
        , success: function (data) {

            localValueUp(loginCountID, 1);

            if (data.status === 0 || data.status === "0") {

                var token = data.data.userId + "_" + data.data.token;

                saveToAll(tokenSaveID, token);//保存token

                saveToLocal(loginCountID, 0);
                saveToAll(loginStateSaveID, true);
                var time = +new Date();
                window.location.href = document.referrer;
                $(code_doc).hide();
                $(msg).html("");

            } else if (data.status === 1 || data.status === "1") {
                if (localStorage.getItem(loginCountID) !== null &&
                    localStorage.getItem(loginCountID) > 2) {
                    $(code_doc).show();
                    getVerCodeImage(code_img);
                }
                $(msg).html(data.msg)
            }
        }
        , error: function (e) {
            $(msg).html("服务出错");
            console.log(e);
        }
    });
};

function loginHeader(obj, mark) {

    if (mark) {
        var loginHTML = "";
        var user = JSON.parse(getByAll(userSaveID));
        if (user.state === 2 || user.state === "2") {
            loginHTML += "<li>\n"
                + "<a href=\"" + contextPath + "/admin/index.do\">\n"
                + "后台管理\n"
                + "</a>\n"
                + "</li>\n";
        }
        loginHTML +="<li>\n"
            + "<a href=\"" + contextPath + "/order/all.do\">\n"
            + "我的订单\n"
            + "</a>\n"
            + "</li>\n"
            + "<li>\n"
            + "<a href=\"" + contextPath + "/product/wish.do\">\n"
            + "我的喜欢\n"
            + "</a>\n"
            + "</li>\n"
            + "<li>\n"
            + "<a id=\"logout-a\" href=\"javascript:void(0);\"\n"
            + "onclick=\"logoutFunction()\">\n"
            + "注销\n"
            + "</a>\n"
            + "</li>";
        $(obj).html(loginHTML);

    } else {
        var logoutHTML = "<li>"
            + "<a href=\"" + contextPath + "/view/loginUI.do\">"
            + "登陆"
            + "</a>"
            + "</li><li>"
            + "<a href=\"" + contextPath + "/view/registerUI.do\">"
            + "注册"
            + "</a>"
            + "</li>";
        $(obj).html(logoutHTML);
    }
}

//只用token验证登陆
var autoLoginFunction = function () {
    var token = getByAll(tokenSaveID);
    submitToken(token);
};

var logoutFunction = function () {
    var token = getByAll(tokenSaveID);
    $.ajax({
        type: "DELETE"
        , url: contextPath + "/user/logout.do"
        , data: {}
        , dataType: "json"
        , async: true
        , beforeSend: function (request) {
            request.setRequestHeader(tokenHeaderName, tokenPrefix + token)
        }
        , success: function (data) {
            removeToAll(tokenSaveID);
            // removeToAll(loginStateSaveID);
            removeToAll(userSaveID);
            showCartsMin();
            alert(data.msg);
            autoLoginFunction();
        }
        , error: function (e) {
            console.log(e);
        }
    });
}

function saveToSession(key, value) {
    window.sessionStorage.setItem(key, value);
}

function saveToLocal(key, value) {
    window.localStorage.setItem(key, value);
}

function saveToAll(key, value) {
    saveToSession(key, value);
    saveToLocal(key, value);
}

function localValueUp(key, upSize) {
    var i = 0;
    if (window.localStorage.getItem(key) !== null) {
        i = window.localStorage.getItem(key);
        i += upSize;
    }
    window.localStorage.setItem(key, i);
}

function removeToAll(key) {
    window.sessionStorage.removeItem(key);
    window.localStorage.removeItem(key);

}

function getByAll(key) {
    var sessionValue = window.sessionStorage.getItem(key);
    var localValue = window.localStorage.getItem(key);

    if (sessionValue !== null && sessionValue !== "") {
        if (localValue !== null && localValue !== "") {
            if (sessionValue !== localValue) {
                return localValue;
            } else {
                return localValue;
            }
        } else {
            return sessionValue;
        }
    } else {
        if (localValue !== null && localValue !== "") {
            return localValue;
        } else {
            return null;
        }
    }

}

function submitToken(token) {

    $.ajax({
        url: contextPath + loginCheckURL
        , data: {}
        , async: true
        , dataType: "json"
        , beforeSend: function (request) {
            request.setRequestHeader(tokenHeaderName, tokenPrefix + token)
        }
        , success: function (data) {
            // console.log(data)
            if (data.status === 0 ||
                data.status === "0") {
                console.log(data.user);
                saveToSession(userSaveID, JSON.stringify(data.user));
                saveToAll(loginStateSaveID, true);
                loginHeader($("#login-user-header"), true)
            } else {
                saveToSession(userSaveID, null);
                saveToAll(loginStateSaveID, false);
                loginHeader($("#login-user-header"), false)
            }
        }
        , error: function (e) {
            console.log(e)
        }

    });

}

function getVerCodeImage(obj) {
    if (obj === null) {
        console.log("无效的验证码图片对象");
    }
    $.ajax({
        type: "GET"
        , url: contextPath + "/view/code.do?flag=" + Math.random()
        , data: {}
        , dataType: "json"
        , async: true
        , success: function (data) {
            if (data.status === 0 || data.status === "0") {
                sessionStorage.setItem(regCodeSaveID, data.reg_code);
                $(obj).attr("src", data.stream);//填充流
            }
        }
        , error: function (e) {

        }
    });
}

function limitNumber(txt, size) {
    var str = txt;
    str = str.substring(0, size) + '...';
    return str;
}

function getNowWebPath(url, rootPath) {
    if (rootPath === null) {
        rootPath = contextPath;
    }
    var str = url;
    var start = str.indexOf(rootPath) + rootPath.length;
    return str.substr(start);
}

function webContextPath() {
    var fullURL = window.location.href;
    var removeHTTP_URL = fullURL.split("://")[1];
    var contextPath = removeHTTP_URL.split("/")[1];
    return "/" + contextPath;
}

function webContextPath2() {
    return "";
}

function checkRegCode(obj) {
    return obj.val().toLowerCase() === sessionStorage.getItem(
        regCodeSaveID).toLowerCase();
}



