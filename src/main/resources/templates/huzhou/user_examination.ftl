<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>能耗体检</title>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/examination.js"></script>
    <link href="/static/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="icon" href="/static/picture/logo.ico" />
    <link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/examination.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <!--新增导航样式-->
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />
</head>

<body class="bg">
<div class="wrapper">
    <div class="main">
<!--顶部能耗预警-->
<div id="top-alert"><#include "top_warming.html"></div>
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
    <div class="container">
        <div class="row">
            <div class="" id="company-info">
                <ul>
                    <li>企业名称：<span>浙江久厨节能科技有限公司</span></li>
                    <li>厂房：<span>A11</span></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div id="month-consumption">
                <p>本月能耗情况：</p>
                <ul>
                    <li>电能：<span class="number">&nbsp;40&nbsp;</span>&nbsp;千克标煤</li>
                    <li>水能：<span class="number">&nbsp;70&nbsp;</span>&nbsp;千克标煤</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <p>能耗对比：</p>
            <div class="col-lg-6" style="height: 400px"  id="chart1"></div>
            <div class="col-lg-6" style="height: 400px"  id="chart2"></div>
        </div>
        <div class="row">
            <p>尖峰谷电统计：</p>
            <div id="power-all" style="height: 400px"></div>
        </div>
        <div class="row">
            <div id="success">
                <p>购电建议：</p>
                <ul>
                    <li>实购购电容量:&nbsp; <span class="number">353</span>&nbsp;KVA</li>
                    <li>实用购电容量:&nbsp; <span class="number">256</span>&nbsp;KVA</li>
                    <li>建议次月购电容量:&nbsp; <span class="number">300</span>&nbsp;KVA</li>
                    <li>预计节省:&nbsp; <span class="number">1563</span>&nbsp;元</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div id="all-examination">
                <p>总体能耗体检：</p>
                <p>比上月能耗同比增加&nbsp;<span class="number">2.1%</span>，用电高峰在每天的&nbsp;<span class="number">19</span>&nbsp;点至&nbsp;<span class="number">21</span>&nbsp;点，下月用电趋势会趋于与本月持平。本月无能耗告警，能耗用量在目标范围内，用能情况健康。</p>
            </div>
        </div>
    </div>
    </div>
</div>
<div id="footer-in"><#include "footer_1.html"></div>
    <script>
	hasLogin =  true;
	userHero = 'user';
	//加载顶部能耗预警
//	$("#top-alert").load("top_warming.html");
    /*加载导航条*/
//    $("#nav").load("nav.html");
//    $("#footer").load("footer_new.html", function() {
        /*加载完成后让footer导航条固定在底部*/
        // $("#nav-footer").removeClass('navbar-static-bottom');
        // $("#nav-footer").addClass('navbar-fixed-bottom');
//    });
    </script>
<script type="text/javascript" src="/static/js/nav.js"></script>
<script type="text/javascript" src="/static/js/top_warmming.js"></script>
</body>

</html>