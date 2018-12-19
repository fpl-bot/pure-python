/*
Template Name: Material Pro Admin
Author: Themedesigner
Email: niravjoshi87@gmail.com
File: js
*/

// ==============================================================
// This is for the sparkline charts which is coming in the bradcrumb section
// ==============================================================
$(document).ready(function () {
    $('#monthchart').sparkline(WarningLogCount, {
        type: 'bar',
        height: '35',
        barWidth: '4',
        resize: true,
        barSpacing: '4',
        barColor: '#1e88e5'
    });
    $('#lastmonthchart').sparkline(WarningLogCount, {
        type: 'bar',
        height: '35',
        barWidth: '4',
        resize: true,
        barSpacing: '4',
        barColor: '#7460ee'
    });

    function dashboard() {
        "use strict";
        // ==============================================================
        // Sales overview
        // ==============================================================
        $.ajax({
            type: "get",
            url: "/assets/dashboard",
            async: true,
            dataType: "json",
            success: function (data) {

                var chart2 = new Chartist.Bar('.amp-pxl', {
                    labels: ['Equipment Groups', 'Machines', 'Components', 'Sensors'],
                    series: [
                        data.health_equip,
                        data.abnormal_equip
                    ]
                }, {
                    axisX: {
                        // On the x-axis start means top and end means bottom
                        position: 'end',
                        showGrid: false
                    },
                    axisY: {
                        // On the y-axis start means left and end means right
                        position: 'start'
                    },
                    high: '12',
                    low: '0',
                    plugins: [
                        Chartist.plugins.tooltip()
                    ]
                });
                // ==============================================================
                // Newsletter
                // ==============================================================

                var myChart_net_grow = echarts.init(document.getElementById('signalpresentation'));
                var option_net_grow = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            label: {
                                backgroundColor: '#6a7985'
                            }
                        }
                    },
                    title: {
                        text: '',
                        subtext: '',
                    },
                    xAxis: {
                        type: 'category',
                        data: data.signal_timelabel
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    yAxis: {
                        type: 'value',
                    },
                    dataZoom: [
                        {
                            type: 'slider',
                            show: true,
                            xAxisIndex: [0],
                            start: 0,
                            end: 10
                        },
                        {
                            type: 'inside',
                            xAxisIndex: [0],
                            start: 1,
                            end: 100
                        },
                    ],
                    series: [
                        {
                            title: '',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#15f6b6'},
                                            {offset: 0.5, color: '#6cf0f0'},
                                            {offset: 1, color: '#188df0'}
                                        ]
                                    )
                                },
                                emphasis: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#2378f7'},
                                            {offset: 0.7, color: '#2378f7'},
                                            {offset: 1, color: '#83bff6'}
                                        ]
                                    )
                                }
                            },
                            data: data.signal_sample,

                        }],
                };
                if (option_net_grow && typeof option_net_grow === "object") {
                    myChart_net_grow.setOption(option_net_grow, true), $(function () {
                        function resize() {
                            setTimeout(function () {
                                myChart_net_grow.resize()
                            }, 100)
                        }

                        $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                    });
                }
                $("#signal_collected_day").text(data.signal_time);


                var chart = [chart2];

                // ==============================================================
                // This is for the animation
                // ==============================================================

                for (var i = 0; i < chart.length; i++) {
                    chart[i].on('draw', function (data) {
                        if (data.type === 'line' || data.type === 'area') {
                            data.element.animate({
                                d: {
                                    begin: 500 * data.index,
                                    dur: 500,
                                    from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                    to: data.path.clone().stringify(),
                                    easing: Chartist.Svg.Easing.easeInOutElastic
                                }
                            });
                        }
                        if (data.type === 'bar') {
                            data.element.animate({
                                y2: {
                                    dur: 500,
                                    from: data.y1,
                                    to: data.y2,
                                    easing: Chartist.Svg.Easing.easeInOutElastic
                                },
                                opacity: {
                                    dur: 500,
                                    from: 0,
                                    to: 1,
                                    easing: Chartist.Svg.Easing.easeInOutElastic
                                }
                            });
                        }
                    });
                }
                var duntchart = c3.generate({
                    bindto: '#visitor',
                    data: {
                        columns: [
                            ['Equipment Group', data.assets_statisitic[0]],
                            ['Machine', data.assets_statisitic[1]],
                            ['Component', data.assets_statisitic[2]],
                            ['Sensor', data.assets_statisitic[3]],
                        ],

                        type: 'donut',
                        onclick: function (d, i) {
                            console.log("onclick", d, i);
                        },
                        onmouseover: function (d, i) {
                            console.log("onmouseover", d, i);
                        },
                        onmouseout: function (d, i) {
                            console.log("onmouseout", d, i);
                        }
                    },
                    donut: {
                        label: {
                            show: false
                        },
                        title: "Assets statistic",
                        width: 20,

                    },

                    legend: {
                        hide: true
                        //or hide: 'data1'
                        //or hide: ['data1', 'data2']
                    },
                    color: {
                        pattern: ['#eceff1', '#745af2', '#26c6da', '#1e88e5']
                    }
                });
            },
            error: function () {
                alert('Error: ajax 请求出错！')
            }
        });


        // ==============================================================
        // Our visitor
        // ==============================================================


        // ==============================================================
        // Badnwidth usage
        // ==============================================================
        new Chartist.Line('.usage', {
            labels: ['0', '4', '8', '12', '16', '20', '24', '30']
            , series: [
                [5, 0, 12, 1, 8, 3, 12, 15]

            ]
        }, {
            high: 10
            , low: 0
            , showArea: true
            , fullWidth: true
            , plugins: [
                Chartist.plugins.tooltip()
            ], // As this is axis specific we need to tell Chartist to use whole numbers only on the concerned axis
            axisY: {
                onlyInteger: true
                , offset: 20
                , showLabel: false
                , showGrid: false
                , labelInterpolationFnc: function (value) {
                    return (value / 1) + 'k';
                }
            }
            , axisX: {
                showLabel: false
                , divisor: 1
                , showGrid: false
                , offset: 0
            }
        });
        // ==============================================================
        // Download count
        // ==============================================================
        var sparklineLogin = function () {
            $('.spark-count').sparkline([4, 5, 0, 10, 9, 12, 4, 9, 4, 5, 3, 10, 9, 12, 10, 9, 12, 4, 9], {
                type: 'bar'
                , width: '100%'
                , height: '70'
                , barWidth: '2'
                , resize: true
                , barSpacing: '6'
                , barColor: 'rgba(255, 255, 255, 0.3)'
            });

        };
        var sparkResize;

        sparklineLogin();


    }

    dashboard();
    timeTicket = setInterval(dashboard, 20000);
});