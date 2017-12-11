$(function (){
        mChart1 = echarts.init(document.getElementById('ele'));
        mChart1.showLoading();
        mChart1.title = '某站点用户访问来源';
        var data_tip = [0,0,0,0,0,0,0];  //尖能耗
        var data_peak = [0,0,0,0,0,0,0];  //峰能耗
        var data_valley = [0,0,0,0,0,0,0]; //谷能耗
        var data_total = [0,0,0,0,0,0,0];  //总能耗
        option = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            toolbox: {
                feature: {
                    dataView: { show: true, readOnly: false },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            legend: {
                data: ['尖能耗', '峰能耗','谷能耗','总能耗']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis:  {
                type: 'value'
            },
            yAxis: {
                type: 'category',
                data: ['周一','周二','周三','周四','周五','周六','周日']
            },
            series: [
                {
                    name: '尖能耗',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    data:data_tip
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
                    data: data_peak
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
                    data: data_valley
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
                    data: data_total
                }

            ]
        };
        mChart1.hideLoading();
        mChart1.setOption(option);

        click_qynh = false;
        $("#qynh").click(function(){
            if(!click_qynh){
                var d = new Date();
                var month = d.getMonth()+1;
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    async: true,
                    url: '/analysis/nenghao?aCode=B1'+'&time='+d.getFullYear()+'-'+month+'-'+d.getDate(),
                    success: function(data) {
                        //处理时间
                        for(var index in data){
                            var timeStr = data[index].time.split(" ");
                            data[index].time = timeStr[0];
                            data[index].time = new Date(data[index].time+'').getDay();
                        }
                        //装入数据
                        for (var index in data) {
                            var date = parseInt(data[index].time);
                            if(date!=0){
                                data_tip[date - 1] = data[index].tip;
                                data_peak[date - 1] = data[index].peak;
                                data_valley[date - 1] = data[index].valley;
                                data_total[date -1 ] = data[index].total;
                            }else{
                                data_tip[6] = data[index].tip;
                                data_peak[6] = data[index].peak;
                                data_valley[6] = data[index].valley;
                                data_total[6] = data[index].total;
                            }
                        }
                        //表格重新绘制
                        mChart1.hideLoading();
                        mChart1.setOption({
                            series: [
                                {
                                    name: '尖能耗',
                                    data:data_tip
                                },
                                {
                                    name: '峰能耗',
                                    data: data_peak
                                },
                                {
                                    name: '谷能耗',
                                    data: data_valley
                                },
                                {
                                    name: '总能耗',
                                    data: data_total
                                }
                            ]
                        });
                    },
                    error: function() {
                        console.log("企业能耗json信息请求失败");
                    }
                });
                click_qynh = true;
            }
        });
    $("#clickNH").click(function(){
         data_tip = [0,0,0,0,0,0,0];  //尖能耗
         data_peak = [0,0,0,0,0,0,0];  //峰能耗
         data_valley = [0,0,0,0,0,0,0]; //谷能耗
         data_total = [0,0,0,0,0,0,0];  //总能耗
        var acodeStr = $("#name").val().split(" ");
        var acode = acodeStr[0];
        var d = new Date();
        var month = d.getMonth()+1;
        var setUrl = '/analysis/nenghao?aCode='+acode+'&time='+d.getFullYear()+'-'+month+'-'+d.getDate();
        $.ajax({
            type: 'POST',
            dataType: 'json',
            async: true,
            url: setUrl,
            success: function(data) {
                //数据为空
                if(JSON.stringify(data) == '[]'){
                    nullData();
                    console.log("json请求成功，但该公司暂无数据！");
                }
                //处理时间
                for(var index in data){
                    var timeStr = data[index].time.split(" ");
                    data[index].time = timeStr[0];
                    data[index].time = new Date(data[index].time+'').getDay();
                }
                //装入数据
                for (var index in data) {
                    var date = parseInt(data[index].time);
                    if(date!=0){
                        data_tip[date - 1] = data[index].tip;
                        data_peak[date - 1] = data[index].peak;
                        data_valley[date - 1] = data[index].valley;
                        data_total[date -1 ] = data[index].total;
                    }else{
                        data_tip[6] = data[index].tip;
                        data_peak[6] = data[index].peak;
                        data_valley[6] = data[index].valley;
                        data_total[6] = data[index].total;
                    }

                }
                //表格重新绘制
                mChart1.hideLoading();
                mChart1.setOption({
                    series: [
                        {
                            name: '尖能耗',
                            data:data_tip
                        },
                        {
                            name: '峰能耗',
                            data: data_peak
                        },
                        {
                            name: '谷能耗',
                            data: data_valley
                        },
                        {
                            name: '总能耗',
                            data: data_total
                        }
                    ]
                });
            },
            error: function() {
                console.log("企业能耗json信息请求失败");
            }
        });
    });
    });
<!--对日历的操作限制-->
    function showChartZZT() {
        var queryHY = document.getElementById("name").value; //行业
        var queryQY = document.getElementById("name").value; //企业名称
        var queryTime_1 = document.getElementById("startdate").value;  //开始日期
        var queryTime_2 = document.getElementById("enddate").value;    //结束日期
    }

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

<!--对选择条件进行的-->
    $(function  (){
        $("#test").on("click",function () {
            $("#name").empty();//首先清空select现在有的内容
            $("#name").append("<option selected='selected'  value=0>请选择..</option>");
            for (var i = 0; i < 10; i++) {
                $("#name").append("<option  value=" + i + ">" + i + "</option>");
            }
        });
    });