function provinceSelectInit(provinceObj, urbanObj, addressObj, address) {
    var timeLong = new Date().getTime();
    $(provinceObj).empty();
    var addressList = address.split("-");

    var provinceName = '';
    var urbanName = '';
    var addressAuto = '';

    if (addressList >= 3) {
        provinceName = addressList[0];
        urbanName = addressList[1];
        for (var i = 2; i < addressList.length; i++) {
            addressAuto += addressList[i];
        }
    } else {
        addressObj.innerHTML = address;
    }

    $.ajax({
        url: contextPath + "/view/province-select.do?_="
        + timeLong
        , dataType: "json"
        , data: {}
        , async: true
        , success: function (data) {
            if (data.status === 0 || data.status === "0") {
                $(provinceObj).append($("<option value=\"\">请选择</option>"));
                $(data.data).each(function () {
                    $(provinceObj).append($(
                        "<option value=\"" +
                        this.name +
                        "\">" + this.name +
                        "</option>"
                    ));
                });
                if (provinceName !== '') {
                    var $find = provinceObj.find("option[value = '"
                        + provinceName
                        + "']");
                    if ($find === null || $find === undefined) {
                        addressObj.innerHTML = address;
                    } else {
                        $find.attr("selected", "selected");
                        getUrbanSelect(provinceName, urbanObj, urbanName);
                    }
                }
            }
        }
        , error: function (e) {
            console.log(e)
        }
    });
    $(provinceObj).change(function () {
        if ($(this).val() !== "") {
            getUrbanSelect($(this).val(), urbanObj);
        }
    });

}

function getUrbanSelect(name, urbanS, value) {
    var timeLong = new Date().getTime();
    $(urbanS).empty();
    $.ajax({
        url: contextPath + "/view/urban-select/" + name
        + ".do?_=" + timeLong
        , dataType: "json"
        , data: {}
        , async: true
        , success: function (data) {
            if (data.status === 0 || data.status === "0") {
                $(data.data).each(function () {
                    $(urbanS).append($(
                        "<option value=\"" +
                        this.name +
                        "\">" +
                        this.name +
                        "</option>"
                    ));
                });
                urbanS.find("option[value = '其他']").attr("selected",
                    "selected");
                if (value !== null) {
                    urbanS.find("option[value = '" + value + "']").attr(
                        "selected",
                        "selected");
                }
            }
        }
        , error: function (e) {
            console.log(e)
        }
    });
}
