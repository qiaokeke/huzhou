var num = 17127;
var consumption;
var myChart;
var weChart;
var bannerPies;
var dashbord;
var voltageCurrent;

$(function () {
    $(".wrap").css('height', $(window).height());

    /*窗口发生改变时改变高度*/
    $(window).resize(function () {
        $(".wrap").css('height', $(window).height());
    });
    setInterval("clock()", 1000);
    item3();
    showUserProportion();
    showEnergyProportion();
    showUserEnergyProportion();
    chartOne();
    bannerPie();
    bannerDashboard();
    showWE();
    getCoal();
    getConsumptionSort();
    getConsumptionTop5()

    /*窗口变化时重绘*/
    var reset = setTimeout(function () {
        window.onresize = function () {
            consumption.resize();
            myChart.resize();
            // voltageCurrent.resize();
            dashbord.resize();
            bannerPies.resize();
            weChart.resize();
        }
    }, 200)
})

function clock() {
    var now = new Date().toLocaleString();
    $(".now").html(now);
}

//获取当年能耗
function getCoal() {
    $.ajax({
        url: '/company/getCoal',
        dataType: 'json',
        success: function (myJson) {
            var arrayL = [0, 0, 0, 0, 0, 0];
            var arrayR = [0, 0];
            var strJson = myJson.coal.split('.');
            var lenL = strJson[0].length;
            var lenR = strJson[1].length;
            lenL = lenL >= 6 ? 6 : lenL;
            lenR = lenR >= 2 ? 2 : lenR;
            for (var i = 0; i < lenR; i++) {
                arrayR[i] = strJson[1][i];
            }
            for (var i = 0; i < lenL; i++) {
                arrayL[6 - lenL + i] = strJson[0][i];
            }
            for (var i = 0; i < 6; i++) {
                var indexLi = i + 1;
                $("#coal li:nth-child(" + indexLi + ")").html(arrayL[i]);
            }
            for (var i = 0; i < 2; i++) {
                var indexLi = i + 8;
                $("#coal li:nth-child(" + indexLi + ")").html(arrayR[i]);
            }
        },
        error: function () {
            console.log("当年能耗json获取失败！");
        }
    });
}

//设置一分钟重新获取一次当年能耗
setInterval("getCoal()", 60000);

/*能耗走势图*/
function chartOne() {
    consumption = echarts.init(document.getElementById('left-middle'));
    lineOption1 = {
        textStyle: {
            color: 'white'
        },
        grid: {
            containLabel: true,
            bottom: '10%',
            right: '5%',
            left: '5%',
            top: '18%'
        },
        title: {text: '能耗走势图', textStyle: {color: '#fff'}},
        tooltip: {trigger: 'axis'},
        legend: {data: ['水', '电'], textStyle: {color: '#fff'}},
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['八月', '九月', '十月','十一月','十二月']
        },
        yAxis: [{
            type: 'value',
            min: 0,
            max: 1000,
            name: '吨'
        },
            {
                type: 'value',
                min: 0,
                max: 1000,
                name: 'kwh'
            }
        ],
        series: [{
            name: '水',
            type: 'line',
            yAxisIndex: 0,
            data: [522, 513, 654, 485, 666, 789],
            itemStyle: {
                normal: {
                    color: '#65D4E5'
                }
            }
        },
            {
                name: '电',
                type: 'line',
                yAxisIndex: 1,
                data: [465, 496, 796, 323, 468, 798],
                itemStyle: {
                    normal: {
                        color: '#F78C00'
                    }
                }
            }
        ]
    };
    consumption.setOption(lineOption1);
}

