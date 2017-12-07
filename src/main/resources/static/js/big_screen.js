$(function() {
  $("#filter").css('height', $(window).height()); /*设置滤可视高度镜层高度为文档*/
  setInterval("clock()", 1000);
  item2();
  fontDiv();
  showEnergyProportion();
  showUserProportion();
  item3();
});

function clock() {
  var now = new Date().toLocaleString();
  $(".now").html(now);
}

function item2() {
  var item2 = echarts.init(document.getElementById("item2"));
  var option = {
    legend: {
      data: ['已购', '已用'],
      textStyle: {
        color: '#fff'
      }
    },
    tooltip: {},
    grid: {
      left: 50,
      right: 15,
      top: 40,
      bottom: 50
    },
    xAxis: {
      type: 'value',
      name: '吨标准煤',
      min: 0,
      max: 60,
      nameRotate: 45,
      nameGap: 5,
      nameLocation: 'start'
    },
    yAxis: {
      data: ['公司1', '公司2', '公司3', '公司4', '公司5']
    },
    textStyle: {
      color: '#fff'
    },
    series: [{
      type: 'bar',
      name: '已购',
      data: [58, 47, 35, 15, 27],
      itemStyle: {
        normal: {
          color: '#3D78D2',
          barBorderRadius: 10
        },
        emphasis: {
          shadowColor: '#3D78D2',
          shadowBlur: 5
        }
      }
    }, {
      type: 'bar',
      name: '已用',
      barGap: '-100%',
      data: [45, 35, 27, 10, 21],
      itemStyle: {
        normal: {
          color: '#7CF4F3',
          barBorderRadius: 10
        },
        emphasis: {
          shadowColor: '#7CF4F3',
          shadowBlur: 5
        }
      },
      barWidth: '40%'
    }]
  };
  item2.setOption(option);
}

function fontDiv() {
  var fontDiv = $("#fontDiv");
  var fDiv;
  // for (var i = 0; i < 8; i++) {
  //   fDiv = $("<div class='fDiv'>0</div>");
  //   fontDiv.append(fDiv);
  // }
  fDiv = $("<div class='fDiv'>0</div>");
  fontDiv.append(fDiv);
  fDiv = $("<div class='fDiv'>0</div>");
  fontDiv.append(fDiv);
  fDiv = $("<div class='fDiv'>1</div>");
  fontDiv.append(fDiv);
  fDiv = $("<div class='fDiv'>4</div>");
  fontDiv.append(fDiv);
  fDiv = $("<div class='fDiv'>2</div>");
  fontDiv.append(fDiv);
  fDiv = $("<div class='fDiv'>1</div>");
  fontDiv.append(fDiv);
  fDiv = $("<div class='fDiv'>1</div>");
  fontDiv.append(fDiv);
  fDiv = $("<div class='fDiv'>7</div>");
  fontDiv.append(fDiv);
  fontDiv.append("<div style='background-color:transparent;color:#F2BD17;font-size:150%;width:10em;' class='fDiv text-left'>千克标煤</div>");
}

function item3() {
  var myChart = echarts.init(document.getElementById('center-bottom'));
  // 指定图表的配置项和数据
  var option = {
    tooltip: {},
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
        name: 'NO.5 15#厂房嘉兴进隆塑业有限公司',
        value: 180
      }, {
        name: 'NO.4 1#厂房爱家电器嘉兴有限公司',
        value: 280
      }, {
        name: 'NO.3 5#厂房嘉兴浩拓贸易有限公司',
        value: 380
      }, {
        name: 'NO.2 17#厂房上海鸿研物流技术有限公司',
        value: 480
      }, {
        name: 'NO.1 9#厂房嘉兴赛捷弹簧制造有限公司',
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
    }, {
      name: '',
      type: 'bar',
      data: [600, 600, 600, 600, 600],
      barWidth: '10%',
      barGap: '0%',
      itemStyle: {
        normal: {
          color: '#3D78D2'
        }
      }
    }]
  };

  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
}

// 显示消耗能源占比
function showEnergyProportion() {
  var energyProportion = echarts.init(document.getElementById('right-bottom'));
  option = {
    title: {
      text: '能源消耗占比',
      x: 'center',
      top: 40,
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
      x: 'center',
      y: 'bottom',
      data: ['电能', '水'],
      textStyle: { //控制图例颜色
        color: 'white',
        fontWeight: 'bold',
        fontSize: 12
      }
    },
    color: [ /*'rgb(247,140,0)', */ 'rgb(242,7,100)', 'rgb(135,0,242)'],
    calculable: true,
    series: [{
      name: '能源占比',
      type: 'pie',
      radius: ['15%', '60%'],
      roseType: 'radius', //半径模式
      // x: '50%',
      sort: 'ascending',
      labelLine: {
        normal: {
          length: 10,
          length2: 10,
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
        name: '水'
      }, ],
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
  energyProportion.setOption(option);
}

/*显示用户占比*/
function showUserProportion() {
  var userProportion = echarts.init(document.getElementById('right-top'));
  option2 = {
    title: {
      text: '企业类型',
      x: 'center',
      textStyle: {
        color: 'white',
        fontSize: 18,
        fontWight: 'bold'
      }
    },
    tooltip: {
      trigger: 'item',
      formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    color: ['rgb(101,212,229)', 'white', 'rgb(247,140,0)'],
    calculable: true,
    series: [{
      name: '用户占比',
      type: 'pie',
      radius: ['50%', '70%'],
      // roseType : 'radius',
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
      data: [{
        value: 73,
        name: '生产加工'
      }, {
        value: 12,
        name: '仓储'
      }, {
        value: 15,
        name: '其他'
      }],
      itemStyle: {
        normal: {
          label: {
            show: true,
            formatter: '{b} : {c} \n ({d}%)'
          },
          labelLine: {
            show: false
          },
        }
      },
      label: {
        normal: {
          textStyle: {
            color: 'white',
            fontSize: 10
              // fontWeight: 'bold'
          }
        }
      }
    }]
  };
  userProportion.setOption(option2);
}