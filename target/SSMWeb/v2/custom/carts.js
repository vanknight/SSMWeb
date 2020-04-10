function updateCarts(list) {
    $("#loader").show();
    for (var i = 0; i < list.length; i++) {
        $.ajax({
            type: "PUT"
            ,
            url: contextPath + "/cartItem/" + list[i].pid + "/" + list[i].count
            + ".do"
            ,
            data: {}
            ,
            dataType: "json"
            ,
            async: false
            ,
            success: function (data) {
                console.log(data);
            }
            ,
            error: function (e) {
                console.log(e);
            }
        })
    }
    $('body').css('overflow', 'hidden');
    setTimeout(function () {
        $("#loader").hide();
        var time = +new Date();
        var url = changeURLParam("_", time);
        $('body').css('overflow', 'auto');
        window.location.href = url;
    }, 1000)
}