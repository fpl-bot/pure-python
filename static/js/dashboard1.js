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
    }); //Line Chart in the header to quickly indicate warning record.

    function dashboard() {
        "use strict";
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
                }); //Bar Chart
                chart2.on('draw', function (data) {
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
                });                          //Bar chart animation

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
                $("#signal_collected_day").text(data.signal_time);                 //Line chart for signal


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
                });              //Dunt chart
            },
            error: function () {
                alert('Error: Ajax request failed')
            }
        });//Bar,Line,Dunt Chart in Dashboard

    }

    dashboard();
    timeTicket = setInterval(dashboard, 20000);

    $.ajax({
            type: "get",
            url: "/assets/calender",
            async: true,
            dataType: "json",
            success: function (data) {
                var calender = echarts.init(document.getElementById('calender'));
                var calender_option = {
                    backgroundColor: '#ffffff',

                    title: {
                        top: 30,
                        text: 'Warning log count in 2018',
                        subtext: 'Equipment Group/Machine/Component',
                        left: 'center',
                        textStyle: {
                            color: '#000000'
                        }
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        top: '30',
                        left: '30',
                        data: ['Warning count', 'Top 5'],
                        textStyle: {
                            color: '#000000'
                        }
                    },
                    calendar: [{
                        top: 100,
                        left: 'center',
                        range: ['2018-01-01', '2018-06-30'],
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#000',
                                width: 4,
                                type: 'solid'
                            }
                        },
                        yearLabel: {
                            formatter: '{start}  1st',
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#323c48',
                                borderWidth: 1,
                                borderColor: '#111'
                            }
                        }
                    }, {
                        top: 340,
                        left: 'center',
                        range: ['2018-07-01', '2018-12-31'],
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#000',
                                width: 4,
                                type: 'solid'
                            }
                        },
                        yearLabel: {
                            formatter: '{start}  2nd',
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#323c48',
                                borderWidth: 1,
                                borderColor: '#111'
                            }
                        }
                    }],
                    series: [
                        {
                            name: 'Warning count',
                            type: 'scatter',
                            coordinateSystem: 'calendar',
                            data: data.calender,
                            symbolSize: function (val) {
                                return val[1] * 5;
                            },
                            itemStyle: {
                                normal: {
                                    color: '#f4e925'
                                }
                            }
                        },
                        {
                            name: 'Warning count',
                            type: 'scatter',
                            coordinateSystem: 'calendar',
                            calendarIndex: 1,
                            data: data.calender,
                            symbolSize: function (val) {
                                return val[1] * 5;
                            },
                            itemStyle: {
                                normal: {
                                    color: '#f4e925'
                                }
                            }
                        },
                        {
                            name: 'Top 5',
                            type: 'effectScatter',
                            coordinateSystem: 'calendar',
                            calendarIndex: 1,
                            data: data.calender.sort(function (a, b) {
                                return b[1] - a[1];
                            }).slice(0, 5),
                            symbolSize: function (val) {
                                return val[1] * 10;
                            },
                            showEffectOn: 'render',
                            rippleEffect: {
                                brushType: 'stroke'
                            },
                            hoverAnimation: true,
                            itemStyle: {
                                normal: {
                                    color: '#f45440',
                                    shadowBlur: 10,
                                    shadowColor: '#333'
                                }
                            },
                            zlevel: 1
                        },
                        {
                            name: 'Top 5',
                            type: 'effectScatter',
                            coordinateSystem: 'calendar',
                            data: data.calender.sort(function (a, b) {
                                return b[1] - a[1];
                            }).slice(0, 5),
                            symbolSize: function (val) {
                                return val[1] * 10;
                            },
                            showEffectOn: 'render',
                            rippleEffect: {
                                brushType: 'stroke'
                            },
                            hoverAnimation: true,
                            itemStyle: {
                                normal: {
                                    color: '#f45440',
                                    shadowBlur: 10,
                                    shadowColor: '#333'
                                }
                            },
                            zlevel: 1
                        }
                    ]
                };
                if (calender_option && typeof calender_option === "object") {
                    calender.setOption(calender_option, true), $(function () {
                        function resize() {
                            setTimeout(function () {
                                calender.resize()
                            }, 100)
                        }

                        $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                    });
                }
            }
        } // Warning log calender
    );

});