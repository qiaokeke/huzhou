<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>实时监测</title>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/echarts-liquidfill.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/echarts/echartGL.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/layer.css" />
    <script src="/static/js/layer.js"></script>
    <script src="/static/js/alert_null_data.js"></script>
    <link href="/static/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="icon" href="/static/picture/logo.ico" />
    <link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />

    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/static/css/calendar.css" />

    <!--新增导航样式-->
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />
    <style type="text/css">
        a {
            font-family: sans-serif 宋体;
            font-size: 16px;
        }

        .nav_tabs>li.active>a {
            color: #000;
        }

        #menu-top a:hover {
            color: white !important;
        }
        .report{
            float: right;
            margin-right: 10px;
        }

        .btn-primary{
            background-color: #5bc0de;
            border-color: #46b8da;
        }
        .btn-primary :hover {
            background-color: #46b8da;
        }
    </style>
</head>

<body class="bg">
<div class="wrapper">
    <div class="main">
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
<div class="container ">
    <div class="row">
        <div class="col-md-4">
            <a href="main.ftl">首页</a> >>
            <a href="javascript:void (0)">绿色•低碳•能源•大数据平台</a> >>
            <a href="javascript:void (0)"><span id="aCode">A11</span></a>
        </div>
    </div>
    <div class="row" style="line-height: 50px;">
        <div class="col-md-4">
            公司名称：<span id="cName"></span>
        </div>
        <div class="col-md-6">
            所属行业：<span id="cKind"></span>
        </div>
    </div>
    <div class="row">
        &nbsp;&nbsp;&nbsp;&nbsp;选择企业：&nbsp;
        <select class="input-sm" id="companyNameList" style="margin-bottom: 30px;">
        </select>
        <button class="btn btn-info" id="selectCom" style="margin-left: 50px;">确定</button>
    </div>
    <div class="row">
        <ul class="nav nav-tabs" role="tablist" id="mytabs">
            <li role="presentation" class="active"><a href="#curdata" aria-controls="home" role="tab" data-toggle="tab">实时数据</a></li>
            <li role="presentation"><a href="#calendar" aria-controls="profile" role="tab" data-toggle="tab">分时能耗日历</a></li>
            <li role="presentation"><a href="#calendar-new" aria-controls="profile" role="tab" data-toggle="tab">峰谷能耗日历</a></li>
            <li role="presentation"><a href="#calendar-week" aria-controls="profile" role="tab" data-toggle="tab">周能耗日历</a></li>
            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">能耗目标</a></li>
            <li role="presentation"><a href="#money" aria-controls="money" role="tab" data-toggle="tab">可用余额</a></li>
        </ul>
        <div class="tab-content">
            <!--实时监测-->
            <div role="tabpanel" class="tab-pane active" id="curdata" style="width: 100%; height: 400px; border: 1px solid #ccc; padding: 10px;"></div>
            <!--能耗日历--分时能耗-->
            <div role="tabpanel" class="tab-pane " id="calendar">
                <div class="row">
                    <div class="col-md-6" id="calendar1" style="width: 585px; height: 420px; border: 1px solid #ccc; padding: 10px;"></div>
                    <div class="col-md-6" style="width: 585px; height: 420px; border: 1px solid #ccc; padding: 10px;">
                        <a href="javascript:void(0)" style=" color:#111;">分时能耗</a>
                        <div id="useage" style="width: 585px; height: 400px;"></div>
                    </div>
                </div>
            </div>
            <!--峰谷能耗日历-->
            <div role="tabpanel" class="tab-pane" id="calendar-new">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12" style="height: 620px;">
                            <div style="width: 570px;margin: 0 auto 20px;">
                                <form class="form-inline pull-left" style="width: 260px;">
                                    <div class="form-group">
                                        <select name="year" class="form-control" id="year">
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                            <option value="2021">2021</option>
                                        </select>
                                        <label for="year">年</label>
                                    </div>
                                    <div class="form-group">
                                        <select name="month" class="form-control" id="month">
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="09">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                        <label for="month">月</label>
                                    </div>
                                    <input type="button" value="查询" class="btn btn-primary" id="findit"/>
                                </form>
                            </div>
                            <div style="height: 500px;width: 570px; margin: 0 auto;margin-top: 50px;" id="calendar-container"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 周能耗日历 -->
            <div role="tabpanel" class="tab-pane" id="calendar-week" style="width: 1148px; height: 700px; padding: 10px;"></div>
            <!--能耗目标-->
            <div role="tabpanel" class="tab-pane " id="messages">
                <div class="container">
                    <div class="row" style="padding-top: 20px;">
                        <div class="col-md-4">
                            当月电能耗目标&nbsp;&nbsp;&nbsp;
                            <input type="text" value="60KWH" title="能耗" id="eleTarget">
                        </div>
                        <div class="col-md-4">
                            当月水能耗目标&nbsp;&nbsp;&nbsp;
                            <input type="text" value="30m³" title="能耗" id="warTarget">
                        </div>
                        <div class="col-md-4">
                            企业分类
                        </div>
                    </div>
                    <div class="row" style="padding-top: 20px;">
                        <div class="col-md-4" id="electrical" style="width: 390px; height: 400px; border: 1px solid #ccc;  "></div>
                        <div class="col-md-4" id="water" style="width: 390px; height: 400px; border: 1px solid #ccc;  "></div>
                        <div class="col-md-4" id="comType" style="width: 390px; height: 400px; border: 1px solid #ccc;  "></div>
                    </div>
                </div>
            </div>
            <!--余额-->
            <div role="tabpanel" class="tab-pane" id="money">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6" id="left_money" style="width:585px; height: 410px; border: 1px solid #ccc;"></div>
                        <div class="col-md-6" style=" width:585px;height: 410px; border: 1px solid #ccc;">
                            <div class="row">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">电费</a></li>
                                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">水费</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="home">
                                        <div class="row" style="padding: 20px 20px 0 20px">
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">1000元</div>
                                                    <div class="panel-body">
                                                        预充值1000元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">2000元</div>
                                                    <div class="panel-body">
                                                        预充值2000元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">3000元</div>
                                                    <div class="panel-body">
                                                        预充值3000元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">5000元</div>
                                                    <div class="panel-body">
                                                        预充值5000元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">10000元</div>
                                                    <div class="panel-body">
                                                        预充值10000元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">20000元</div>
                                                    <div class="panel-body">
                                                        预充值20000元
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="profile">
                                        <div class="row" style="padding: 20px 20px 0 20px">
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">200元</div>
                                                    <div class="panel-body">
                                                        预充值200元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">300元</div>
                                                    <div class="panel-body">
                                                        预充值300元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">500元</div>
                                                    <div class="panel-body">
                                                        预充值500元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">1000元</div>
                                                    <div class="panel-body">
                                                        预充值1000元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">2000元</div>
                                                    <div class="panel-body">
                                                        预充值2000元
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">3000元</div>
                                                    <div class="panel-body">
                                                        预充值3000元
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-left: 20px;">
                                <h3>支付方式</h3>
                                <a class="btn btn-info" href="javascript:void(0)" aria-label="Delete">

                                    <i class="fa fa-credit-card fa-2x"></i>
                                </a>
                                <a class="btn btn-info" href="javascript:void(0)" aria-label="Delete">
                                    <i class="fa fa-weixin fa-2x"></i>
                                </a>
                                <img src="/static/picture/pay.png" class="btn btn-info" />
                                <a class="report" href="note" target="_blank"><button class="btn btn-primary">通知单</button></a>
                                <a class="report" href="report" target="_blank"><button class="btn btn-primary">电费单</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
    </div>
