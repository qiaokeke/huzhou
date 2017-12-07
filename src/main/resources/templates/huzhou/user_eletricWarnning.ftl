<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>能耗预警管理</title>
    <script src="/static/js/echarts/echarts.js"></script>

    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/common.js"></script>

    <link rel="icon" href="/static/picture/logo.ico" />
    <link href="/static/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
    <link href="/static/css/nav/newmain.css" type="text/css" rel="stylesheet" />

    <!--日期选择器-->
    <link type="text/css" href="/static/css/jquery.datetimepicker.css" rel="stylesheet" />
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script type ="text/javascript" src="/static/js/datetimepicker/jquery.datetimepicker.js"></script>
</head>

<style type="text/css">
    /*实现日历框的日历小图标*/
    #enddate , #startdate
    {
        background:url(/static/picture/calendar.jpg) center right no-repeat;
    }
</style>
<body class="bg">
<div class="wrapper">
    <div class="main">
<!--顶部能耗预警-->
<div id="top-alert"><#include "top_warming.html"></div>
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
<div class="container">
    <div class="row ">
        <div class=" ">
            <a href="javascript:void(0)">首页</a>
            >><a href="javascript:void(0)">绿色•低碳•能源•大数据平台</a>
            >><a href="javascript:void(0)">能耗预警</a>
        </div>
    </div>
    <div class="row" style="padding-left: 80px;">
        <h2>能耗预警</h2>
        <br />
        <div class="col-xs-12 col-md-4 col-lg-4">
            企业名称：
            <input id="queryQY" name="queryQY" />
        </div>
        <div class="col-xs-12 col-md-8 col-lg-8">
            统计时间：
            <input id="startdate" type="text" name="startdate" placeholder="YYYY-MM-DD" />
            &nbsp;至&nbsp;&nbsp;
            <input id="enddate" type="text" name="enddate" placeholder="YYYY-MM-DD" />
            &nbsp;&nbsp;<button class="btn btn-primary" onclick="showChartZZT()">统计</button>
            &nbsp;&nbsp;<input type="reset" value="清空" class="btn btn-success" />
        </div>

    </div>
    <div class="row">
        <div class="col-md-5 col-xs-12 col-lg-12" style="padding-left: 100px;">
            <br />
            使用说明：
            <br /><br />
            1、采用柱状图统计企业用电量<br /><br />
            2、可按照企业名称和时间进行统计
        </div>
    </div>
    <br class="clear" />


    <div class="col-md-10 col-md-offset-1">
        <div id="zzt2" style="width: 100%; height: 400px; border: 1px solid #ccc; padding: 10px;">

        </div>
    </div>
</div>
    </div>
</div>
<div id="footer-in"><#include "footer_1.html"></div>
<script>
    // 开始时间不能晚于结束时间
    var modal = (function() {
        var initDate = function(startDateTimeId,endDateTimeId) {
            var startDate;
            var endDate;
            startDateTimeId="#"+startDateTimeId;
            endDateTimeId="#"+endDateTimeId;
            $(startDateTimeId).datetimepicker({
                format: 'Y-m-d',
                minDate: false,
                onChangeDateTime: function(dp, $input) {
                    startDate = $(startDateTimeId).val();
                },
                onClose: function(current_time, $input) {
                    if (startDate > endDate) {
                        $(startDateTimeId).val(endDate);
                        startDate=endDate;
                    }
                }
            });
            $(endDateTimeId).datetimepicker({
                format: 'Y-m-d',
                onClose: function(current_time, $input) {
                    endDate = $(endDateTimeId).val();
                    if (startDate > endDate) {
                        $(endDateTimeId).val(startDate);
                        endDate=startDate;
                    }
                }
            });
        };
        return {
            initDate: initDate
        };
    })();
    modal.initDate("startdate","enddate");
    //只需要日期选择,disable时间选择器
    $("#startdate").datetimepicker({ format: 'Y-m-d', timepicker: false });
    $("#enddate").datetimepicker({ format: 'Y-m-d', timepicker: false });
</script>