function chartTwo() {
    // chart2 = echarts.init(document.getElementById('left-bottom'));
    lineOption2 = {

        textStyle: {
            color: 'white'
        },
        grid: {
            containLabel: true,
            left: 0
        },
        title: {text: '行业能耗', textStyle: {color: '#fff'}},
        tooltip: {trigger: 'axis'},
        legend: {data: ['节能炤具', '信息科技', '环保贸易'], textStyle: {color: '#fff'}, bottom: 0},
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['五月', '六月', '七月']
        },
        yAxis: {
            type: 'value',
            min: 0,
            max: 1000,
            name: '吨标煤'
        },
        series: [{
            name: '节能炤具',
            type: 'line',
            data: [468, 798, 465, 899, 546, 878],
            itemStyle: {
                normal: {
                    color: '#7CF4F3'
                }
            }
        },
            {
                name: '信息科技',
                type: 'line',
                data: [545, 478, 465, 784, 646, 878],
                itemStyle: {
                    normal: {
                        color: '#fff'
                    }
                }
            },
            {
                name: '环保贸易',
                type: 'line',
                data: [484, 446, 654, 485, 465, 656],
                itemStyle: {
                    normal: {
                        color: '#F78C00'
                    }
                }
            }
        ]
    };
    // chart2.setOption(lineOption2);
}

/*能耗榜单*/
function item3() {
    myChart = echarts.init(document.getElementById('right-bottom'));
    option3 = {
        title: {
            text: '能耗榜单',
            textAlign: 'center',
            x: 'center',
            textStyle: {
                color: 'white',
                fontSize: 20
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: <br/> {c}"
        },
        textStyle: {
            color: '#fff',
            fontSize: 20
        },
        grid: {
            show: false,
            left: 40,
            right: 40,
            top: 40,
            bottom: 0
        },
        xAxis: {
            show: false
        },
        yAxis: {
            data: [],
            show: false
        },
        series: [{
            name: '',
            type: 'bar',
            data: [{
                name: 'NO.5 湖州凯研生物科技有限公司',
                value: 180
            }, {
                name: 'NO.4 湖州优创电子商务有限公司',
                value: 280
            }, {
                name: 'NO.3 湖州舒乐网络科技有限公司',
                value: 380
            }, {
                name: 'NO.2 湖州恩赐智能科技有限公司',
                value: 480
            }, {
                name: 'NO.1 湖州丽锦环保科技有限公司',
                value: 580
            }],
            itemStyle: {
                normal: {
                    color: '#7CF4F3'
                }
            },
            label: {
                normal: {
                    show: true,
                    position: 'topLeft',
                    formatter: '{b}'
                }
            },
            barWidth: '10%'
        }]
    };
    myChart.setOption(option3);
}
//获取实时能耗排行
function getConsumptionSort() {
    $.ajax({
        url: '/company/getEConsumption',
        dataType: 'json',
        success: function (myJson) {
            for (var i = 0; i < myJson.length; i++) {
                var index = i + 1;
                $("#cons").append('<tr class=\"text-center\"><td><span class=\"badge\">' + index + '</span></td><td>' + myJson[i].eName + '</td><td>' + myJson[i].consumption + '</td><td>' + myJson[i].water + '</td></tr>');
            }
        }
    })
}

function getConsumptionTop5() {
    $.ajax({
        url: '/company/getTop5Company',
        dataType: 'json',
        success: function (myJson) {
            // for (var i = 0; i < myJson.length; i++) {
            //     var index = i + 1;
            //    $("#cons").append('<tr class=\"text-center\"><td><span class=\"badge\">'+index+'</span></td><td>'+myJson[i].eName+'</td><td>'+myJson[i].consumption+'</td><td>'+myJson[i].water+'</td></tr>');
            // }
            // $("#needWrap").wrap('<marquee id=\"affiche\" align=\"left\" behavior=\"scroll\" direction=\"up\" width=\"100%\" hspace=\"50\" vspace=\"20\" loop=\"-1\" scrollamount=\"3\" scrolldelay=\"100\" onMouseOut=\"this.start()\" onMouseOver=\"this.stop()\"></marquee>');
            //能耗榜单前五名
            myChart.setOption({
                series: [{
                    name: '',
                    data: [{
                        name: "NO.5 " + myJson[4].companyName,
                        value: myJson[4].pZXYGDN
                    }, {
                        name: "NO.4 " + myJson[3].companyName,
                        value: myJson[3].pZXYGDN
                    }, {
                        name: "NO.3 " + myJson[2].companyName,
                        value: myJson[2].pZXYGDN
                    }, {
                        name: "NO.2 " + myJson[1].companyName,
                        value: myJson[1].pZXYGDN
                    }, {
                        name: "NO.1 " + myJson[0].companyName,
                        value: myJson[0].pZXYGDN
                    }]
                }]
            });
        },
        error: function () {
            console.log("能耗排行json数据获取失败！");
        }
    });
}


/*显示用户占比*/
function showUserProportion() {
    pieOption4 = {
        title: {
            text: '企业类型',
            x: 'left',
            textStyle: {
                color: 'white',
                fontSize: 18,
                fontWight: 'bold'
            }
        },
        legend: {
            orient: 'vertical',
            left: 'right',
            width: '20%',
            right: 0,
            data: ['节能环保', '工业科技', '装备制造', '物流配送', '电子商务'],
            textStyle: {
                color: 'white',
                fontSize: 12
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        //color: ['rgb(101,212,229)', 'white', 'rgb(247,140,0)'],
        calculable: true,
        series: [{
            name: '用户占比',
            type: 'pie',
            radius: ['30%', '50%'],
            center: ['50%', '50%'],
            itemStyle: {
                normal: {
                    label: {
                        show: false
                    },
                    labelLine: {
                        show: false
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                        position: 'center',
                        textStyle: {
                            fontSize: '20',
                            fontWeight: 'bold'
                        }
                    }
                }
            },
            data: [
                {value: 16, name: '节能环保'},
                {value: 15, name: '工业科技'},
                {value: 3, name: '装备制造'},
                {value: 1, name: '物流配送'},
                {value: 1, name: '电子商务'}
            ],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        formatter: '{d}%'
                    },
                    labelLine: {
                        show: true
                    }
                }
            },
            label: {
                normal: {
                    textStyle: {
                        color: 'white',
                        fontSize: 12
                        // fontWeight: 'bold'
                    }
                }
            }
        }]
    };
}

