var cellSize = [80, 70];
var pieRadius = '10%';
// 设定默认日历为当前年月
var beginMonth,beginYear,endMonth,endYear;
var thisTime = new Date();
beginMonth = thisTime.getMonth() + 1;
endYear = beginYear = thisTime.getFullYear();
if(beginMonth < 9){
    endMonth = "0"+parseInt(beginMonth+1);

}else{
    endMonth = beginMonth + 1;
}
if(beginMonth === 12){
    endMonth = "01";
    endYear = beginYear + 1;
}
var s = beginYear+"-"+beginMonth+"-01";
var e = endYear+"-"+endMonth+"-01";
var yearMonth = [beginYear+'-'+beginMonth];
var a=0,b=0,c=0;
var myChart = echarts.init(document.getElementById("calendar-container"));

var urlStr =  decodeURI(window.location.href);
var num = urlStr.indexOf("?");
urlStr = urlStr.substr(num+1); //取得所有参数
var pList = urlStr.split("&"); //各个参数放到数组里
var getP = pList[0].split('=');
pList[0] = getP[1];
gufengUrl = '/ssjc/gufengCalendar?aCode='+pList[0]+'&time=2017-12-1';

function printCalendar() {

    /*请求实时数据*/
    $.ajax({
        type: 'GET',
        dataType: "json",
        async: false,
        url: gufengUrl,
        success: function(myJson) {
            //处理时间,使时间变为天数
            function getDate() {
                for (var i in myJson) {
                    var dateStr = myJson[i].time.split(' ');
                    myJson[i].time = dateStr[0];
                    dateStr = myJson[i].time.split("-");
                    myJson[i].time = dateStr[2];
                }
            };
            getDate();
            function getVirtulData(s, e) {
                var date = +echarts.number.parseDate(s);
                var end = +echarts.number.parseDate(e);
                var dayTime = 3600 * 24 * 1000;
                var data = [];
                for (var time = date; time < end; time += dayTime) {
                    data.push([
                        echarts.format.formatTime('yyyy-MM-dd', time),
                        Math.floor(Math.random() * 10000)
                    ]);
                }
                return data;
            }

            function getPieSeries(scatterData, chart) {
                return echarts.util.map(scatterData, function(item, index) {
                    var center = chart.convertToPixel('calendar', item);
                    for (var i in myJson) {
                        if (myJson[i].time == index + 1) {
                            a = myJson[i].peak; //峰能耗
                            b = myJson[i].valley; //谷能耗
                            c = myJson[i].tip; //尖能耗
                            break;
                        } else {
                            a = 0;
                            b = 0;
                            c = 0;
                        }
                    }
                    return {
                        id: index + 'pie',
                        type: 'pie',
                        color: ['#FF3333', '#0087D3', '#89C322'],
                        center: center,
                        label: {
                            normal: {
                                formatter: '{c}',
                                position: 'inside'
                            }
                        },
                        radius: pieRadius,
                        data: [
                            { name: '尖能耗', value: c },
                            { name: '峰能耗', value: a },
                            { name: '谷能耗', value: b }
                        ]
                    };
                });
            }

            var scatterData = getVirtulData(s, e);

            option = {
                tooltip: {},
                legend: {
                    data: ['尖能耗', '峰能耗', '谷能耗'],
                    right: 20
                },
                calendar: {
                    top: 70,
                    left: 'center',
                    orient: 'vertical',
                    cellSize: cellSize,
                    yearLabel: {
                        show: false,
                        textStyle: {
                            fontSize: 30
                        }
                    },
                    dayLabel: {
                        margin: 20,
                        firstDay: 1,
                        nameMap: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
                    },
                    monthLabel: {
                        show: false
                    },
                    range: yearMonth  //设定日历范围
                },
                series: [{
                    id: 'label',
                    type: 'scatter',
                    coordinateSystem: 'calendar',
                    symbolSize: 1,
                    label: {
                        normal: {
                            show: true,
                            formatter: function(params) {
                                return echarts.format.formatTime('dd', params.value[0]);
                            },
                            offset: [-cellSize[0] / 2 + 10, -cellSize[1] / 2 + 10],
                            textStyle: {
                                color: '#000',
                                fontSize: 14
                            }
                        }
                    },
                    data: scatterData
                }]
            };
            myChart.setOption(option);
            myChart.setOption({
                series: getPieSeries(scatterData, myChart)
            });


        },
        error: function() {
            console.log("峰谷能耗日历json信息读取失败");
        }
    });
}

printCalendar();

var urlStr =  decodeURI(window.location.href);
var num = urlStr.indexOf("?");
urlStr = urlStr.substr(num+1); //取得所有参数
var pList = urlStr.split("&"); //各个参数放到数组里
var getP = pList[0].split('=');
pList[0] = getP[1];


//点击查询事件
$("#findit").click(function() {
    gufengUrl = '/ssjc/gufengCalendar?aCode='+pList[0]+'&time='+$("#year").val()+"-"+$("#month").val()+"-1";
    s = $("#year").val() + "-" + $("#month").val() + "-01";
    e = $("#year").val() + "-" + (parseInt($("#month").val()) + 1) + "-01";
    yearMonth[0] = $("#year").val()+"-"+$("#month").val();
    myChart.clear();
    printCalendar();
});