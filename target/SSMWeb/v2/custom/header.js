//中文
var $cartUl = $('#cart-ul');
var $cartCount = $('#cart-count');
var $cartTotal = $('#cart-total');

function getCategory(obj) {
    if (obj === null) {
        return null;
    }
    var timeLong = new Date().getTime();
    $.ajax({
        type: "GET"
        , url: contextPath + "/category.do?_=" + timeLong
        , data: {}
        , dataType: "json"
        , async: true
        , success: function (data) {
            // console.log(data)
            if (data.status === 0 || data.status === "0") {
                var $ul = $(obj);
                $(data.data).each(function () {
                    $ul.append($(
                        "<li class='dropdown-submenu'>"
                        + "<a href='" + contextPath + "/product/category/"
                        + this.cid + ".do'>"
                        + this.cname
                        + "</a>"
                        + "</li>"
                    ));
                });
            } else {
                console.log(data.msg);
            }
        }
        , error: function (e) {
            console.log(e);
        }
    });
}

function getProductList(size, name, obj) {
    var timeLong = new Date().getTime();
    $.ajax({
        type: "GET"
        ,
        url: contextPath + "/product/" + name + "/" + size + ".do?_=" + timeLong
        ,
        data: {}
        ,
        dataType: "json"
        ,
        async: true
        ,
        success: function (data) {
            if (data.status === 0 || data.status === "0") {
                $(data.data).each(function (index, el) {

                    var img = $("#" + name + "-product-item-img-src-"
                        + index)[0];
                    var a_img = $("#" + name + "-product-item-a-img-src-"
                        + index)[0];
                    var a_pname = $("#" + name + "-product-item-a-href-html-"
                        + index)[0];
                    var div_price = $("#" + name + "-product-item-div-html-"
                        + index)[0];
                    var a_addCart = $("#" + name + "-product-item-a-add-href-"
                        + index)[0];

                    if (img && a_img && a_pname && div_price && a_addCart) {
                        img.src = contextPath + "/v2/assets/pages/img/"
                            + el.image;
                        a_img.href = img.src;
                        a_pname.href = contextPath + "/product/one/" + el.pid
                            + ".do";
                        a_pname.innerHTML = el.name;
                        div_price.innerHTML = el.shopPrice;
                        a_addCart.href = "javascript:addProductToCart('"
                            + el.pid + "',1);";
                    }

                    var pimg_up = $("#" + name + "-product-up-img-src-"
                        + index)[0];
                    var pimg_up_2 = $("#" + name + "-product-up-a-img-src-"
                        + index)[0];
                    var pname_up = $("#" + name + "-product-up-h2-html-"
                        + index)[0];

                    var marketPrice_up = $("#" + name
                        + "-product-up-span-1-html-"
                        + index)[0];
                    var shopPrice_up = $("#" + name + "-product-up-span-2-html-"
                        + index)[0];
                    var pstock_up = $("#" + name + "-product-up-strong-html-"
                        + index)[0];
                    var pdesc_up = $("#" + name + "-product-up-p-html-"
                        + index)[0];

                    var a_addCart_up = $("#" + name + "-product-up-a-add-href-"
                        + index)[0];
                    var productz_item_up = $("#" + name
                        + "-product-up-a-more-href-"
                        + index)[0];

                    if (pimg_up && pimg_up_2 && pname_up && marketPrice_up
                        && shopPrice_up && pstock_up && pdesc_up && a_addCart_up
                        && productz_item_up) {

                        pimg_up.src = contextPath + "/v2/assets/pages/img/"
                            + el.image;
                        pimg_up.dataset.bigimgsrc = contextPath
                            + "/v2/assets/pages/img/"
                            + el.image;
                        pimg_up_2.src = contextPath + "/v2/assets/pages/img/"
                            + el.image;

                        pname_up.innerHTML = el.name;
                        marketPrice_up.innerHTML = el.marketPrice;
                        shopPrice_up.innerHTML = el.shopPrice;
                        pstock_up.innerHTML = el.stock;
                        pdesc_up.innerHTML = el.desc;
                        a_addCart_up.href = "javascript:addProductToCart('"
                            + el.pid + "',$('#product-quantity-" + name + "-"
                            + index + "').val());";
                        productz_item_up.href = contextPath + "/product/one/"
                            + el.pid + ".do";
                    }

                })
            } else {
                if (obj !== null && obj !== undefined) {
                    obj.html("<h2 align='center'>" + data.msg + "</h2>");
                } else {
                    var obj = $("#" + name + "-product-list");
                    obj.html("<h2 align='center'>" + data.msg + "</h2>");
                }
                console.log(data.msg);
            }
        }
        ,
        error: function (e) {
            console.log(e);
        }
    })
}