// 显示消耗能源占比
function showEnergyProportion() {
    pieOption5 = {
        title: {
            text: '能源消耗占比',
            x: 'left',
            textStyle: {
                color: 'white',
                fontSize: 20,
                fontWeight: 'bold'
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x: 'right',
            orient: 'vertical',
            y: 'top',
            data: ['电能', '水能'],
            textStyle: { //控制图例颜色
                color: 'white',
                fontWeight: 'bold',
                fontSize: 12
            }
        },
        color: [/*'rgb(247,140,0)', */ 'rgb(242,7,100)', 'rgb(135,0,242)'],
        calculable: true,
        series: [{
            name: '能源占比',
            type: 'pie',
            radius: ['15%', '60%'],
            center: ['40%', '50%'],
            roseType: 'radius', //半径模式
            // x: '50%',
            sort: 'ascending',
            labelLine: {
                normal: {
                    /*                    length: 10,
                     length2: 10,*/
                    lineStyle: {
                        color: '#fff'
                    }
                }
            },
            data: [{
                value: 85,
                name: '电能'
            }, {
                value: 15,
                name: '水能'
            },],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        formatter: '{b}\n ({d}%)'
                    },
                    labelLine: {
                        show: true
                    }
                }
            },
            label: {
                normal: {
                    textStyle: {
                        color: 'white',
                        fontSize: 12,
                        fontWeight: 'bold'
                    }
                }
            }
        }]
    };
}

// 显示不同企业类型消耗能源占比

function showUserEnergyProportion() {
    pieOption6 = {
        title: {
            text: '企业类型耗能占比',
            textAlign: 'left',
            textStyle: {
                color: 'white',
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
                color: 'white',
                fontSize: 12
            }
        },
        series: [{
            name: '企业能耗占比',
            type: 'pie',
            radius: '55%',
            center: ['50%', '50%'],
            labelLine: {
                normal: {
                    lineStyle: {
                        color: '#fff'
                    }
                }
            },
            data: [
                {value: 32, name: '节能环保'},
                {value: 30, name: '工业科技'},
                {value: 9, name: '装备制造'},
                {value: 6, name: '物流配送'},
                {value: 7, name: '电子商务'}
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
                        color: 'white',
                        fontSize: 14,
                        fontWeight: 'bold'
                    }
                }
            }
        }]
    };
}


