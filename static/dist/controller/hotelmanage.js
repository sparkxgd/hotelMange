/** layuiAdmin.pro-v1.2.1 LPPL License By http://www.layui.com/admin/ */
;layui.define(["table", "form"], function (e) {
    var i = (layui.$, layui.admin), t = layui.view, l = layui.table, r = layui.form;
     // 客户管理
    l.render({//客户管理的表格
        elem: "#LAY-custumer-back-manage",
        url: "/custumers/",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 80, title: "ID", sort: !0}, {
            field: "name",
            title: "姓名"
        }, {
            field: "sex",
            title: "性别",
            templet: "#sexTpl"
        }, {
            field: "idcard",
            title: "身份证"
        }, {
            field: "tel",
            title: "电话"
        }, {
            field: "address",
            title: "家庭地址"
        }, {
            field: "type",
            title: "类型",
            templet: "#typeTpl",
        }
            , {field: "updatetime", title: "更新时间", sort: !0}
            ,  {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-custumer-admin"}]],
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-custumer-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ?  layer.confirm("确定删除？", function (i) {
                   //提交 Ajax 成功后，关闭当前弹层并重载表格
               layui.admin.req({
                  type:"POST",
                  url:"/custumer_del/",
                  data:{"id":l.id},
                  dataType:"json",
                  success:function (r) {
                      layer.alert(r.msg);
                      layui.table.reload("LAY-custumer-back-manage");
                  }
              })
                    , e.del()
                    , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑客户信息",
            area: ["420px", "450px"],
            id: "LAY-popup-custumer-add",
            success: function (e, i) {
                t(this.id).render("hotelMange/custumer/addform", l).done(function () {
                    r.render(null, "layuiadmin-form-custumer"), r.on("submit(LAY-custumer-back-submit)", function (e) {
                         layui.admin.req({
                                            type:"post",
                                            url:"/custumer_edit/",
                                            data:e.field,
                                            dataType:"json",
                                            success:function (r) {
                                                layer.alert(r.msg);
                                                layui.table.reload("LAY-custumer-back-manage");
                                            }
                                         }), layer.close(i)
                    })
                })
            }
        })
    }),
        // 客户入住管理
    l.render({//客户入住管理的表格
        elem: "#LAY-checkin-back-manage",
        url: "/checkins/",
        cols: [[{type: "checkbox", fixed: "left"}, {field: "id", width: 80, title: "ID", sort: !0}, {
            field: "custumer_id",
            title: "客户"
        }, {
            field: "room_id",
            title: "房间"
        }, {
            field: "time_in",
            title: "入住时间"
        }, {
            field: "day",
            title: "入住天数"
        }, {
            field: "time_out",
            title: "退房时间"
        }
            , {field: "updatetime", title: "更新时间", sort: !0}
            ,  {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-checkin-admin"}]],
        text: "对不起，加载出现异常！"
    }), l.on("tool(LAY-checkin-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ?  layer.confirm("确定删除？", function (i) {
                   //提交 Ajax 成功后，关闭当前弹层并重载表格
               layui.admin.req({
                  type:"POST",
                  url:"/checkin_del/",
                  data:{"id":l.id},
                  dataType:"json",
                  success:function (r) {
                      layer.alert(r.msg);
                      layui.table.reload("LAY-checkin-back-manage");
                  }
              })
                    , e.del()
                    , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑客户入住信息",
            area: ['850px', '600px'],
            id: "LAY-popup-checkin-add",
            success: function (e, i) {
                t(this.id).render("hotelMange/checkin/addform", l).done(function () {
                    r.render(null, "layuiadmin-form-checkin"), r.on("submit(LAY-checkin-back-submit)", function (e) {
                         layui.admin.req({
                                            type:"post",
                                            url:"/checkin_edit/",
                                            data:e.field,
                                            dataType:"json",
                                            success:function (r) {
                                                layer.alert(r.msg);
                                                layui.table.reload("LAY-checkin-back-manage");
                                            }
                                         }), layer.close(i)
                    })
                })
            }
        })
    }),

        e("hotelmanage", {})
});