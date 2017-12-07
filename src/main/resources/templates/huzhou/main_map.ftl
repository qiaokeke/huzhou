<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>浙江省地图</title>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/zhejiang.js"></script>
    <script src="/static/js/echarts/huzhou.js"></script>

    <link href="/static/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="icon" href="/static/picture/logo.ico" />
    <link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />

    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <!--新增导航样式-->
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />

</head>
<body class="bg">
<div class="wrapper">
    <div class="main">
        <!--导航条-->
        <div id="nav"><#include "nav.html"></div>
<div class="container">
    <div class="row">
        <div id="map" class="center-block" style="width: 80%; height: 600px; border: 1px solid #ccc; padding: 10px;">

        </div>
    </div>
</div>
    </div>
</div>
<div id="footer-in"><#include "footer_1.html"></div>
<script type="text/javascript">
    $(function () {
        var chart = echarts.init(document.getElementById("map"));
        chart.setOption(option ={
            title: {
                text: '浙江省',
                subtext: '浙江'
            },
//            visualMap: {
//                show:false,
//                min: 0,
//                max: 100,
//                left: 'left',
//                top: 'bottom',
//                text: ['高', '低'], // 文本，默认为数值文本
//                calculable: true
//            },
            geo:{
//                type:'map',
//                mapType:"huzhou"
                map:"浙江",
//                left: '50%',
//                top: '10%',
                width: '55%',
                height:'85%',
                label: {
                    normal: {
                        show: true
                    }
                },
                itemStyle:{
                    normal: {
                        borderColor: '#389BB7',
                        areaColor: '#fff',
                        label:{
                            show:true
                        }
                    },
                    emphasis: {
                        areaColor: '#389BB7',
                        borderWidth: 0
                    }
                }
            },
            series:[{
                name:"园区",
                type:'effectScatter',
                coordinateSystem:'geo',
                zlevel:2,
                rippleEffect:{
                    brushType:'stroke'
                },
                label: {
                    normal: {
                        show: true,
                        position: 'bottom',
                        formatter: '{b}'
                    }
                },
                symbolSize:36,
                itemStyle:{
                  normal:{
                      color:'green'
                  }
                },
                data:[
                    {name:'嘉兴市',value:[120.750865,30.762653]},{name:'湖州市',value:[120.102398,30.867198]}]
            }]
        });
        chart.on("click",function (params) {
            if(params.componentType === "series"&&params.name == "湖州市"){
               // alert("有待开发");
				location.href = "/huzhou/login";
            }if ( params.componentType === "series"&&params.name == "嘉兴市"){
//               location.href ="http://www.jnhbzhy.com/WisdomPark/"
                 //alert("有待开发");
                 location.href ="http://123.157.244.62:6556/jiaxing/index_jiaxing.html"
            }
        })
    });
</script>
<script type="text/javascript" src="/static/js/nav.js"></script>
</body>
</html>