<script type="text/javascript">
    $(function (){
		hasLogin =  true;
		userHero = 'user';
		//加载顶部能耗预警
		$("#top-alert").load("top_warming.html");
        /*加载导航条*/
        $("#nav").load("nav.html");
//        $("#footer-in").load("footer.html");

        var app = echarts.init(document.getElementById('zzt2'));
        app.showLoading();
        var data_W = [0,0,0,0,0,0,0,0,0,0,0,0];  //预警值
        var data_U = [0,0,0,0,0,0,0,0,0,0,0,0];  //用电量
        var data_B = [0,0,0,0,0,0,0,0,0,0,0,0];  //购电量
        //计算预警值
        for(var i= 0;i < 12;i++){
            data_W[i] = data_U[i] - data_B[i];
        }
        var xData = function() {
            var data = [];
            for (var i =1; i < 13; i++) {
                data.push(i + "月");
            }
            return data;
        }();

        option = {
            backgroundColor: "#fff",
            "title": {
                "text": "企业电能耗使用情况",
                "subtext": "  ",
                x: "4%",

                textStyle: {
                    color: '#000',
                    fontSize: '22'
                },
                subtextStyle: {
                    color: '#90979c',
                    fontSize: '16'

                }
            },
			toolbox: {
            feature: {
                dataView: { show: true, readOnly: false },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
            "tooltip": {
                "trigger": "axis",
                "axisPointer": {
                    "type": "shadow",
                    textStyle: {
                        color: "#fff"
                    }

                }
            },
            "grid": {
                "borderWidth": 0,
                "top": 110,
                "bottom": 95,
                textStyle: {
                    color: "#ff0"
                }
            },
            "legend": {
                x: '4%',
                top: '11%',
                textStyle: {
                    color: '#8e8e8e'
                },
                "data": ['用电量', '购电量', '预警']
            },

            "calculable": true,
            "xAxis": [{
                "type": "category",
                "axisLine": {
                    lineStyle: {
                        color: '#cecece'
                    }
                },
                "splitLine": {
                    "show": false
                },
                "axisTick": {
                    "show": false
                },
                "splitArea": {
                    "show": false
                },
                "axisLabel": {
                    "interval": 0

                },
                "data": xData
            }],
            "yAxis": [{
                "type": "value",
                "splitLine": {
                    "show": false
                },
                "axisLine": {
                    lineStyle: {
                        color: '#90979c'
                    }
                },
                "axisTick": {
                    "show": false
                },
                "axisLabel": {
                    "interval": 0

                },
                "splitArea": {
                    "show": false
                }
            }],
            "dataZoom": [{
                "show": true,
                "height": 30,
                "xAxisIndex": [
                    0
                ],
                bottom: 30,
                "start": 10,
                "end": 80,
                handleIcon: 'path://M306.1,413c0,2.2-1.8,4-4,4h-59.8c-2.2,0-4-1.8-4-4V200.8c0-2.2,1.8-4,4-4h59.8c2.2,0,4,1.8,4,4V413z',
                handleSize: '110%',
                handleStyle:{
                    color:"#d3dee5"

                },
                textStyle:{
                    color:"#0ff"},
                borderColor:"#90979c"


            }, {
                "type": "inside",
                "show": true,
                "height": 15,
                "start": 1,
                "end": 35
            }],
            "series": [{
                "name": "用电量",
                "type": "bar",
                "stack": "总量",
                "barMaxWidth": 35,
                "barGap": "10%",
                "itemStyle": {
                    "normal": {
                        "color": "rgba(255,144,128,1)",
                        "label": {
                            "show": true,
                            "textStyle": {
                                "color": "#fff"
                            },
                            "position": "insideTop",
                            formatter: function(p) {
                                return p.value > 0 ? (p.value) : '';
                            }
                        }
                    }
                },
                "data": data_U
            },
                {
                    "name": "购电量",
                    "type": "bar",
                    "stack": "总量",
                    "itemStyle": {
                        "normal": {
                            "color": "rgba(0,191,183,1)",
                            "barBorderRadius": 0,
                            "label": {
                                "show": true,
                                "position": "top",
                                formatter: function(p) {
                                    return p.value > 0 ? (p.value) : '';
                                }
                            }
                        }
                    },
                    "data": data_B
                },
                {
                    name: '预警',
                    data: data_W,
//                    symbolSize:mdata,
                    type: 'scatter',
                    symbolSize: function (mdata) {
                        return Math.sqrt(mdata)/2 ;
                    },
                    label: {
                        emphasis: {
                            show: true,
                            formatter: function (param) {
                                return param.mdata;
                            },
                            position: 'top'
                        }
                    },
//                    symbolSize:20,
                    itemStyle: {
                        normal: {
                            shadowBlur: 10,
                            shadowColor: 'rgba(120, 36, 50, 0.5)',
                            shadowOffsetY: 5,
                            color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
                                offset: 0,
                                color: 'rgb(251, 118, 123)'
                            }, {
                                offset: 1,
                                color: 'rgb(204, 46, 72)'
                            }])
                        }
                    }
                }
            ]
        };
        app.hideLoading();
        app.setOption(option);
        $.ajax({
            type: 'GET',
            dataType: "json",
            async: false,
            url: '/warning',
            success: function(myJson) {
                //处理时间
                for(var index in myJson){
                    var dateStr = myJson[index].time.split(" ");
                    myJson[index].time = dateStr[0];
                    dateStr = myJson[index].time.split("-");
                    myJson[index].time = parseInt(dateStr[1]);
                }
                //装入数据
                for(var i in myJson){
                    data_U[myJson[i].time - 1] = parseFloat(myJson[i].electricValue);
                }
                //计算预警值
                for(var i= 0;i < 12;i++){
                    data_W[i] = data_U[i] - data_B[i];
                }
                console.log("预警值："+data_W);
                console.log("用电量"+ data_U);
                console.log("购电量"+ data_B);
                app.hideLoading();
                app.setOption({
                    "series": [
                        {
                            "name": "用电量",
                            data: data_U
                        },
                        {
                            name: '预警',
                            data: data_W
                        }
                    ]
                });
            },
            error:function () {
                console.log("能耗预警json获取失败");
            }
        })
    });

</script>
<script>
	$(function(){
//		$("#footer-in").load("footer_new.html");
	});
</script>
<script type="text/javascript" src="/static/js/nav.js"></script>
<script type="text/javascript" src="/static/js/top_warmming.js"></script>
</body>
</html>