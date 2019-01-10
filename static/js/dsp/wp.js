$(function () {
    "use strict";
    // ==============================================================
    // Sales overview
    // ==============================================================
    $.ajax({
        type: "get",
        url: "/assets/wp",
        dataType: "json",
        success: function (data) {

            var myChart_fft = echarts.init(document.getElementById('WP-Transformed'));
            var option_fft = {
                tooltip: {},
                title: {
                    text: 'Wavelet Package Spectrum',
                    subtext: '',
                },
                visualMap: {
                    type: 'continuous',
                    min: 0,
                    max: 2,
                    calculable: true,
                    realtime: false,
                    inRange: {
                        color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
                    }
                },

                xAxis: {
                    type: 'category',
                    data: data.y
                },
                yAxis: {
                    type: 'category',
                    data: data.x
                },
                series: [{
                    name: 'STFT',
                    type: 'heatmap',
                    data: data.wp,
                    itemStyle: {
                        emphasis: {
                            borderColor: '#333',
                            borderWidth: 1,
                        }
                    },
                    progressive: 1000,
                    animation: false
                }]
            };
            if (option_fft && typeof option_fft === "object") {
                myChart_fft.setOption(option_fft, true), $(function () {
                    function resize() {
                        setTimeout(function () {
                            myChart_fft.resize()
                        }, 100)
                    }

                    $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                });
            }
            var myChart_wave = echarts.init(document.getElementById('WP-Original'));
            var option_wave = {
                title: {
                    text: 'Original time domain waveform',
                    subtext: '',
                },
                xAxis: {
                    type: 'category',
                    data: data.Original_X
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
                        end: 100
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
                        data: data.Original_Y,

                    }],
            };
            if (option_wave && typeof option_wave === "object") {
                myChart_wave.setOption(option_wave, true), $(function () {
                    function resize() {
                        setTimeout(function () {
                            myChart_wave.resize()
                        }, 100)
                    }

                    $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                });
            }
            $("#signal_collected_day").text(data.signal_time);
        },
    }); //wp ajax request

});