/*仪表盘*/
function createDashboardA() {
    /*
     $.ajax({
     type: 'GET',
     dataType: 'json',
     async: false,
     url: '../../../json/screen_uvc.json',
     success: function(data) {
     a_data = data.factoryAVC.a;
     },
     error: function() {
     console.log("配电室实时电压读取失败");
     }
     });*/
    a_data = 20;
    dashboardOptionA = {
        tooltip: {
            formatter: "{a} : {c}"
        },
        title: {
            text: '配电室实时电流',
            textStyle: {
                color: 'white'
            },
            subtext: '( A )',
            subtextStyle: {
                color: 'white'
            }
        },
        series: [{
            name: '电流',
            type: 'gauge',
            radius: '90%',
            data: [{value: a_data, name: ''}],
            axisLine: {
                lineStyle: {
                    width: 15
                }
            }
        }]
    };
}

function createDashboardU() {
    /*
     $.ajax({
     type: 'GET',
     dataType: 'json',
     async: false,
     url: '../../../json/screen_uvc.json',
     success: function(data) {
     u_data = data.factoryAVC.v;
     },
     error: function() {
     console.log("配电室实时电压读取失败");
     }
     });*/
    u_data = 219;
    dashboardOptionU = {
        tooltip: {
            formatter: "{a} : {c}"
        },
        title: {
            text: '配电室实时电压',
            textStyle: {
                color: "white"
            },
            subtext: '( V )',
            subtextStyle: {
                color: 'white'
            }
        },
        series: [{
            name: '电压',
            type: 'gauge',
            radius: '90%',
            data: [{
                value: u_data,
                name: ''
            }],
            min: 0,
            max: 380,
            axisLine: {
                lineStyle: {
                    width: 15
                }
            }
        }]
    };
}

function createDashboardC() {
    /*
     $.ajax({
     type: 'GET',
     dataType: 'json',
     async: false,
     url: '../../../json/screen_uvc.json',
     success: function(data) {
     c_data = data.factoryAVC.a;
     },
     error: function() {
     console.log("配电室实时电压读取失败");
     }
     });*/
    c_data = 10;
    dashboardOptionC = {
        tooltip: {
            formatter: "{a} : {c}"
        },
        title: {
            text: '配电室实时温度/湿度',
            subtext: '温度/℃\n湿度/%',
            subtextStyle: {
                color: 'white'
            },
            textStyle: {
                color: "white"
            }
        },
        series: [{
            name: '温度',
            type: 'gauge',
            data: [{value: 36, name: ''}],
            radius: '90%',
            min: 0,
            max: 50,
            startAngle: 160,
            endAngle: 20,
            pointer: {
                width: 5,
                length: '75%'
            },
            detail: {
                show: false
            },
            axisLine: {
                lineStyle: {
                    width: 15
                }
            }
        },
            {
                name: '湿度',
                type: 'gauge',
                data: [{
                    value: c_data,
                    name: ''
                }],
                radius: '90%',
                min: 0,
                max: 100,
                startAngle: -20,
                endAngle: -160,
                pointer: {
                    width: 5,
                    length: '75%'
                },
                detail: {
                    show: false
                },
                axisLine: {
                    lineStyle: {
                        width: 15
                    }
                }
            }
        ]
    };
    // dashboardC.setOption(option);
}


