var dashboardA;
var dashboardU;
var dashboardC;
var AandU;
$(function(){
  createDashboardA();
  createDashboardU();
  createDashboardC();
  createAandU();
    getList();
  $(window).resize(function(){
    AandU.resize();
  });
});

function createDashboardA() {
  dashboardA = echarts.init(document.getElementById("dashboard-A"));
  option = {
    tooltip : {
        formatter: "{a} : {c}"
    },
    title:{text:'实时电流'},
    series: [
        {
            name: '电流',
            type: 'gauge',
            radius:'90%',
            data: [{value: 20, name: '电流/A'}],
            axisLine:{
              lineStyle:{
                width:15
              }
            }
        }
    ]
  };
  dashboardA.setOption(option);
}

function createDashboardU() {
  dashboardU = echarts.init(document.getElementById("dashboard-U"));
  option = {
    tooltip : {
        formatter: "{a} : {c}"
    },
    title:{text:'实时电压'},
    series: [
        {
            name: '电压',
            type: 'gauge',
            radius:'90%',
            max:380,
            data: [{value: 220, name: '电压/V'}],
            axisLine:{
              lineStyle:{
                width:15
              }
            }
        }
    ]
  };
  dashboardU.setOption(option);
}

function createDashboardC() {
  dashboardC = echarts.init(document.getElementById("dashboard-C"));
  option = {
    tooltip : {
        formatter: "{a} : {c}"
    },
    title:{text:'实时温度/湿度'},
    series: [
        {
            name: '温度',
            type: 'gauge',
            data: [{value:36,name:'温度/℃\n湿度/%'}],
            radius:'90%',
            min:0,
            max:50,
            startAngle: 160,
            endAngle: 20,
            pointer:{
              width:5,
              length:'75%'
            },
            detail:{
              show:false
            },
            axisLine:{
              lineStyle:{
                width:15
              }
            }
        },
        {
            name: '湿度',
            type: 'gauge',
            data: [{value: 24, name: ''}],
            radius:'90%',
            min:0,
            max:100,
            startAngle: -20,
            endAngle: -160,
            pointer:{
              width:5,
              length:'75%'
            },
            detail:{
              show:false
            },
            axisLine:{
              lineStyle:{
                width:15
              }
            }
        }
    ]
  };
  dashboardC.setOption(option);
}

function createAandU() {
  AandU = echarts.init(document.getElementById("A-U"));
  option = {
    dataZoom:[
      {
        type:'slider',
        show:true,
        showDetail:true,
        start:20,
        end:70
      }
    ],
    title:{text:'电流/电压走势图'},
    grid:{
      containLabel: true,
      bottom: '15%',
      left: 0,
      right: 0
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            crossStyle: {
                color: '#999'
            }
        },
        formatter:'{b}<br />{a0}:{c0}<br />{a1}:{c1}'
    },
    toolbox: {
        feature: {
            dataView: {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:[{name:'电流',icon:'circle'},{name:'电压',icon:'circle'}]
    },
    xAxis: [
        {
            type: 'category',
            data: ['1时','2时','3时','4时','5时','6时','7时','8时','9时','10时','11时','12时'],
            axisPointer: {
                type: 'shadow'
            }
        }
    ],
    yAxis: [
        {
            type: 'value',
            name: '电流',
            min: 0,
            max: 50,
            interval: 5,
            axisLabel: {
                formatter: '{value} A'
            }
        },
        {
            type: 'value',
            name: '电压',
            min: 0,
            max: 380,
            interval: 40,
            axisLabel: {
                formatter: '{value} V'
            }
        }
    ],
    series: [
        {
            name:'电流',
            type:'bar',
            yAxisIndex: 0,
            data:[2.0, 4.9, 7.0, 23.2, 25.6, 17.7, 35.6, 17.2, 32.6, 20.0, 6.4, 3.3]
        },
        {
            name:'电压',
            type:'bar',
            yAxisIndex: 1,
            data:[220, 218, 219, 220, 218, 210, 216, 216, 221, 213, 220, 219]
        },
        {
            name:'电流',
            type:'line',
            yAxisIndex: 0,
            smooth: true,
            data:[2.0, 4.9, 7.0, 23.2, 25.6, 17.7, 35.6, 17.2, 32.6, 20.0, 6.4, 3.3]
        },
        {
            name:'电压',
            type:'line',
            yAxisIndex: 1,
            smooth: true,
            data:[220, 218, 219, 220, 218, 210, 216, 216, 221, 213, 220, 219]
        }
    ]
  };
  AandU.setOption(option);
}

function getList(){
    $.ajax({
       url:'/company/todayList',
       dataType:'json',
       success: function(myList){
           //遍历所有对象
           var allNum = 0;
           for(var i in myList){
               allNum++;
           }
           //计算页数
           if(allNum % 4 == 0){
               var pageNum =Math.floor(allNum / 4);
           }
           else {
               var pageNum = Math.floor(allNum / 4) + 1;
           }
        //    var num = 1;
        // for(var index in myList){
        //     $("#todayList").append('<tr><td>'+num+'</td><td><a href=\"rootSingleData\" target=\"_blank\">'+myList[index].eName+'</a></td><td>'+myList[index].dianYa+'</td><td>'+myList[index].dianLiu+'</td><td>'+myList[index].yggl+'</td><td>'+myList[index].zgl+'</td><td>'+myList[index].glys+'</td><td>'+myList[index].pdn+'</td><td>'+myList[index].zdn+'</td><td>'+myList[index].jdn+'</td><td>'+myList[index].fdn+'</td><td>'+myList[index].gdn+'</td><td>'+myList[index].multiple+'</td><td>'+myList[index].time+'</td></tr>');
        //     num ++;
        // }
           $.jqPaginator('#page', {
               totalPages: pageNum,
               visiblePages: 4,
               currentPage: 1,
               wrapper: '<ul class="pagination"></ul>',
               first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
               prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
               next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
               last: '<li class="last"><a href="javascript:void(0);">尾页</a></li>',
               page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
               onPageChange: function(num) {
                   var id = (num - 1) * 4 + 1;
                   var beginNum = (num - 1) * 4;

                   if(num == pageNum){
                      var endNum = allNum;
                   }
                   else{
                       var endNum = num * 4;
                   }
                   console.log(pageNum)
                   console.log("all: "+ endNum);
                   var str = '';
                   for(var index = beginNum;index < endNum; index++){
                       str+='<tr><td>'+id+'</td><td><a href=\"rootSingleData\" target=\"_blank\">'+myList[index].eName+'</a></td><td>'+myList[index].dianYa+'</td><td>'+myList[index].dianLiu+'</td><td>'+myList[index].yggl+'</td><td>'+myList[index].zgl+'</td><td>'+myList[index].glys+'</td><td>'+myList[index].pdn+'</td><td>'+myList[index].zdn+'</td><td>'+myList[index].jdn+'</td><td>'+myList[index].fdn+'</td><td>'+myList[index].gdn+'</td><td>'+myList[index].multiple+'</td><td>'+myList[index].time+'</td></tr>'
                       id ++;
                   }
                   $("#todayList").html(str);
               }
           });
    },
    error: function () {
        console.log("今日能耗列表Json获取失败");
    }
    });
}