function getRandomProduct(size) {
    var timeLong = new Date().getTime();
    $.ajax({
        type: "GET"
        , url: contextPath + "/product/randomProduct/" + size
        + ".do"
        , data: {}
        , dataType: "json"
        , async: true
        , success: function (data) {
            if (data.status === 0 || data.status === "0") {
                $(data.data).each(function (index, el) {

                    var a = document.getElementById("random-product-item-a-"
                        + index);
                    var a_img = document.getElementById("random-product-item-img-"
                        + index);
                    var p_a = document.getElementById("random-product-item-a-html-"
                        + index);
                    var p_font = document.getElementById("random-product-item-price-"
                        + index);

                    if (a !== null && a_img !== null && p_a !== null && p_font
                        !== null) {
                        a.href = contextPath + "/product/one/"
                            + el.pid + ".do";
                        a_img.src = contextPath + "/v2/assets/pages/img/"
                            + el.image;
                        a_img.alt = el.name;
                        p_a.href = contextPath + "/product/one/"
                            + el.pid + ".do";
                        p_a.innerHTML = limitNumber(el.name, 9);
                        p_font.innerHTML = "&yen;" + el.shopPrice;
                    }
                })
            } else {
                var obj = $("#random-product-list");
                if (obj !== undefined && obj !== null) {
                    obj.html("<h2 align='center'>" + data.msg + "</h2>")
                }
                console.log(data.msg);
            }
        }
        , error: function (e) {
            console.log(e);
        }
    });
}

function sidebarMenu(obj) {
    if (obj === null) {
        return null;
    }
    var timeLong = new Date().getTime();
    $.ajax({
        type: "GET"
        , url: contextPath + "/category.do?_=" + timeLong
        , data: {}
        , dataType: "json"
        , async: true
        , success: function (data) {
            if (data.status === 0 || data.status === "0") {
                var $ul = $(obj);
                $ul.html("");
                $(data.data).each(function () {
                    $ul.append($(
                        "<li class=\"list-group-item clearfix\">"
                        + "<a href=\"" + contextPath + "/product/category/"
                        + this.cid + ".do\">"
                        + "<i class=\"fa fa-angle-right\"></i>"
                        + this.cname
                        + "</a>"
                        + "</li>"
                    ));
                });
            } else {
                alert(data.msg);
            }
        }
        , error: function (e) {
            console.log(e);
        }
    });
}

function sidebarMenuProductItem(obj) {
    if (obj === null) {
        return null;
    }
    var timeLong = new Date().getTime();
    $.ajax({
        type: "GET"
        , url: contextPath + "/category.do?_=" + timeLong
        , data: {}
        , dataType: "json"
        , async: true
        , success: function (data) {
            if (data.status === 0 || data.status === "0") {
                var $ul = $(obj);
                $ul.html("");
                $(data.data).each(function () {
                    $ul.append($(
                        "<li class=\"list-group-item clearfix\">"
                        + "<a href=\"javascript:getProductList('" + this.cid
                        + "/" + 3 + "','category');\">"
                        + "<i class=\"fa fa-angle-right\"></i>"
                        + this.cname
                        + "</a>"
                        + "</li>"
                    ));
                });
            } else {
                $ul.html("<h2 align='center'>" + data.msg + "</h2>")
                console.log(data.msg);
            }
        }
        , error: function (e) {
            console.log(e);
        }
    });
}