</div>
<div id="footer-in"><#include "footer_1.html"></div>
<script>
    //获取url上的参数
    var urlStr =  decodeURI(window.location.href);
    var num = urlStr.indexOf("?");
    urlStr = urlStr.substr(num+1); //取得所有参数
    pList = urlStr.split("&"); //各个参数放到数组里
    var getP = pList[0].split('=');
    pList[0] = getP[1];
    getP = pList[1].split('=');
    pList[1] = getP[1];
    $("#aCode").html(pList[0]);
    $("#cName").html(pList[1]);

    $.ajax({
        url:'/company/info',
        dataType:'json',
        success:function(info){
            var index;
            for(var p in info){
                $("#companyNameList").append('<option>'+info[p].code+' '+info[p].name+'</option>');
            }
            for(var i in info){
                if(pList[0] === info[i].code){
                    index = i;
                }
            }
            if(info[index].type){
                $("#cKind").html(info[index].type);
            }
           else {
                $("#cKind").html('无');
            }
        },
        error: function(){
            console.log("公司信息获取失败。");
        }
    });
</script>
<script type="text/javascript">
    function GetArgsFromHref(sHref, sArgName) {
        var args = sHref.split("?");
        var retval = "";
        if (args[0] == sHref) /*参数为空*/ {
            return retval; /*无需做任何处理*/
        }
        var str = args[1];
        args = str.split("&");
        for (var i = 0; i < args.length; i++) {
            str = args[i];
            var arg = str.split("=");
            if (arg.length <= 1) continue;
            if (arg[0] == sArgName) retval = arg[1];
        }
        return retval;
    }
