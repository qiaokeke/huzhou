<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <script src="/static/js/map/d3v4.js"></script>
    <script src='/static/js/map/d3tip.js'></script>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/map/huzhou_factory.js?version=1"></script>
    <script src="/static/js/bootstrap.min.js"></script>

    <link rel="icon" href="/static/picture/logo.ico" />
    <!--新增导航样式-->
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />
    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="/static/css/map/d3tip.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
	<title>园区模拟图</title>
</head>

<body class="bg">
<div class="wrapper">
    <div class="main">
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
<div class="container-fluid">
    <div id='container' style='width:1000px;height:800px ' class="center-block">
        <svg id = 'containerSvg' ></svg>
    </div>
    <br class="clear" />
</div>
    </div>
</div>
<div id="footer-in"><#include "footer_1.html"></div>

<script type="text/javascript">
    $(function () {
	hasLogin =  true;
	userHero = 'root';
//        $("#nav").load("nav.html");
//		$("#footer-in").load("footer_new.html");
    });
    $(document).ready(function(){

        var data = {'A22': {'companyName': '浙江久厨节能科技有限公司', 'factoryNumber':'A22','electricity':134.87,'water':26.14,'energyState':'正常'},//能耗状态：正常
            'A18': {'companyName': '湖州三荣节能环保产品贸易有限公司', 'factoryNumber':'A18', 'electricity':10,'water':10,'energyState':'正常'},
            'A19': {'companyName': '浙江国鼎环境工程有限公司', 'factoryNumber':'A19', 'electricity':20,'water':5,'energyState':'正常'},
            'A17': {'companyName': '浙江德赛堡建筑材料科技有限公司', 'factoryNumber':'A17', 'electricity':40,'water':7,'energyState':'正常'}};
        // drawFactor(divId, imgId, data, max)
        // 父级容器的div
        // data: 传入的数据
        // max: 用电量的最大值
        var url = '/static/picture/map/huzhou_3d.jpeg';
                $.ajax({
            type: 'GET',
            dataType: 'json',
            async: false,
            url: '/company/mapInfo',
            success: function(myJson) {
                drawFactory('container', myJson[0], 10000, url )
            },
            error:function(){
                console.log("json信息读取失败");
            }
        });
//        drawFactory('container', data[0], 10000, url )
    });
</script>
<script type="text/javascript" src="/static/js/nav.js"></script>
</body>

</html>
