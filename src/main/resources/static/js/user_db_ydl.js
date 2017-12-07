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

$(function (){
    var data_buy = [0,0,0,0,0,0,0,0,0,0,0,0];
    var data_pay = [0,0,0,0,0,0,0,0,0,0,0,0];
    app = echarts.init(document.getElementById('ydl'));
    app.showLoading();
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
            // right: '20%'
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        title: {
            text: '企业用电量统计柱状图'
        },
        legend: {
            data:['用电量','购电量']
        },
        xAxis: [
            {
                type: 'category',
                axisTick: {
                    alignWithLabel: true
                },
                data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '用电量',
                min: 0,
                max: 250,
                position: 'left',
                axisLine: {
                    lineStyle: {
                        color: colors[0]
                    }
                },
                axisLabel: {
                    formatter: '{value} °'
                }
            },
            {
                type: 'value',
                name: '购电量',
                min: 0,
                max: 250,
                position: 'right',
                offset: 0,
                axisLine: {
                    lineStyle: {
                        color: colors[1]
                    }
                },
                axisLabel: {
                    formatter: '{value} °'
                }
            }
        ],
        series: [
            {
                name:'用电量',
                type:'bar',
                // data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                data:data_pay
            },
            {
                name:'购电量',
                type:'bar',
                yAxisIndex: 1,
                data:data_buy
            }
        ]
    };
    app.hideLoading();
    app.setOption(option);
    click_qyydl = false;
    $("#qyydl").click(function(){
        if(!click_qyydl){
            $.ajax({
                type: 'POST',
                dataType: 'json',
                async: true,
                url: '/analysis/info?aCode='+companyCode,
                success: function(data) {
                    //处理时间
                    for(var p in data){
                        var month =data[p].time.split("-");
                        data[p].time = parseInt(month[1]);
                    }
                    //装入数据
                    for (var index in data) {
                        data_pay[data[index].time - 1] = data[index].electricValue;
                    }
                    console.log("用电量："+data_pay);
                    console.log("购电量："+data_buy);
                    //表格重新绘制
                    app.hideLoading();
                    app.setOption({
                        yAxis: [
                            {
                                name: '用电量',
                                min: 0,
                                // max: 250,
                                max: Math.floor( Math.max.apply(null, data_pay) * 1.25) //设置纵坐标为最大值的1.25倍
                            },
                            {
                                name: '购电量',
                                min: 0,
                                max: 250
                            }
                        ],
                        series: [
                            {
                                name:'用电量',
                                data:data_pay
                            },
                            {
                                name:'购电量',
                                data:data_buy
                            }
                        ]
                    });
                },
                error: function() {
                    console.log("企业用电量json信息请求失败");
                }
            });
            click_qyydl = true;
        }
    });

});
