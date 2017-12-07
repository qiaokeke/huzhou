<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>电能耗管理</title>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/china.js"></script>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/common.js"></script>
    <!--把font文件夹丢进来就没错误了-->
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="icon" href="/static/picture/logo.ico" />
    <link href="/static/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <!--新增导航样式-->
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />
    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
    <style type="text/css">
    a:link,
    a:visited {
        text-decoration: none;
        /*超链接无下划线*/
    }

    a:hover {
        text-decoration: underline;
        /*鼠标放上去有下划线*/
        color: #f1a179;
    }
    </style>
</head>

<body class="bg">
<div class="wrapper">
    <div class="main">
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
    <div class="container">
        <div class="row ">
            <div class=" ">
                <a href="main">首页</a> >>
                <a href="javascript:void (0)">绿色•低碳•能源•大数据平台</a>
            </div>
        </div>
        <div class='container busrow main-body'>
            <div class="row">
                <div class="col-md-10 col-xs-12 col-md-offset-1">
                    <div class='col-md-4 col-xs-6  '>
                        <div class='busblock' href="javascript:void(0)" data-colid='4'>
                            <div class='buspicblock p3'>
                                <i class="fa fa-font" aria-hidden="true"></i>
                                <p>低碳能源平台</p>
                            </div>
                            <a href="rootSsjcMap">
                                <h2>实时监测</h2>
                            </a>
                            <a href="rootDb">
                                <h2>大数据分析</h2>
                                <!--<p><span>大数据分析</span></p>-->
                            </a>
                         <#--   <a href="rootWarning">
                                <h2>能耗预警</h2>
                            </a>-->
                            <a href="rootScreen" target="_blank">
                                <h2>能耗大屏</h2>
                                <!--  <p><span>节能目标管理</span></p>-->
                            </a>
                            <a href="rootManager">
                                <h2>管理页面</h2>
                                <!--  <p><span>节能目标管理</span></p>-->
                            </a>
                        </div>
                    </div>
                    <div class='col-md-4 col-xs-6'>
                        <div class='busblock' href='javascript:void(0)' data-colid='5'>
                            <div class='buspicblock p5'>
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                <p>智慧环境监测</p>
                            </div>
                            <a href="javascript:void(0)">
                                <h2>空气监测</h2>
                            </a>
                            <a href="javascript:void(0)">
                                <h2>水质监测</h2>
                            </a>
                            <a href="javascript:void(0)">
                                <h2>生态检测</h2>
                            </a>
                            <!--<p><span>水质监测</span></p>-->
                            <p><span></span></p>
                        </div>
                    </div>
                    <div class='col-md-4 col-xs-6'>
                        <div class='busblock' href='javascript:void (0)' data-colid='4'>
                            <div class='buspicblock p4'>
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                                <p>智慧照明</p>
                            </div>
                            <a href="javascript:void(0)">
                                <h2>实时控制</h2>
                            </a>
                            <a href="javascript:void(0)">
                                <h2>照明计划</h2>
                            </a>
                            <!--<p><span>智慧照明</span></p>&ndash;&gt;-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
    <!-- /container -->
    <!--footer-->
<div id="footer-in"><#include "footer_1.html"></div>
    <script type="text/javascript">
    $(function() {
	hasLogin =  true;
	userHero = 'root';
        /*加载导航条*/
//        $("#nav").load("nav.html");
//        $("#footer-in").load("footer_new.html", function() {
            /*加载完成后让footer导航条固定在底部*/
//            $("#nav-footer").removeClass('navbar-static-bottom');
//            $("#nav-footer").addClass('navbar-fixed-bottom');
//        });
    });
    </script>
<script type="text/javascript" src="/static/js/nav.js"></script>
</body>

</html>