</script>
<script type="text/javascript">
    <!--加载导航条-->
    $(function() {
        //让下拉框显示当前年月份
        var thisdate = new Date();
        var thisMonth = thisdate.getMonth()+1;
        var thisYear = thisdate.getFullYear();
        $("#month option:nth-child("+thisMonth+")").attr('selected','selected');
        $("#year option[value="+thisYear+"]").attr('selected','selected');
        /*加载导航条*/
        var params;
        var value = GetArgsFromHref(window.location.href, params);
    });
    /**/

    /*实时数据*/
    $(function() {
        var WEChart = echarts.init(document.getElementById('curdata'));
        var xData = function() {
            var data = [];
            for (var i = 1; i <= 24; i++) {
                data.push(i + "时");
            }
            return data;
        }();
        //设置默认值
      var data_power = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
      var data_water = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        WEChart.showLoading();
        option = {
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
                bottom: 80
            },
            toolbox: {
                feature: {
                    dataView: { show: true, readOnly: false },
                    magicType: { show: true, type: ['line', 'bar'] },
                    restore: { show: true },
                    saveAsImage: { show: true },
                    dataZoom: {
                        yAxisIndex: 'none'
                    }
                }
            },
            dataZoom: [{
                show: true, //dataZoom，框选区域缩放，自动与存在的dataZoom控件同步，分别是启用，缩放后退
                start: 10,
                end: 80
            }],
            legend: {
                data: ['用水量','用电量']
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
                data: xData
            }],
            yAxis: [
                {
                    type: 'value',
                    name: '用水量',
//                    min:0,
//                    max:10,
                    position: 'left',
                    axisLabel: {
                        formatter: '{value} 立方米'
                    },
                    splitLine:{
                        lineStyle:{
                            color:"red"
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
                    splitLine:{
                        lineStyle:{
                            color: '#2F4554'
                        }
                    }
                }
            ],
            series: [
                {
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
        WEChart.hideLoading();
        WEChart.setOption(option);

//        请求路径
            setWEUrl = "/ssjc/water?aCode="+pList[0];
        function getMyJson(){
            $.ajax({
                type: 'GET',
                dataType: 'json',
                async: false,
                url: setWEUrl,
                success: function(myJson) {
                    //处理时间
                    for(var index in myJson){
                        var timeStr = myJson[index].time.split(' ');
                        myJson[index].time = timeStr[1];
                        timeStr = myJson[index].time.split(":");
                        myJson[index].time = parseInt(timeStr[0]);
                    }
                    for(var i in myJson){
                        //控制水的能耗为10以下
                        if(myJson[i].water && myJson[i].time != 0 && myJson[i].water < 10){
                            data_water[myJson[i].time - 1] = myJson[i].water;
                        }
                        else if(myJson[i].electric && myJson[i] != 0){
                            data_power[myJson[i].time - 1] = myJson[i].electric;
                        }
                    }
                    WEChart.hideLoading();
                    WEChart.setOption({
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
                error : function() {
                    console.log("实时监测json信息读取失败");
                }
            });
        }
        getMyJson();
        /*实时监测请求实时数据*/
        setInterval(function() {
            getMyJson();
         }, 3600000);


    /*能耗日历 分时能耗*/

        //获取当前年月
        var myDate = new Date();
        var thisYear = myDate.getFullYear();
        var thisMonth = myDate.getMonth()+1;
        var dateRange = ['2017-08-01', '2017-08-31'];
        //月份的天数
        var numDate1 = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var numDate2 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var s = thisYear + '-' + thisMonth + '-01';
        if (thisMonth != 2) {
            e = thisYear + "-" + thisMonth + "-" + numDate1[thisMonth - 1];
        } else {
            //闰年
            if (thisYear % 4 == 0 && (thisYear % 100 != 0 || thisYear % 400 == 0)) {
                e = thisYear + "-" + thisMonth + "-" + numDate1[1];
            }
            //平年
            else {
                e = thisYear + "-" + thisMonth + "-" + numDate2[1];
            }
        }
        dateRange = [s, e];
        var ClaChart = echarts.init(document.getElementById('calendar1'));
        ClaChart.showLoading();

        calendarUrl =  '/ssjc/timeCalendar?aCode='+pList[0];
        /*能耗日历请求实时数据*/
        hasClick = false;
        function setClendarOption(){
            if(!hasClick){
                calendarUrl =  '/ssjc/timeCalendar?aCode='+pList[0];
            }else{
                var newACode = $("#companyNameList").val().split(" ");
                calendarUrl =  '/ssjc/timeCalendar?aCode='+newACode[0];
            }
            $.ajax({
                type: 'GET',
                dataType: "json",
                async: false,
                url:calendarUrl,
                success: function(myJson) {
                    //处理时间
                    for(var i in myJson){
                        var d = myJson[i].time.split("-");
                        myJson[i].time = parseInt(d[2]);
                    }
                    function getVirtulData(year, month) {
                        year = year || '2017';
                        var date = +echarts.number.parseDate(year + '-' + month + '-01');
                        var end = +echarts.number.parseDate((+year) + '-' + (month + 1) + '-01');
                        // var end = +echarts.number.parseDate((+year+1) + '-'+ month + '-01');
                        var dayTime = 3600 * 24 * 1000;
                        var data = [];
                        for (var time = date; time < end; time += dayTime) {
                            data.push([
                                echarts.format.formatTime('yyyy-MM-dd', time), 0]);
                        }
                        for(var index in myJson){
                            data[myJson[index].time-1][1] = myJson[index].timeConsumption;
                        }
                        return data;
                    }

                    var data = getVirtulData(thisYear, thisMonth);

                    option = {
                        title: {
                            top: 6,
                            text: '能耗日历',
                            left: 'center',
                            textStyle: {
                                color: '#000'
                            }
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: function (params) {
                                return params.value[0]+ '  '+ '能耗: '+ params.value[1];
                            }
                        },
                        legend: {
                            top: '30',
                            left: '900',
                            data: ['能耗', 'Top'],
                            textStyle: {
                                color: '#000'
                            }
                        },
                        visualMap: {
                            show: false,
                            min: 0,
                            max: 300,
                            inRange: {
                                color: ['#66CDAA', '#006edd'],
                                opacity: 0.3
                            },
                            controller: {
                                inRange: {
                                    opacity: 0.5
                                }
                            }
                        },
                        calendar: [{
                            top: 80,
                            left: 'center',
                            range: dateRange,
                            // range: ['2017-08-01', '2017-08-31'],
                            splitLine: {
                                show: true,
                                lineStyle: {
                                    color: '#000',
                                    width: 1,
                                    type: 'solid'
                                }
                            },
                            cellSize: [50, 50],
                            orient: 'vertical',
                            dayLabel: {
                                firstDay: 1,
                                nameMap: 'cn'
                            },
                            yearLabel: { show: false },
                            monthLabel: {
                                nameMap: 'cn',
                                show: true
                            },
                            itemStyle: {
                                normal: {
                                    borderWidth: 0.6,
                                    borderColor: '#111'
                                }
                            }
                        }],
                        series: [{
                            name: '能耗',
                            type: 'effectScatter',
                            coordinateSystem: 'calendar',
                            data: data,
                            /*随机获取scatter的大小*/
                            symbolSize: function(val) {

                                return Math.abs(val[1]) / 5 > 10 ? 5 : Math.abs(val[1]) / 5 ;
//                                return val[1] / 5 > 10 ? 5 : val[1] / 5 ;
//                                return val[1] / 5  ;
                            },
                            itemStyle: {
                                normal: {
                                    color: '#ddb926'
                                }
                            }
                        },
                            {
                                name: 'Top',
                                type: 'effectScatter',
                                coordinateSystem: 'calendar',
                                calendarIndex: 0,
                                data: data.sort(function(a, b) {
                                    return b[1] - a[1];
                                }).slice(0, 5),
                                symbolSize: function(val) {
                                    return Math.abs(val[1]) / 50 > 30 ? 5 : Math.abs(val[1]) / 50 ;
//                                    return val[1] / 50 > 30 ? 30 :val[1] / 50;
                                },
                                showEffectOn: 'render',
                                rippleEffect: {
                                    brushType: 'stroke'
                                },
                                hoverAnimation: true,
                                itemStyle: {
                                    normal: {
                                        color: '#f4e925',
                                        shadowBlur: 10,
                                        shadowColor: '#333'
                                    }
                                },
                                zlevel: 1
                            },{
                                type: 'heatmap',
                                coordinateSystem: 'calendar',
                                data: data,
                                symbolSize:1,
                                itemStyle: {
                                    normal: {
                                        color: '#fff'
                                    }
                                }
                            }
                        ]
                    };
                    ClaChart.hideLoading();
                    ClaChart.setOption(option);
                },
                error: function() {
                    console.log("分时能耗日历json信息读取失败");
                }
            });

            ClaChart.on('click', function(params) {
                var getFenUrl = '/ssjc/timeConsumption?aCode='+pList[0]+'&calendar=' + params.value[0];
                var useage = echarts.init(document.getElementById('useage'));
                useage.showLoading();
                //分时能耗
                var data_timeConsumption = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                var all_consumption = 0;
                option1 = {
                    title: {
                        text: params.value[0],
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        position: ['48.5%', '49.2%'],
                        backgroundColor: 'rgba(50,50,50,0)',
                        textStyle: {
                            color: 'yellow',
                            fontWeight: 'bold'
                        },
                        formatter: "{d}%"
                    },
                    series: [{
                        name: '上网时间',
                        type: 'pie',
                        radius: ['5%', '70%'],
                        roseType: 'area',
                        color: ['#3fa7dc'],
                        data: data_timeConsumption,
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        label: {
                            normal: {
                                show: false
                            }
                        },
                        itemStyle: {
                            normal: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            },
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    },
                        {
                            name: '',
                            type: 'gauge',
                            min: 0,
                            max: 24,
                            startAngle: 90,
                            endAngle: 449.9,
                            radius: '85%',
                            splitNumber: 24,
                            clockwise: false,
                            animation: false,
                            detail: {
                                formatter: '{value}',
                                textStyle: {
                                    color: '#63869e'
                                }
                            },
                            detail: {
                                show: false
                            },
                            axisTick: {
                                show: false
                            },
                            axisLine: {
                                lineStyle: {
                                    color: [
                                        [0.083, '#3EBF3E'],
                                        [0.125, '#024287'],
                                        [0.208, '#C23531'],
                                        [0.458, '#024287'],
                                        [0.542, '#3EBF3E'],
                                        [0.667, '#024287'],
                                        [1, '#3EBF3E'],
                                    ],
                                    width: '40%',
                                    shadowColor: '#0d4b81', //默认透明
                                    shadowBlur: 40,
                                    opacity: 1
                                }
                            },
                            splitLine: {
                                length: 5,
                                lineStyle: {
                                    color: '#ffffff',
                                    width: 2
                                }
                            },
                            axisLabel: {
                                formatter: function(v) {
                                    return v ? v : '';
                                },
                                textStyle: {
                                    color: "white",
                                    fontWeight: 700
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: 'green',
                                    width: 2
                                }
                            }
                        },
                        {
                            name: '',
                            type: 'gauge',
                            min: 0,
                            max: 24,
                            startAngle: 90,
                            endAngle: 449.9,
                            radius: '72%',
                            splitNumber: 24,
                            clockwise: false,
                            animation: false,
                            detail: {
                                formatter: '{value}',
                                textStyle: {
                                    color: '#63869e'
                                }
                            },
                            detail: {
                                show: false
                            },
                            axisTick: {
                                show: false
                            },
                            axisLine: {
                                lineStyle: {
                                    color: [
                                        [1, '#E8E8E8']
                                    ],
                                    width: '10%',
                                    opacity: 0.8
                                }
                            },
                            splitLine: {
                                show: true,
                                length: '92%',
                                lineStyle: {
                                    color: 'grey',
                                    width: '1'
                                }
                            },
                            axisLabel: {
                                show: false,
                                formatter: function(v) {
                                    return v ? v : '';
                                },
                                textStyle: {
                                    color: "#fb5310",
                                    fontWeight: 700
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: 'green',
                                    width: 2,
                                    borderWidth: 3,
                                }
                            }
                        }
                    ]
                };
                useage.hideLoading();
                useage.setOption(option1);

                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    async: true,
                    url: getFenUrl,
                    success: function(data) {
                        //处理时间
                        for(var p in data){
                            var timeStr = data[p].time.split(" ");
                            data[p].time = timeStr[1];
                            timeStr = data[p].time.split(":");
                            data[p].time = parseInt(timeStr[0]);
                        }
                        //装入数据
                        for (var index in data) {
                            if(data[index].time !== 0){
                                data_timeConsumption[data[index].time-1] = data[index].timeConsumption;
                                all_consumption += parseInt(data[index].timeConsumption);
                            }
                        }
                        //表格重新绘制
                        useage.hideLoading();
                        useage.setOption({
                            title: {
                                text: params.value[0]+" "+params.value[1]  //显示日期和当天的总耗能
                            },
                            series: [{
                                name: '上网时间',
                                data: data_timeConsumption,
                            }]
                        });
                    },
                    error: function() {
                        console.log("json信息请求失败");
                    }
                });
            });
        }
        setClendarOption();
    /*能耗目标----耗电情况*/
        var powerChart = echarts.init(document.getElementById('electrical'));
        powerChart.showLoading();
        var percent = 26.8 + '%';

        function getData() {
            return [{
                value: percent,
                itemStyle: {
                    normal: {
                        color: '#89C222',
                        shadowBlur: 5,
                        shadowColor: '#89C222'
                    }
                }
            }, {
                value: 100 - percent,
                itemStyle: {
                    normal: {
                        color: 'transparent'
                    }
                }
            }];
        }

        option = {
            title: {
                text: (percent) + '',
                x: 'center',
                y: 'center',
                textStyle: {
                    color: '#98a0c4',
                    fontWeight: 'bolder',
                    fontSize: 44
                }
            },
            series: [{
                type: 'pie',
                radius: ['39%', '49%'],
                silent: true,
                label: {
                    normal: {
                        show: false
                    }
                },

                data: [{
                    value: 1,
                    itemStyle: {
                        normal: {
                            color: '#313443',
                            shadowBlur: 10,
                            shadowColor: '#1b1e25'


                        }
                    }
                }],

                animation: false
            },

                {
                    type: 'pie',
                    radius: ['39%', '49%'],
                    silent: true,
                    label: {
                        normal: {
                            show: false,
                        }
                    },

                    data: [{
                        value: 1,
                        itemStyle: {
                            normal: {
                                color: '#313443',
                                shadowBlur: 10,
                                shadowColor: '#1b1e25'
                            }
                        }
                    }],

                    animation: false
                },

                {
                    name: 'main',
                    type: 'pie',
                    radius: ['50%', '51%'],
                    label: {
                        normal: {
                            show: false,
                        }
                    },
                    data: getData(),

                    animationEasingUpdate: 'cubicInOut',
                    animationDurationUpdate: 1000
                }
            ]
        };
        powerChart.hideLoading();
        powerChart.setOption(option);

    /*能耗目标----耗水情况*/
        var waterChart = echarts.init(document.getElementById('water'));
        waterChart.showLoading();
        var option = {
            /*  title:{
                  text:'用水情况'
              },*/
            series: [{
                name: '用水情况',
                type: 'liquidFill',
                radius: '50%',
                data: [0.89],
                label: {
                    normal: {
                        //                        formatter: '{a}\n {c}',
                        textStyle: {
                            color: 'red',
                            insideColor: 'yellow',
                            fontSize: 30
                        }
                    }
                }
            }]
        };
        waterChart.hideLoading();
        waterChart.setOption(option);
        $.ajax({
            url:'/ssjc/target',
            dataType:'json',
            success: function(myJson){
                if(JSON.stringify(myJson) === '[]'){
                    console.log("能耗目标json获取成功，但该公司暂无数据！");
                    return 0;
                }
                if(myJson.eleTarget == '未知'){
                    $("#eleTarget").val("60kwh");
                    $("#warTarget").val("30m³");
                }else{
                    $("#eleTarget").val(myJson.eleTarget);
                    $("#warTarget").val(myJson.waterTarget);
                }

                var toolMassageE = '';
                var toolMassaagW = '';
                var perE = 0;
                var perW = 0;
                if(myJson.elePercent == '只有当前月份的数据' || myJson.elePercent == '没有本月数据'|| myJson.elePercent == '未能读取到本月数据'){

                }
            },
            error: function(){
                console.log("能耗目标json获取失败！");
            }
        });

    /*能耗目标----企业分类*/
        var compareChart = echarts.init(document.getElementById('comType'));
        compareChart.showLoading();
        option = {
            /* title: {
                 text: '企业分类'
             },*/
            tooltip: {},
            legend: {
                top: 18,
                data: ['该公司', '同行业']
            },
            radar: {
                // shape: 'circle',
                indicator: [
                    { name: '1月', max: 1650 },
                    { name: '2月', max: 3000 },
                    { name: '3月', max: 3800 },
                    { name: '4月', max: 3800 },
                    { name: '5月', max: 3800 },
                    { name: '6月', max: 3800 },
                    { name: '7月', max: 3800 },
                    { name: '8月', max: 3800 },
                    { name: '9月', max: 2600 },
                    { name: '10月', max: 650 },
                    { name: '11月', max: 6500 },
                    { name: '12月', max: 6500 }
                ]
            },
            series: [{

                type: 'radar',
                // areaStyle: {normal: {}},
                data: [{
                    value: [600, 800, 680, 790, 960, 1020, 1020, 0, 0, 0, 0, 0],
                    name: '该公司'
                },
                    {
                        value: [900, 1400, 1680, 2110, 2510, 2810, 2810, 0, 0, 0, 0, 0],
                        name: '同行业'
                    }
                ]
            }]
        };
        compareChart.hideLoading();
        compareChart.setOption(option);
    /*可用余额*/
        var myChartYE = echarts.init(document.getElementById('left_money'));
        myChartYE.showLoading();
        option = {
            tooltip: {
                formatter: "{a} <br />{b} : {c}%"
            },
            toolbox: {
                feature: {
                    restore: {},
                    saveAsImage: {}
                }
            },
            series: [{
                name: '用电量',
                type: 'gauge',
                radius: '60%',
                center: ['75%', '50%'],
                title: {
                    textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        fontWeight: 'bolder',
                        fontSize: 22,
                        fontStyle: 'italic'
                    }
                },
                detail: {
                    formatter: '{value}%',
                    textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        fontWeight: 'bolder',
                        fontSize: 18
                    }
                },
                data: [{ value: 8, name: '用电量' }]
            },
                {
                    name: '用水量',
                    type: 'gauge',
                    radius: '55%',
                    center: ['25%', '50%'],
                    title: {
                        textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder',
                            fontSize: 22,
                            fontStyle: 'italic'
                        }
                    },
                    detail: {
                        formatter: '{value}%',
                        textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder',
                            fontSize: 18
                        }
                    },
                    data: [{ value: 3, name: '用水量' }]
                }

            ]
        };
        myChartYE.hideLoading();
        myChartYE.setOption(option);

        // 选择企业点击确定之后
        $("#selectCom").click(function(){
            var newACode = $("#companyNameList").val().split(" ");
            setWEUrl = "/ssjc/water?aCode="+newACode[0];
            getMyJson();
            gufengUrl = '/ssjc/gufengCalendar?aCode='+newACode[0]+'&time='+$("#year").val()+"-"+$("#month").val()+"-1";
            pList[0] = newACode[0];
            hasClick = true;
            setClendarOption();
        });
    })
