/** layuiAdmin.pro-v1.2.1 LPPL License By http://www.layui.com/admin/ */
;layui.define(["table", "form"], function (e) {
    var i = (layui.$, layui.admin), t = layui.view, l = layui.table, r = layui.form;
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
    }), e("basemanage", {})
});