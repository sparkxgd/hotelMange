/** layuiAdmin.pro-v1.2.1 LPPL License By http://www.layui.com/admin/ */
;layui.define(["table", "form"], function (e) {
    var i = (layui.$, layui.admin), t = layui.view, l = layui.table, r = layui.form;
    layui.use(["carousel", "echarts"], function () {
        var e = layui.$, a = (layui.carousel, layui.echarts), l = [], t = [{
            tooltip: {trigger: "axis"},
            calculable: !0,
            legend: {data: ["访问量", "下载量", "平均访问量"]},
            xAxis: [{
                type: "category",
                data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
            }],
            yAxis: [{type: "value", name: "访问量", axisLabel: {formatter: "{value} 万"}}, {
                type: "value",
                name: "下载量",
                axisLabel: {formatter: "{value} 万"}
            }],
            series: [{
                name: "访问量",
                type: "line",
                data: [900, 850, 950, 1e3, 1100, 1050, 1e3, 1150, 1250, 1370, 1250, 1100]
            }, {
                name: "下载量",
                type: "line",
                yAxisIndex: 1,
                data: [850, 850, 800, 950, 1e3, 950, 950, 1150, 1100, 1240, 1e3, 950]
            }, {name: "平均访问量", type: "line", data: [870, 850, 850, 950, 1050, 1e3, 980, 1150, 1e3, 1300, 1150, 1e3]}]
        }], i = e("#LAY-index-pagetwo").children("div"), n = function (e) {
            l[e] = a.init(i[e], layui.echartsTheme), l[e].setOption(t[e]), window.onresize = l[e].resize
        };
        i[0] && n(0)
    }),
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
                , {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-custumer-admin"}]],
            text: "对不起，加载出现异常！"
        }), l.on("tool(LAY-custumer-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ? layer.confirm("确定删除？", function (i) {
            //提交 Ajax 成功后，关闭当前弹层并重载表格
            layui.admin.req({
                type: "POST",
                url: "/custumer_del/",
                data: {"id": l.id},
                dataType: "json",
                success: function (r) {
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
                            type: "post",
                            url: "/custumer_edit/",
                            data: e.field,
                            dataType: "json",
                            success: function (r) {
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
                field: "custumer_id__name",
                title: "客户"
            }, {
                field: "room_id__room",
                title: "房间"
            }, {
                field: "time_in",
                title: "入住时间"
            }, {
                field: "day",
                title: "入住天数"
            }, {
                field: "bill__status",
                title: "状态",
                toolbar: "#buttonTpl",
            }, {
                field: "time_out",
                title: "退房时间"
            }
                , {field: "updatetime", title: "更新时间", sort: !0}
                , {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-checkin-admin"}]],
            text: "对不起，加载出现异常！"
        }), l.on("tool(LAY-checkin-back-manage)", function (e) {
        var l = e.data;
        if ("del" === e.event) {
            layer.confirm("确定删除？", function (i) {
                //提交 Ajax 成功后，关闭当前弹层并重载表格
                layui.admin.req({
                    type: "POST",
                    url: "/checkin_del/",
                    data: {"id": l.id},
                    dataType: "json",
                    success: function (r) {
                        layer.alert(r.msg);
                        layui.table.reload("LAY-checkin-back-manage");
                    }
                })
                    , e.del()
                    , layer.close(i)
            })
        } else if ("edit" === e.event) {
            i.popup({
                title: "编辑客户入住信息",
                area: ['850px', '600px'],
                id: "LAY-popup-checkin-add",
                success: function (e, i) {
                    t(this.id).render("hotelMange/checkin/addform", l).done(function () {
                        r.render(null, "layuiadmin-form-checkin"), r.on("submit(LAY-checkin-back-submit)", function (e) {
                            layui.admin.req({
                                type: "post",
                                url: "/checkin_edit/",
                                data: e.field,
                                dataType: "json",
                                success: function (r) {
                                    layer.alert(r.msg);
                                    layui.table.reload("LAY-checkin-back-manage");
                                }
                            }), layer.close(i)
                        })
                    })
                }
            })
        } else if ("billinfo" === e.event) {
            i.popup({
                title: '房间账单信息'
                , area: ['1000px', '600px']
                , id: 'LAY-popup-checkin-billinfo'
                , success: function (e, i) {
                    t(this.id).render('hotelMange/income/billinfo', l).done(function () {
                        r.render(null, "layuiadmin-form-billinfo"), r.on("submit(LAY-billinfo-back-submit)", function (e) {
                            layui.admin.req({
                                type: "post",
                                url: "/bill_income/",
                                data: e.field,
                                dataType: "json",
                                success: function (r) {
                                    layer.alert(r.msg);
                                    layui.table.reload("LAY-checkin-back-manage");
                                }
                            }), layer.close(i)
                        })
                    })
                }
            });
        }
    }),
        // 客户退房管理
        l.render({//客户退房管理的表格
            elem: "#LAY-checkout-back-manage",
            url: "/checkouts/",
            cols: [[{type: "checkbox", fixed: "left"},  {
                field: "room",
                title: "房间"
            }, {
                field: "room_type_id__typename",
                title: "类型"
            }, {
                field: "room_type_id__price",
                title: "普通价"
            }, {
                field: "room_type_id__vip_price",
                title: "会员价"
            },{
                field: "status",
                title: "状态",
                toolbar: "#statusTpl"
            }
                , {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-checkout-admin"}]],
            text: "对不起，加载出现异常！"
        }), l.on("tool(LAY-checkout-back-manage)", function (e) {
        var l = e.data;
        "outroom" === e.event ? layer.confirm("确定退房？", function (i) {
            //提交 Ajax 成功后，关闭当前弹层并重载表格
            layui.admin.req({
                type: "POST",
                url: "/checkout/",
                data: {"id": l.id},
                dataType: "json",
                success: function (r) {
                    layer.alert(r.msg);
                    layui.table.reload("LAY-checkout-back-manage");
                }
            })
                , e.del()
                , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑客户入住信息",
            area: ['850px', '600px'],
            id: "LAY-popup-checkout-add",
            success: function (e, i) {
                t(this.id).render("hotelMange/checkout/addform", l).done(function () {
                    r.render(null, "layuiadmin-form-checkout"), r.on("submit(LAY-checkout-back-submit)", function (e) {
                        layui.admin.req({
                            type: "post",
                            url: "/checkout_edit/",
                            data: e.field,
                            dataType: "json",
                            success: function (r) {
                                layer.alert(r.msg);
                                layui.table.reload("LAY-checkout-back-manage");
                            }
                        }), layer.close(i)
                    })
                })
            }
        })
    }),
        // 收支管理
        l.render({//收支管理的表格
            elem: "#LAY-income-back-manage",
            url: "/incomes/",
            cols: [[
                {type: "checkbox", fixed: "left"},
                {field: "id", width: 80, title: "编号", sort: !0},
                {
                    field: "money",
                    title: "金额"
                }, {
                    field: "type",
                    title: "收/支",
                    templet: "#typeTpl"
                }, {
                    field: "create_time",
                    title: "发生时间"
                }, {
                    field: "in_type",
                    title: "支付类型",
                    templet: "#intypeTpl"
                }, {
                    field: "remark",
                    title: "备注"
                },
                {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-income-admin"}]],
            text: "对不起，加载出现异常！"
        }), l.on("tool(LAY-income-back-manage)", function (e) {
        var l = e.data;
        "del" === e.event ? layer.confirm("确定删除？", function (i) {
            //提交 Ajax 成功后，关闭当前弹层并重载表格
            layui.admin.req({
                type: "POST",
                url: "/checkout/",
                data: {"id": l.id},
                dataType: "json",
                success: function (r) {
                    layer.alert(r.msg);
                    layui.table.reload("LAY-income-back-manage");
                }
            })
                , e.del()
                , layer.close(i)
        }) : "edit" === e.event && i.popup({
            title: "编辑收支信息",
            area: ['850px', '600px'],
            id: "LAY-popup-checkout-add",
            success: function (e, i) {
                t(this.id).render("hotelMange/income/addform", l).done(function () {
                    r.render(null, "layuiadmin-form-income"), r.on("submit(LAY-income-back-submit)", function (e) {
                        layui.admin.req({
                            type: "post",
                            url: "/checkout_edit/",
                            data: e.field,
                            dataType: "json",
                            success: function (r) {
                                layer.alert(r.msg);
                                layui.table.reload("LAY-income-back-manage");
                            }
                        }), layer.close(i)
                    })
                })
            }
        })
    }),
        e("hotelmanage", {})
});