function changeURLParam(name, param) {
    var rootURL = window.location.href;
    var url_href = "";
    var url_str = "";
    if (rootURL.split("?").length > 1) {
        url_href = rootURL.split("?")[0];
        url_str = rootURL.split("?")[1];
    }
    var params_str = [];
    var params = [];
    var values = [];

    if (url_str !== null && url_str.length > 3) {
        params_str = url_str.split("&");
        if (params_str !== null && params_str.length > 0) {
            var isHave = false;
            var index = 0;
            for (var i = 0; i < params_str.length; i++) {
                if (typeof params_str[i].split("=")[0] !== "undefined" && params_str[i].split("=")[0] !== "undefined"
                    && params_str[i].split("=")[0] !== "" && params_str[i].split("=")[0] !== "#") {
                    params[index] = params_str[i].split("=")[0];
                    // alert(params);
                    values[index] = params_str[i].split("=")[1];
                    if (params[index] === name) {
                        isHave = true;
                        values[index] = param;
                    }
                    index++;
                }
            }
            if (!isHave) {
                params[index + 1] = name;
                values[index + 1] = param;
            }
        }
    } else {
        params[0] = name;
        values[0] = param;
    }
    // alert(params)
    // alert(values)
    var url_str_ = "";
    for (var j = 0; j < params.length; j++) {
        url_str_ += params[j] + "=" + values[j] + "&";
    }
    url_str_ = url_str_.substr(0, url_str_.length - 1);
    return url_href + "?" + url_str_;

}

$.fn.scrollUnique = function () {
    return $(this).each(function () {
        var eventType = 'mousewheel';
        // 火狐是DOMMouseScroll事件
        if (document.mozHidden !== undefined) {
            eventType = 'DOMMouseScroll';
        }
        $(this).on(eventType, function (event) {
            // 一些数据
            var scrollTop = this.scrollTop,
                scrollHeight = this.scrollHeight,
                height = this.clientHeight;

            var delta = (event.originalEvent.wheelDelta)
                ? event.originalEvent.wheelDelta
                : -(event.originalEvent.detail || 0);

            if ((delta > 0 && scrollTop <= delta) || (delta < 0 && scrollHeight
                    - height
                    - scrollTop <= -1 * delta)) {
                // IE浏览器下滚动会跨越边界直接影响父级滚动，因此，临界时候手动边界滚动定位
                this.scrollTop = delta > 0 ? 0 : scrollHeight;
                // 向上滚 || 向下滚
                event.preventDefault();
            }
        });
    });
};

function showCartsMin() {

    if ($cartUl !== null) {
        var token = getByAll(tokenSaveID);

        var timeLong = new Date().getTime();
        $.ajax({
            type: "POST"
            , url: contextPath + "/cartItem.do?_=" + timeLong
            , data: {}
            , dataType: "json"
            , async: true
            , beforeSend: function (request) {
                request.setRequestHeader(tokenHeaderName, tokenPrefix + token);
            }
            , success: function (data) {

                if (data.status === 0 ||
                    data.status === "0") {
                    var allCount = 0;
                    $($cartUl).html("");

                    $(data.data).each(function (index, el) {
                        allCount++;
                        $($cartUl).append(
                            "<li>\n"
                            + " <a href=\"" + contextPath + "/product/one/"
                            + el.pid + ".do\">\n"
                            + " <img src=\"" + contextPath
                            + "/v2/assets/pages/img/" + el.product.image
                            + "\"\n"
                            + " alt=\"" + el.product.name.substring(0, 2)
                            + "\" width=\"45\" height=\"60\">\n"
                            + " </a>\n"
                            + " <span class=\"cart-content-count\">" + el.count
                            + " 个</span>\n"
                            + " <strong>\n"
                            + " <a href=\"" + contextPath + "/product/one/"
                            + el.pid + ".do\">\n"
                            + " " + el.product.name.substring(0, 5) + "\n"
                            + " </a>\n"
                            + " </strong>\n"
                            + " <em>￥" + el.product.shopPrice + "</em>\n"
                            + " <a href=\"javascript:deleteCartItem('" + el.pid
                            + "');\" class=\"del-goods\">&nbsp;</a>\n"
                            + " </li>"
                        );
                    });
                    $($cartCount).html(allCount);
                    $($cartTotal).html(data.total);

                } else {
                    $($cartCount).html("0");
                    $($cartTotal).html("0");
                    $($cartUl).html("<h2 align=\"center\" "
                        + " style=\"margin-top: 125px;\">" + data.msg
                        + "</h2>");
                }
            }
            , error: function (e) {
                console.log(e);
            }
        })
    }
}

