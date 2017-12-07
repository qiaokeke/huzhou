$(function() {
    var voltage_current;
    var chart_water;
    /*窗口变化时重绘*/
    var reset = setTimeout(function() {
        window.onresize = function() {
            voltage_current.resize();
            chart_water.resize();
        }
    }, 200);

    /*厂房电压电流*/
    voltage_current = echarts.init(document.getElementById('voltage_current'));
    voltage_current.showLoading();
    var colors = ['#5793f3', '#d14a61', '#675bba'];
    option = {
        color: colors,
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross'
            }
        },
        grid: {
            right: '20%'
        },
        toolbox: {
            feature: {
                dataView: { show: true, readOnly: false },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        title: {
            text: '厂房电压电流值'
        },
        legend: {
            data: ['电压值', '电流值']
        },
        xAxis: [{
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            data: ['12:00', '12:10', '12:20', '12:30', '12:40', '12:50', '13:00', '13:10', '13:20', '13:30', '13:40', '13:50']
        }],
        yAxis: [{
                type: 'value',
                name: '电流值',
                min: 0,
                max: 250,
                position: 'right',
                // offset: 80,
                axisLine: {
                    lineStyle: {
                        color: colors[1]
                    }
                },
                axisLabel: {
                    formatter: '{value} A'
                }
            },
            {
                type: 'value',
                name: '电压值',
                min: 0,
                max: 250,
                position: 'left',
                axisLine: {
                    lineStyle: {
                        color: colors[2]
                    }
                },
                axisLabel: {
                    formatter: '{value} V'
                }
            }
        ],
        series: [{
                name: '电压值',
                type: 'bar',
                data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
            },
            {
                name: '电流值',
                type: 'bar',
                yAxisIndex: 1,
                data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
            }
        ]
    };
    voltage_current.hideLoading();
    voltage_current.setOption(option);


    /*水能耗*/
    chart_water = echarts.init(document.getElementById('water_data'));
    option = {
        title: {
            text: '水能耗',
            subtext: '单位：（立方米）'
        },
        tooltip: {
            trigger: 'axis'
        },
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: true,
        xAxis: [{
            type: 'category',
            data: ['8-8', '8-9', '8-10', '8-11', '8-12', '8-13', '8-14', '8-15', '8-16', '8-17', '8-18', '8-19']
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: '水能耗',
            type: 'bar',
            data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
            markLine: {
                data: [{type : 'average', name : '平均值', itemStyle:{normal:{color:'green'}}}
                ]
            },
            itemStyle: {
                normal: {
                    color: "#60C0DD"
                }
            }
        }, {
            name: '折线',
            type: 'line',
            itemStyle: { 
                normal: {
                    /* color:'#c4cddc'*/
                }
            },
            data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
        }]
    };
    chart_water.setOption(option);
});