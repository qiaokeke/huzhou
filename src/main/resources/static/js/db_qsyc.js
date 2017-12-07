$(function () {
        /*企业能耗的点击事件*/
        var data_consition = [0, 0, 0, 0, 0,0,0];
        var myChart = echarts.init(document.getElementById('qsyc'));
        option = {
            title: {
                text: '折线图堆叠'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                top:30,
                data:['湖州舒乐网络科技有限公司']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                top:80,
                containLabel: true
            },
            toolbox: {
                feature: {
                    dataView: { show: true, readOnly: false },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['周一','周二','周三','周四','周五','周六','周日']
            },
            yAxis: {
                type: 'value',

                axisLabel : {
                    formatter: '{value} 千瓦时'
                }
//                splitNumber:20 //总量分成多少份  最大值会自动获取
            },
            series: [
                {
                    name:'湖州舒乐网络科技有限公司',
                    type:'line',
//                    stack: '总量',
                    data:[0, 0, 0, 0, 0, 0,0]
                }
            ]
        };
        myChart.setOption(option);

            $.ajax({
                type: 'POST',
                dataType: 'json',
                async: true,
                url: '/analysis/state?aCode=A1',
                success: function(data) {
                    if(JSON.stringify(data) == '[]'){
                        console.log("用电状态趋势json请求成功，但该公司暂无数据！");
                        return 0;
                    }
                    //处理时间
                    for(var index in data){
                        var timeStr = data[index].time.split(" ");
                        data[index].time = timeStr[0];
                        data[index].time = new Date(data[index].time+'').getDay();
                    }
                    //装入数据
                    for (var i = 0; i<5;i++) {
                        data_consition[0] = data[0].electricWeekCon;
                    }
                    // data_consition[5].value = data[5].electricWeekCon;  //读取并设置预计值
                    data_consition[5].value = 20;
                    console.log("用电状态：");
                    for (var i = 0; i<5;i++) {
                        console.log(data_consition[i]);
                    }
                    //表格重新绘制
                    myChart.setOption({
                        series: [
                            {
                                name:'湖州舒乐网络科技有限公司',
                                data:data_consition
                            }
                        ]
                    });
                },
                error: function() {
                    console.log("用电状态及趋势json信息请求失败");
                }
            });
        $("#click_qs").click(function(){
            data_consition = [0, 0, 0, 0, 0,0,0];
            var d = new Date();
            var acodeStr = $("#qsComName").val().split(" ");
            var acode = acodeStr[0];
            var month = d.getMonth()+1;
            var setUrl = '/analysis/state?aCode='+acode+'&time='+d.getFullYear()+'-'+month+'-'+d.getDate();
            console.log("url: "+setUrl);
            $.ajax({
                type: 'POST',
                dataType: 'json',
                async: true,
                url: setUrl,
                success: function(data) {
                    if(JSON.stringify(data) === '[]'){
                        console.log("用电状态趋势json请求成功，但该公司暂无数据！");
                        myChart.setOption({
                            legend: {
                                top:30,
                                data:[acodeStr[1]]
                            },
                            series: [
                                {
                                    name:acodeStr[1],
                                    data:[0,0,0,0,0,0,0]
                                }
                            ]
                        });
                        return 0;
                    }
                    //处理时间
                    for(var index in data){
                        var timeStr = data[index].time.split(" ");
                        data[index].time = timeStr[0];
                        data[index].time = new Date(data[index].time+'').getDay();
                    }
                    //装入数据
                    for (var i in data) {
                        if(data[i].time != 0){
                            data_consition[data[i].time-1] = data[i].electricWeekCon;
                        }
                        else{
                            data_consition[6] = data[i].electricWeekCon;
                        }
                    }
                    data_consition[6] = 0; //为了应付假数据
                    console.log("用电状态："+data_consition);
                    //表格重新绘制
                    myChart.setOption({
                        legend: {
                            top:30,
                            data:[acodeStr[1]]
                        },
                        series: [
                            {
                                name:acodeStr[1],
                                data:data_consition
                            }
                        ]
                    });
                },
                error: function() {
                    console.log("用电状态及趋势json信息请求失败");
                }
            });
        });
    });
<!--日历使用的函数-->
function showChartZZT() {
    var queryHY = document.getElementById("queryHY").value; //行业
    var queryQY = document.getElementById("queryQY").value; //企业名称
    var queryTime_1 = document.getElementById("startdate").value;  //开始日期
    var queryTime_2 = document.getElementById("enddate").value;    //结束日期
    alert('提交数据为：'+"行业="+queryHY+"； 企业="+queryQY+"； 开始时间="+queryTime_1+"； 结束时间="+queryTime_2) ;
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