function deleteCartItem(pid, mark) {
    if (confirm("是否删除")) {
        var token = getByAll(tokenSaveID);
        var timeLong = new Date().getTime();
        $.ajax({
            type: "DELETE"
            , url: contextPath + "/cartItem/" + pid + ".do?_=" + timeLong
            , data: {}
            , dataType: "json"
            , async: false
            , beforeSend: function (request) {
                request.setRequestHeader(tokenHeaderName, tokenPrefix + token);
            }
            , success: function (data) {
                // console.log(data)
                showCartsMin();
                if (mark) {
                    if ((data.status === 0 || data.status === "0")) {
                        window.location.reload(true);
                    } else {
                        layui.use(['layer'], function() {
                            var layer = layui.layer;
                            layer.alert(data.msg, {icon: 6});
                        });
                    }
                }
            }
            , error: function (e) {
                console.log(e);
            }
        });
    }
}

function addProductToCart(pid, count) {
    var token = getByAll(tokenSaveID);
    var timeLong = new Date().getTime();
    $.ajax({
        type: "GET"
        , url: contextPath + "/cartItem/" + pid + "/" + count + ".do?_="
        + timeLong
        , data: {}
        , dataType: "json"
        , async: false
        , beforeSend: function (request) {
            request.setRequestHeader(tokenHeaderName, tokenPrefix + token);
        }
        , success: function (data) {
            layui.use(['layer'], function() {
                var layer = layui.layer;
                layer.alert('商品添加成功', {icon: 6});
            });
            showCartsMin();
        }
        , error: function (e) {
            layui.use(['layer'], function() {
                var layer = layui.layer;
                layer.alert('商品添加失败', {icon: 6});
            });
            console.log(e);
        }
    });
}

function searchProductByCid(cid, size) {
    var mark = "category";
    var timeLong = new Date().getTime();
    $.ajax({
        type: "GET"
        ,
        url: contextPath + "/product/category/" + cid + "/" + size + ".do?_="
        + timeLong
        ,
        data: {}
        ,
        dataType: "json"
        ,
        async: true
        ,
        success: function (data) {
            if (data.status === 0 || data.status === "0") {
                $(data.data).each(function (index, el) {

                    var img = $("#" + mark + "-product-item-img-src-"
                        + index)[0];
                    var a_img = $("#" + mark + "-product-item-a-img-src-"
                        + index)[0];
                    var a_pname = $("#" + mark + "-product-item-a-href-html-"
                        + index)[0];
                    var div_price = $("#" + mark + "-product-item-div-html-"
                        + index)[0];
                    var a_addCart = $("#" + mark + "-product-item-a-add-href-"
                        + index)[0];

                    if (img && a_img && a_pname && div_price && a_addCart) {
                        img.src = contextPath + "/v2/assets/pages/img/"
                            + el.image;
                        a_img.href = img.src;
                        a_pname.href = contextPath + "/product/one/" + el.pid
                            + ".do";
                        a_pname.innerHTML = el.name;
                        div_price.innerHTML = el.shopPrice;
                        a_addCart.href = "javascript:addProductToCart('"
                            + el.pid + "',1);";
                    }
                })
            } else {
                alert(data.msg);
            }
        }
        ,
        error: function (e) {
            console.log(e);
        }
    })
}

function addProductToWish(pid) {
    var token = getByAll(tokenSaveID);
    var timeLong = new Date().getTime();
    $.ajax({
        type: "PUT"
        , url: contextPath + "/product/wish/" + pid + ".do?_="
        + timeLong
        , data: {}
        , dataType: "json"
        , async: false
        , beforeSend: function (request) {
            request.setRequestHeader(tokenHeaderName, tokenPrefix + token);
        }
        , success: function (data) {
            alert(data.msg);
        }
        , error: function (e) {
            console.log(e);
        }
    });
}

function deleteWishProduct(pid) {
    if (confirm("是否删除")) {
        var token = getByAll(tokenSaveID);
        var timeLong = new Date().getTime();
        $.ajax({
            type: "DELETE"
            , url: contextPath + "/product/wish/" + pid + ".do?_=" + timeLong
            , data: {}
            , dataType: "json"
            , async: false
            , beforeSend: function (request) {
                request.setRequestHeader(tokenHeaderName, tokenPrefix + token);
            }
            , success: function (data) {
                if ((data.status === 0 || data.status === "0")) {
                    window.location.reload(true);
                } else {
                    alert(data.msg)
                }
            }
            , error: function (e) {
                console.log(e);
            }
        });
    }
}

function forgetPassword() {

}