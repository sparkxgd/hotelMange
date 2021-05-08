/** layuiAdmin.pro-v1.2.1 LPPL License By http://www.layui.com/admin/ */
;layui.define(function (e) {
    var a = layui.admin;
    layui.use(["admin", "carousel"], function () {
        var e = layui.$, a = (layui.admin, layui.carousel), l = layui.element, t = layui.device();
        e(".layadmin-carousel").each(function () {
            var l = e(this);
            a.render({
                elem: this,
                width: "100%",
                arrow: "none",
                interval: l.data("interval"),
                autoplay: l.data("autoplay") === !0,
                trigger: t.ios || t.android ? "click" : "hover",
                anim: l.data("anim")
            })
        }), l.render("progress")
    }), layui.use(["carousel", "echarts"], function () {
        var e = layui.$, a = (layui.carousel, layui.echarts), l = [], i = e("#LAY-index-pagetwo").children("div"),
            n = function (e) {
                l[e] = a.init(i[e], layui.echartsTheme);
                layui.admin.req({
                    type: "POST",
                    url: "/getTotalForEchartYear/",
                    data: {},
                    dataType: "json",
                    success: function (r) {
                        var op = {
                            tooltip: {trigger: "axis"},
                            calculable: !0,
                            legend: {data: ["入住数", "收入金额"]},
                            xAxis: [{
                                type: "category",
                                data:  r.day_data.dayName
                            }],
                            yAxis: [{type: "value", name: "访问量", axisLabel: {formatter: "{value} "}}, {
                                type: "value",
                                name: "收入金额",
                                axisLabel: {formatter: "{value} "}
                            }],
                            series: [{
                                name: "入住数",
                                type: "line",
                                data: r.day_data.dayNum
                            }, {
                                name: "收入金额",
                                type: "line",
                                yAxisIndex: 1,
                                data: r.money_data.num
                            }]
                        };
                        var t = [op];
                        l[e].setOption(t[e]);
                        window.onresize = l[e].resize;
                    }
                });
            };
        i[0] && n(0)
    }), layui.use(["carousel", "echarts"], function () {
        var e = layui.$, a = (layui.carousel, layui.echarts), l = [],
            i = e("#LAY-checkinchart-pageone").children("div"), n = function (e) {
                l[e] = a.init(i[e], layui.echartsTheme);
                layui.admin.req({
                    type: "POST",
                    url: "/getCheckinNumForEchartMonth/",
                    data: {},
                    dataType: "json",
                    success: function (r) {
                        var op = {
                            grid: {
                                left: '1%',
                                right: '1%',
                                bottom: '1%',
                                containLabel: false
                            },
                            tooltip: {trigger: "axis"},
                            calculable: !0,
                            legend: {data: ["入住量"]},
                            xAxis: [{
                                type: "category",
                                axisLabel: {interval: 0, rotate: -50},
                                data: r.data.dayName
                            }],
                            yAxis: [{
                                type: "value", name: "入住量(人)", axisLabel: {formatter: "{value}"}
                            }],
                            series: [{
                                name: "入住量",
                                type: "line",
                                data: r.data.dayNum
                            }]
                        };
                        var t = [op];
                        l[e].setOption(t[e]);
                        window.onresize = l[e].resize;
                    }
                });
            };
        i[0] && n(0)
    }), layui.use(["carousel", "echarts"], function () {
        var e = layui.$, a = (layui.carousel, layui.echarts), l = [],
            i = e("#LAY-checkinchart-pagetwo").children("div"), n = function (e) {
                l[e] = a.init(i[e], layui.echartsTheme);
                layui.admin.req({
                    type: "POST",
                    url: "/getCheckinNumForEchartYear/",
                    data: {},
                    dataType: "json",
                    success: function (r) {
                        var op = {
                            grid: {
                                left: '1%',
                                right: '1%',
                                bottom: '1%',
                                containLabel: false
                            },
                            tooltip: {trigger: "axis"},
                            calculable: !0,
                            legend: {data: ["入住量"]},
                            xAxis: [{
                                type: "category",
                                axisLabel: {interval: 0, rotate: -50},
                                data: r.data.dayName
                            }],
                            yAxis: [{
                                type: "value", name: "入住量(人)", axisLabel: {formatter: "{value}"}
                            }],
                            series: [{
                                name: "入住量",
                                type: "line",
                                data: r.data.dayNum
                            }]
                        };
                        var t = [op];
                        l[e].setOption(t[e]);
                        window.onresize = l[e].resize;
                    }
                });
            };
        i[0] && n(0)
    }), layui.use(["carousel", "echarts"], function () {
        var e = layui.$, a = (layui.carousel, layui.echarts), l = [], i = e("#LAY-incomechart-pagetwo").children("div"),
            n = function (e) {
                l[e] = a.init(i[e], layui.echartsTheme);
                layui.admin.req({
                    type: "POST",
                    url: "/getIncomeNumForEchartYear/",
                    data: {},
                    dataType: "json",
                    success: function (r) {
                        var op = {
                            grid: {
                                left: '1%',
                                right: '1%',
                                bottom: '1%',
                                containLabel: false
                            },
                            tooltip: {trigger: "axis"},
                            calculable: !0,
                            legend: {data: ["收入"]},
                            xAxis: [{
                                type: "category",
                                axisLabel: {interval: 0, rotate: -50},
                                data: r.data.dayName
                            }],
                            yAxis: [{
                                type: "value", name: "收入(元)", axisLabel: {formatter: "{value}"}
                            }],
                            series: [{
                                name: "收入",
                                type: "line",
                                data: r.data.dayNum
                            }]
                        };
                        var t = [op];
                        l[e].setOption(t[e]);
                        window.onresize = l[e].resize;
                    }
                });
            };
        i[0] && n(0)
    }), e("checkinchart", {})
});