/** layuiAdmin.pro-v1.2.1 LPPL License By http://www.layui.com/admin/ */
;layui.define(["table", "form"], function (e) {
    var i = (layui.$, layui.admin), t = layui.view, l = layui.table, r = layui.form;
    l.render({
        elem: "#LAY-user-manage",
        url: "./json/useradmin/webuser.js",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 100, title: "ID", sort: !0}, {
            field: "username",
            title: "用户名",
            minWidth: 100
        }, {field: "avatar", title: "头像", width: 100, templet: "#imgTpl"}, {
            field: "phone",
            title: "手机"
        }, {field: "email", title: "邮箱"}, {field: "sex", width: 80, title: "性别"}, {
            field: "ip",
            title: "IP"
        }, {field: "jointime", title: "加入时间", sort: !0}, {
            title: "操作",
            width: 150,
            align: "center",
            fixed: "right",
            toolbar: "#table-useradmin-webuser"
        }]],
        page: !0,
        limit: 30,
        height: "full-320",
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-user-manage)", function (e) {
        var l = e.data;
        "del" === e.event ? layer.prompt({formType: 1, title: "敏感操作，请验证口令"}, function (i, t) {
            layer.close(t), layer.confirm("真的删除行么", function (i) {
                e.del(), layer.close(i)
            })
        }) : "edit" === e.event && i.popup({
            title: "编辑用户",
            area: ["500px", "450px"],
            id: "LAY-popup-user-add",
            success: function (e, i) {
                t(this.id).render("user/user/userform", l).done(function () {
                    r.render(null, "layuiadmin-form-useradmin"), r.on("submit(LAY-user-front-submit)", function (e) {
                        e.field;
                        layui.table.reload("LAY-user-manage"), layer.close(i)
                    })
                })
            }
        })
    }), l.render({//后台用户管理的表格
        elem: "#LAY-user-back-manage",
        url: "/users/",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 80, title: "ID", sort: !0}, {
            field: "username",
            title: "用户名"
        }, {
            field: "password",
            title: "密码"
        }
            , {field: "updatetime", title: "更新时间", sort: !0}
            , {
                field: "status",
                title: "状态",
                templet: "#buttonTpl",
                minWidth: 80,
                align: "center"
            }, {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-useradmin-admin"}]],
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-user-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ?  layer.confirm("确定删除此用户？", function (i) {
                   //提交 Ajax 成功后，关闭当前弹层并重载表格
               layui.admin.req({
                  type:"POST",
                  url:"/user_del/",
                  data:{"id":l.id},
                  dataType:"json",
                  success:function (r) {
                      layer.alert(r.msg);
                      layui.table.reload("LAY-user-back-manage");
                  }
              })
                    , e.del()
                    , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑管理员",
            area: ["420px", "450px"],
            id: "LAY-popup-user-add",
            success: function (e, i) {
                t(this.id).render("user/administrators/adminform", l).done(function () {
                    r.render(null, "layuiadmin-form-admin"), r.on("submit(LAY-user-back-submit)", function (e) {
                        layui.admin.req({
                                            type:"post",
                                            url:"/user_edit/",
                                            data:e.field,
                                            dataType:"json",
                                            success:function (r) {
                                                layer.alert(r.msg);
                                                layui.table.reload("LAY-user-back-manage");
                                            }
                                         }), layer.close(i)
                    })
                })
            }
        })
    }), l.render({
        elem: "#LAY-user-back-role",
        url: "./json/useradmin/role.js",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 80, title: "ID", sort: !0}, {
            field: "rolename",
            title: "角色名"
        }, {field: "limits", title: "拥有权限"}, {field: "descr", title: "具体描述"}, {
            title: "操作",
            width: 150,
            align: "center",
            fixed: "right",
            toolbar: "#table-useradmin-admin"
        }]],
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-user-back-role)", function (e) {
        var l = e.data;
        "del" === e.event ? layer.confirm("确定删除此角色？", function (i) {
            e.del(), layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "添加新角色",
            area: ["500px", "480px"],
            id: "LAY-popup-user-add",
            success: function (e, i) {
                t(this.id).render("user/administrators/roleform", l).done(function () {
                    r.render(null, "layuiadmin-form-role"), r.on("submit(LAY-user-role-submit)", function (e) {
                        e.field;
                        layui.table.reload("LAY-user-back-role"), layer.close(i)
                    })
                })
            }
        })
    }), e("useradmin", {})
});