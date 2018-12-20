$(function () {
    "use strict";
    // ==============================================================
    // Sales overview
    // ==============================================================
    $.ajax({
        type: "get",
        url: "/assets/tv",
        dataType: "json",
        success: function (data) {
            var treeview_Chart = echarts.init(document.getElementById('Treeview'));
            echarts.util.each(data.children, function (datum, index) {
                index % 2 === 0 && (datum.collapsed = true);
            });
            treeview_Chart.on("dblclick", clickFun);

            var option = {
                tooltip: {
                    trigger: 'item',
                    triggerOn: 'mousemove'
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    },
                    right:'4%'
                },
                series: [
                    {
                        type: 'tree',
                        data: [data],

                        top: '1%',
                        left: '20%',
                        bottom: '1%',
                        right: '20%',

                        symbolSize: 20,
                        symbol: 'diamond',
                        label: {
                            normal: {
                                position: 'left',
                                verticalAlign: 'middle',
                                align: 'right',
                                fontSize: 12,
                                fontFamily: 'Microsoft YaHei',
                                fontWeight: 'bolder',
                                distance: 10,
                            }
                        },

                        leaves: {
                            label: {
                                normal: {
                                    position: 'right',
                                    verticalAlign: 'middle',
                                    align: 'left'
                                }
                            }
                        },
                        itemStyle: {
                            color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [{
                                    offset: 0, color: '#d2dcf9' // 0% 处的颜色
                                }, {
                                    offset: 1, color: '#26a2cc' // 100% 处的颜色
                                }],
                                globalCoord: false // 缺省为 false
                            },
                            borderColor: '#000000',
                        },


                        expandAndCollapse: true,
                        animationDuration: 550,
                        animationDurationUpdate: 750
                    }
                ]
            };
            if (option && typeof option === "object") {
                treeview_Chart.setOption(option, true), $(function () {
                    function resize() {
                        setTimeout(function () {
                            treeview_Chart.resize()
                        }, 100)
                    }

                    $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                });
            }

            function clickFun(param) {
                if (typeof param.seriesIndex == 'undefined') {
                    return;
                }
                if (param.type == 'dblclick') {
                    alert(param.data.label);
                }
            }

        },
    }); //tree view ajax request

});