/*电流电压柱状图*/
/*
 function voltage_current() {
 voltageCurrent = echarts.init(document.getElementById('center-middle'));
 voltageCurrent.showLoading();
 var colors = ['#5793f3', '#d14a61', '#675bba'];
 optionAU = {
 color: colors,
 tooltip: {
 trigger: 'axis',
 axisPointer: {
 type: 'cross'
 }
 },
 grid: {
 // right: '20%'
 },
 title: {
 text: 'B7#厂房电压电流值',
 textStyle: {
 color: "white"
 }
 },
 legend: {
 data: ['电压值', '电流值'],
 textStyle: {
 color: "white"
 }
 },
 xAxis: [{
 type: 'category',
 axisTick: {
 alignWithLabel: true
 },
 axisLine: {
 lineStyle: {
 color: '#3399ff'
 }
 },
 data: ['12:00', '12:10', '12:20', '12:30', '12:40', '12:50', '13:00', '13:10', '13:20', '13:30', '13:40', '13:50']
 }],
 yAxis: [{
 type: 'value',
 name: '电压值',
 min: 0,
 max: 380,
 position: 'left',
 axisLine: {
 lineStyle: {
 color: colors[2]
 }
 },
 axisLabel: {
 formatter: '{value} V'
 },
 splitLine: {
 show:true,
 lineStyle: {
 color: colors[2]
 }
 }
 },
 {
 type: 'value',
 name: '电流值',
 min: 0,
 max: 20,
 position: 'right',
 axisLine: {
 lineStyle: {
 color: colors[1]
 }
 },
 axisLabel: {
 formatter: '{value} A'
 },
 splitLine: {
 show:true,
 lineStyle: {
 color: colors[1]
 }
 }
 }
 ],
 series: [{
 name: '电压值',
 type: 'bar',
 data: [218, 220, 210, 203, 221, 222, 220, 219, 221, 219, 220, 222]
 },
 {
 name: '电流值',
 type: 'bar',
 yAxisIndex: 1,
 data: [2.6, 5.9, 9.0, 6.4, 8.7, 5.7, 10.6, 6.2, 4.7, 8.8, 6.0, 2.3]
 }
 ]
 };
 voltageCurrent.hideLoading();
 voltageCurrent.setOption(optionAU);

 //获取实时数据
 setInterval(function() {
 var it = $.ajax({
 type: 'GET',
 dataType: 'json',
 async: false,
 url: '192.168.1.130:8080/screenPowerInfo',
 success: function(data) {
 voltageCurrent.hideLoading();
 voltageCurrent.setOption({
 title: {
 text: data.factoryVoltageCurrent[0].factory+"厂房电压电流值"
 },
 xAxis: [{
 data: data.factoryVoltageCurrent[0].time //横坐标时间轴
 }],
 yAxis: [{
 name: '电压值',
 min: 0,
 max: Math.max.apply(null, voltage) * 1.25 //电压纵坐标高度
 },
 {
 name: '电流值',
 min: 0,
 max: Math.max.apply(null, current) * 1.25  //电流纵坐标高度
 }
 ],
 series: [{
 name: '电压值',
 data: data.factoryVoltageCurrent[0].voltage
 },
 {
 name: '电流值',
 data: data.factoryVoltageCurrent[0].current
 }
 ]
 })
 },
 error: function() {
 console.log("厂房电压电流值json信息读取失败");
 }
 });
 }, 5000);
 }
 */

