/** layuiAdmin.pro-v1.2.1 LPPL License By http://www.layui.com/admin/ */
;layui.define(function (e) {
    var i = (layui.$, layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin);
    i.events.logout = function () {
        i.req({
            url: "/logout/", type: "get", data: {}, success: function (r) {
                 window.location.href = "/index/";
            }
        })
    }, e("common", {})
});