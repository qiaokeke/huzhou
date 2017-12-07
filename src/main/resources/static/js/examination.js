$(function() {
    // 显示不同企业类型消耗能源占比
    var rateCompany = echarts.init(document.getElementById('chart1'));
    pieOption1 = {
        title: {
            // text: '企业类型耗能占比',
            textAlign: 'left',
            textStyle: {
                // color: 'white',
                fontSize: 20
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'right',
            width: '20%',
            right: 0,
            data: ['节能环保', '工业科技', '装备制造', '物流配送', '电子商务'],
            textStyle: {
                // color: 'white',
                fontSize: 12
            }
        },
        series: [{
            name: '企业能耗占比',
            type: 'pie',
            radius: '55%',
            center: ['40%', '50%'],
            labelLine: {
                normal: {
                    lineStyle: {
                        // color: '#fff'
                    }
                }
            },
            data: [
                { value: 32, name: '节能环保' },
                { value: 30, name: '工业科技' },
                { value: 9, name: '装备制造' },
                { value: 6, name: '物流配送' },
                { value: 7, name: '电子商务' }
            ],
            itemStyle: {
                normal: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)',
                    label: {
                        show: true,
                        formatter: '{c} \n {d}%'
                    }
                }
            },
            label: {
                normal: {
                    textStyle: {
                        // color: 'white',
                        fontSize: 14,
                        fontWeight: 'bold'
                    }
                }
            }
        }]
    };
    rateCompany.setOption(pieOption1);

    /*厂区对比*/
    var rateFactory = echarts.init(document.getElementById('chart2'));
    pieOption2 = {
        /* title: {
             text: '企业分类'
         },*/
        tooltip: {},
        legend: {
            data: ['该公司', '同行业']
        },
        radar: {
            // shape: 'circle',
            indicator: [
                { name: '1月', max: 6500 },
                { name: '2月', max: 30000 },
                { name: '3月', max: 38000 },
                { name: '4月', max: 52000 },
                { name: '5月', max: 25000 },
                { name: '6月', max: 25000 },
                { name: '7月', max: 25000 },
                { name: '8月', max: 25000 },
                { name: '9月', max: 26000 },
                { name: '10月', max: 26500 },
                { name: '11月', max: 26500 },
                { name: '12月', max: 26500 }
            ]
        },
        series: [{

            type: 'radar',
            // areaStyle: {normal: {}},
            data: [{
                    value: [4300, 10000, 24000, 29000, 20000, 19000, 19000, 0, 0, 0, 0, 0],
                    name: '该公司'
                },
                {
                    value: [5000, 14000, 28000, 31000, 22000, 23000, 23000, 0, 0, 0, 0, 0],
                    name: '同行业'
                }
            ]
        }]
    };
    rateFactory.setOption(pieOption2);


    var powerAll = echarts.init(document.getElementById('power-all'));
    option3 = {
        tooltip: {
            trigger: 'axis',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
                type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: ['尖能耗', '峰能耗', '谷能耗', '总能耗']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value'
        },
        yAxis: {
            type: 'category',
            data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月']
        },
        series: [{
                name: '尖能耗',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                //                    data: [320, 302, 301, 334, 390, 330, 320,345]
                data: [320, 302, 301, 334, 390, 370, 380,342]
            },
            {
                name: '峰能耗',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                //                    data: [120, 132, 101, 134, 90, 230, 210]
                data: [120, 132, 101, 134, 90, 110, 116,124]
            },
            {
                name: '谷能耗',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [220, 182, 191, 234, 290, 300, 322,333]
                //                    data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '总能耗',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                //                    data: [150, 212, 201, 154, 190, 330, 410]
                data: [150, 212, 201, 154, 190, 195, 202,201]
            }

        ]
    };
    powerAll.setOption(option3);

    /*窗口变化时重绘*/
    var reset = setTimeout(function() {
        window.onresize = function() {
            rateCompany.resize();
            rateFactory.resize();
            powerAll.resize();
        }
    }, 200)
})