//厂房轮播参数
var comList = ['A1', 'A2', 'A3', 'A7', 'A5', 'A8', 'A9', 'A11', 'A12', 'A17', 'A18', 'A21', 'B1', 'B2', 'B3', 'B5', 'B6', 'B7', 'A10', 'B8', 'B9', 'A16', 'A20', 'V1', 'V2', 'V6', 'V7', 'V8', 'A15', 'A19', 'V12', 'B10', 'B11', 'A22', 'V11', 'V9', 'V10'];
function showWE() {
    var comlen = comList.length;
    var comIndex = 0;
    //轮播个厂房水能电能
    weChart = echarts.init(document.getElementById('center-middle'));
    var xData = function () {
        var data = [];
        for (var i = 1; i <= 24; i++) {
            data.push(i + "时");
        }
        return data;
    }();
    //设置默认值
    var data_power = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var data_water = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    weChart.showLoading();
    option = {
        title: {
            text: comList[comIndex] + '水电能耗',
            textStyle: {
                color: "white"
            }
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        grid: {
            containLabel: true
        },
        dataZoom: [{
            show: true, //dataZoom，框选区域缩放，自动与存在的dataZoom控件同步，分别是启用，缩放后退
            start: 10,
            end: 80
        }],
        color: ['#675bba', '#d14a61'],
        legend: {
            data: ['用水量','用电量'],
            textStyle: {
                color: 'white'
            }
        },

        xAxis: [{
            type: 'category',
            //                    data: ['0时','1时','2时','3时','4时','5时','6时','7时','8时','9时','10时','11时','12时','13时','14时','15时','16时','17时','18时','19时','20时','21时','22时','23时'],
            axisPointer: {
                type: 'shadow'
            },
            axisLabel: {
                interval: 0
            },
            axisLine: {
                lineStyle: {

                    color:'#675bba'
                }
            },
            data: xData
        }],
        yAxis: [
            {
                type: 'value',
                name: '用水量',
                // min:0,
                // max:10,
                position: 'left',
                axisLabel: {
                    formatter: '{value} 立方米'
                },
                axisLine: {
                    lineStyle:{
                        color:'#675bba'
                    }
                },
                splitLine:{
                    lineStyle:{
                        color:'#675bba'
                    }
                }
            },
            {
                type: 'value',
                name: '用电量',
                position: 'right',
//                    min: 0,
//                    max: 2000,
                axisLabel: {
                    formatter: '{value} KWH'
                },
                axisLine: {
                    lineStyle:{
                        color: '#d14a61'
                    }
                },
                splitLine:{
                    lineStyle:{
                        color: '#d14a61'
                    }
                }
            }
        ],
        series: [{
            name: '用水量',
            type: 'bar',
            yAxisIndex:0,
            data: data_water
        },
            {
                name: '用电量',
                type: 'bar',
                yAxisIndex:1,
                data: data_power
            }
        ]
    };
    weChart.hideLoading();
    weChart.setOption(option);


    function getMyJson() {
        weChart = echarts.init(document.getElementById('center-middle'));
        //        请求路径
        var setUrl = "/ssjc/water?aCode=" + comList[comIndex];
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: setUrl,
            success: function (myJson) {
                //重置清零
                data_power = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                data_water = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                //处理时间
                for (var index in myJson) {
                    var timeStr = myJson[index].time.split(' ');
                    myJson[index].time = timeStr[1];
                    timeStr = myJson[index].time.split(":");
                    myJson[index].time = parseInt(timeStr[0]);
                }
                for (var i in myJson) {
                    //控制水的能耗在10以下
                    if (myJson[i].water && myJson[i].time != 0 && myJson[i].water < 10) {
                        data_water[myJson[i].time - 1] = myJson[i].water;
                    }
                    else if (myJson[i].electric && myJson[i] != 0) {
                        data_power[myJson[i].time - 1] = myJson[i].electric;
                    }
                }
                //获取y轴的值
                powerY = Math.floor(Math.max.apply(null, data_power) * 1.25);
                waterY = Math.floor(Math.max.apply(null, data_water) * 1.25);
                powerY = 500;
                console.log(comList[comIndex] + "用水量:" + data_water);
                console.log("用电量: " + data_power);
                weChart.hideLoading();
                weChart.setOption({
                    title: {
                        text: comList[comIndex] + '厂房水电能耗',
                        textStyle: {
                            color: "white"
                        }
                    },
                    series: [{
                        name: '用水量',
                        data: data_water,
                        yAxisIndex:0
                    },
                        {
                            name: '用电量',
                            data: data_power,
                            yAxisIndex:1
                        }
                    ]
                });
            },
            error: function () {
                console.log("厂房轮播json信息读取失败");
            }
        });
    }

    getMyJson();

    /*实时监测请求实时数据*/
    setInterval(function () {
        comIndex = (comIndex + 1) % comlen;
        getMyJson();
    }, 5000);

}


/*当年能耗数字每隔5秒变化*/
function numChange() {
    var gap = parseInt(Math.random() * 1, 10) + 1;
    num += gap;
    var total = num;
    var k = -1;
    while (total !== 0) {
        var i = total % 10;
        total = parseInt(total / 10);
        $("li").eq(k).html(i);
        k--;
    }
}

/*饼图轮播函数*/
function bannerPie() {
    bannerPies = echarts.init(document.getElementById('right-top'));
    var banner = [pieOption4, pieOption5, pieOption6];
    var i = 0;
    bannerPies.setOption(banner[i]);
    setInterval(function () {
        bannerPies.clear();
        i = (i + 1) % 3;
        bannerPies.setOption(banner[i]);
    }, 25000);
}

/*仪表盘轮播函数*/
function bannerDashboard() {
    createDashboardA();
    createDashboardU();
    createDashboardC();
    setInterval('createDashboardA()', 500);
    setInterval('createDashboardU()', 500);
    setInterval('createDashboardC()', 500);
    dashbord = echarts.init(document.getElementById('right-middle'));
    var banner = [dashboardOptionA, dashboardOptionU, dashboardOptionC];
    var i = 0;
    dashbord.setOption(banner[i]);
    setInterval(function () {
        dashbord.clear();
        i = (i + 1) % 3;
        dashbord.setOption(banner[i]);
    }, 10000);
}