</script>
<#--周能耗日历-->
<script>
    function myMap(days, hours, data) {
        myData = [];
        i = 0;
        for (k = 0; k < days.length; k++) {
            for (j = 0; j < hours.length; j++) {
                myData.push([days[k], hours[j], data[i][2]]);
                myData.push([days[k], hours[j], 0]);
                i++;
            }
        }
        return myData;
    }
    $(function() {
        var hours = ['1时', '2时', '3时', '4时', '5时', '6时',
            '7时', '8时', '9时', '10时', '11时', '12时',
            '13时', '14时', '15时', '16时', '17时', '18时',
            '19时', '20时', '21时', '22时', '23时', '24时'
        ];
        var days = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

        var data = [
            [0, 0, 5], [0, 1, 1], [0, 2, 0], [0, 3, 0], [0, 4, 0], [0, 5, 0], [0, 6, 0], [0, 7, 0], [0, 8, 0], [0, 9, 0], [0, 10, 0], [0, 11, 2], [0, 12, 4],
            [0, 13, 1], [0, 14, 1], [0, 15, 3], [0, 16, 4], [0, 17, 6], [0, 18, 4], [0, 19, 4], [0, 20, 3], [0, 21, 3], [0, 22, 2], [0, 23, 5], [1, 0, 7],
            [1, 1, 0], [1, 2, 0], [1, 3, 0], [1, 4, 0], [1, 5, 0], [1, 6, 0], [1, 7, 0], [1, 8, 0], [1, 9, 0], [1, 10, 5], [1, 11, 2], [1, 12, 2], [1, 13, 6],
            [1, 14, 9], [1, 15, 11], [1, 16, 6], [1, 17, 7], [1, 18, 8], [1, 19, 12], [1, 20, 5], [1, 21, 5], [1, 22, 7], [1, 23, 2], [2, 0, 1], [2, 1, 1],
            [2, 2, 0], [2, 3, 0], [2, 4, 0], [2, 5, 0], [2, 6, 0], [2, 7, 0], [2, 8, 0], [2, 9, 0], [2, 10, 3], [2, 11, 2], [2, 12, 1], [2, 13, 9], [2, 14, 8],
            [2, 15, 10], [2, 16, 6], [2, 17, 5], [2, 18, 5], [2, 19, 5], [2, 20, 7], [2, 21, 4], [2, 22, 2], [2, 23, 4], [3, 0, 7], [3, 1, 3], [3, 2, 0], [3, 3, 0],
            [3, 4, 0], [3, 5, 0], [3, 6, 0], [3, 7, 0], [3, 8, 1], [3, 9, 0], [3, 10, 5], [3, 11, 4], [3, 12, 7], [3, 13, 14], [3, 14, 13], [3, 15, 12], [3, 16, 9],
            [3, 17, 5], [3, 18, 5], [3, 19, 10], [3, 20, 6], [3, 21, 4], [3, 22, 4], [3, 23, 1], [4, 0, 1], [4, 1, 3], [4, 2, 0], [4, 3, 0], [4, 4, 0], [4, 5, 1],
            [4, 6, 0], [4, 7, 0], [4, 8, 0], [4, 9, 2], [4, 10, 4], [4, 11, 4], [4, 12, 2], [4, 13, 4], [4, 14, 4], [4, 15, 14], [4, 16, 12], [4, 17, 1], [4, 18, 8],
            [4, 19, 5], [4, 20, 3], [4, 21, 7], [4, 22, 3], [4, 23, 0], [5, 0, 2], [5, 1, 1], [5, 2, 0], [5, 3, 3], [5, 4, 0], [5, 5, 0], [5, 6, 0], [5, 7, 0],
            [5, 8, 2], [5, 9, 0], [5, 10, 4], [5, 11, 1], [5, 12, 5], [5, 13, 10], [5, 14, 5], [5, 15, 7], [5, 16, 11], [5, 17, 6], [5, 18, 0], [5, 19, 5], [5, 20, 3],
            [5, 21, 4], [5, 22, 2], [5, 23, 0], [6, 0, 1], [6, 1, 0], [6, 2, 0], [6, 3, 0], [6, 4, 0], [6, 5, 0], [6, 6, 0], [6, 7, 0], [6, 8, 0], [6, 9, 0], [6, 10, 1],
            [6, 11, 0], [6, 12, 2], [6, 13, 1], [6, 14, 3], [6, 15, 4], [6, 16, 0], [6, 17, 0], [6, 18, 0], [6, 19, 0], [6, 20, 1], [6, 21, 2], [6, 22, 2], [6, 23, 6]
        ];
        console.log("data"+data[0][1]);
        calendarWeek = echarts.init(document.getElementById("calendar-week"));
        calendarWeekOption = {
            tooltip: {},
            toolbox: {
                feature: {
                    dataView: { show: true, readOnly: false },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            visualMap: [{
                type: 'continuous',
                min: 0,
                max: 15,
                range: [0, 15],
                calculable: true,
                bottom: '10%'
            }],
            grid3D: {
                show: true,
                boxWidth: 70,
                boxHeight: 100,
                boxDepth: 250,
                light: {
                    main: {
                        shadow: true
                    }
                },
                viewControl: {
                    damping: 0.9,
                    distance: 280,
                    center: [0, -40, 0]
                }
            },
            xAxis3D: {
                show: true,
                name: 'X',
                type: 'category',
                data: days
            },
            yAxis3D: {
                show: true,
                name: 'Y',
                type: 'category',
                data: hours
            },
            zAxis3D: {
                show: true,
                name: 'Z',
                type: 'value',
                min: 0,
                max: 15,
                axisLabel: {
                    formatter: '{value}kw/h'
                },
                nameGap: 25
            },
            series: {
                type: 'bar3D',
                shading: 'lambert',
                name: '能耗',
                data: myMap(days, hours, data),
                emphasis: {
                    itemStyle: {
                        color: 'red'
                    }
                },
                itemStyle: {
                    opacity: 0.8
                }
            }
        };
        calendarWeek.setOption(calendarWeekOption);
    });
</script>
<script>
    hasLogin =  true;
    userHero = 'root';
</script>
<script type="text/javascript" src="/static/js/nav.js"></script>
<script type="text/javascript" src="/static/js/calendar.js"></script>
</body>

</html>