/** layuiAdmin.pro-v1.2.1 LPPL License By http://www.layui.com/admin/ */
;layui.define(["table", "form"], function (e) {
    var i = (layui.$, layui.admin), t = layui.view, l = layui.table, r = layui.form;
    //楼房信息管理表格
    l.render({//楼房信息管理的表格
        elem: "#LAY-floor-back-manage",
        url: "/floors/",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 80, title: "ID", sort: !0}, {
            field: "no",
            title: "楼房编号"
        }, {
            field: "name",
            title: "楼房名称"
        }, {
            field: "floorno",
            title: "楼层"
        }
            , {field: "updatetime", title: "更新时间", sort: !0}
            , {
                field: "status",
                title: "状态",
                templet: "#buttonTpl",
                minWidth: 80,
                align: "center"
            }, {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-floor-admin"}]],
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-floor-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ?  layer.confirm("确定删除此楼房？", function (i) {
                   //提交 Ajax 成功后，关闭当前弹层并重载表格
               layui.admin.req({
                  type:"POST",
                  url:"/floor_del/",
                  data:{"id":l.id},
                  dataType:"json",
                  success:function (r) {
                      layer.alert(r.msg);
                      layui.table.reload("LAY-floor-back-manage");
                  }
              })
                    , e.del()
                    , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑楼房",
            area: ["420px", "450px"],
            id: "LAY-popup-floor-add",
            success: function (e, i) {
                t(this.id).render("baseMange/floor/addform", l).done(function () {
                    r.render(null, "layuiadmin-form-floor"), r.on("submit(LAY-floor-back-submit)", function (e) {
                         layui.admin.req({
                                            type:"post",
                                            url:"/floor_edit/",
                                            data:e.field,
                                            dataType:"json",
                                            success:function (r) {
                                                layer.alert(r.msg);
                                                layui.table.reload("LAY-floor-back-manage");
                                            }
                                         }), layer.close(i)
                    })
                })
            }
        })
    }),

        //房间类型新管理
    l.render({//房间类型管理的表格
        elem: "#LAY-roomtype-back-manage",
        url: "/roomtypes/",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 80, title: "ID", sort: !0}, {
            field: "typename",
            title: "类型名称"
        }, {
            field: "price",
            title: "普通价"
        }, {
            field: "vip_price",
            title: "会员价"
        }
            , {field: "updatetime", title: "更新时间", sort: !0}
            ,  {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-roomtype-admin"}]],
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-roomtype-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ?  layer.confirm("确定删除？", function (i) {
                   //提交 Ajax 成功后，关闭当前弹层并重载表格
               layui.admin.req({
                  type:"POST",
                  url:"/roomtype_del/",
                  data:{"id":l.id},
                  dataType:"json",
                  success:function (r) {
                      layer.alert(r.msg);
                      layui.table.reload("LAY-roomtype-back-manage");
                  }
              })
                    , e.del()
                    , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑房间类型",
            area: ["420px", "450px"],
            id: "LAY-popup-roomtype-add",
            success: function (e, i) {
                t(this.id).render("baseMange/roomtype/addform", l).done(function () {
                    r.render(null, "layuiadmin-form-roomtype"), r.on("submit(LAY-roomtype-back-submit)", function (e) {
                         layui.admin.req({
                                            type:"post",
                                            url:"/roomtype_edit/",
                                            data:e.field,
                                            dataType:"json",
                                            success:function (r) {
                                                layer.alert(r.msg);
                                                layui.table.reload("LAY-roomtype-back-manage");
                                            }
                                         }), layer.close(i)
                    })
                })
            }
        })
    }),

 l.render({//房间管理的表格
        elem: "#LAY-room-back-manage",
        url: "/rooms/",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 80, title: "ID", sort: !0}, {
            field: "room",
            title: "房间编号"
        }, {
            field: "room_type_id__typename",
            title: "房间类型"
        }, {
            field: "floorid__name",
            title: "所属楼房"
        }, {
            field: "floorno",
            title: "所属楼层"
        }, {
                field: "status",
                title: "状态",
                templet: "#buttonTpl",
                minWidth: 80,
                align: "center"
            }
            , {field: "updatetime", title: "更新时间", sort: !0}
            ,  {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-room-admin"}]],
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-room-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ?  layer.confirm("确定删除？", function (i) {
                   //提交 Ajax 成功后，关闭当前弹层并重载表格
               layui.admin.req({
                  type:"POST",
                  url:"/room_del/",
                  data:{"id":l.id},
                  dataType:"json",
                  success:function (r) {
                      layer.alert(r.msg);
                      layui.table.reload("LAY-room-back-manage");
                  }
              })
                    , e.del()
                    , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑房间",
            area: ["420px", "450px"],
            id: "LAY-popup-room-add",
            success: function (e, i) {
                t(this.id).render("baseMange/room/addform", l).done(function () {
                    r.render(null, "layuiadmin-form-room"), r.on("submit(LAY-room-back-submit)", function (e) {
                         layui.admin.req({
                                            type:"post",
                                            url:"/room_edit/",
                                            data:e.field,
                                            dataType:"json",
                                            success:function (r) {
                                                layer.alert(r.msg);
                                                layui.table.reload("LAY-room-back-manage");
                                            }
                                         }), layer.close(i)
                    })
                })
            }
        })
    }),


        e("basemanage", {})
});