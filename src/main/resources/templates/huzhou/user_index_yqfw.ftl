<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>智慧园区服务</title>
    <link rel="stylesheet" href="/static/css/nav/swipebox.css" />
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/common.js"></script>
    <script src="/static/js/nav/jquery.swipebox.min.js"></script>
    <script src="/static/js/nav/owl.carousel.js"></script>
    <link rel="icon" href="/static/picture/logo.ico" />
    <!--圆形导航-->
    <link href="/static/css/nav/style.css" rel='stylesheet' type='text/css' />
    <link href="/static/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/nav/owl.carousel.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
    <!--新增导航样式-->
    <link href="/static/css/nav/newmain.css" type="text/css" rel="stylesheet" />
    <script>
    $(document).ready(function() {
        $("#owl-demo3").owlCarousel({
            items: 6,
            lazyLoad: true,
            autoPlay: true,
            navigation: false,
            pagination: false
        });
    });
    </script>
    <script type="text/javascript">
    jQuery(function($) {
        $(".swipebox").swipebox();
    });
    </script>
    <style type="text/css">
    #owl-demo3 {
        border: 1px #15A7F0 solid;
        border-radius: 25px;
    }
    </style>
</head>

<body class="bg">
<!--顶部能耗预警-->
<div id="top-alert"><#include "top_warming.html"></div>
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
    <div class="container">
        <div class="row ">
            <div class=" ">
                <a href="javascript:void(0)">首页</a> >>
                <a href="javascript:void(0)">绿色•低碳•能源•大数据平台</a> >>
                <a href="javascript:void(0)">智慧园区服务</a>
            </div>
        </div>
        <div class="column_2">
            <div class="row">
                <div class="col-md-3 col-xs-6 col-lg-3">
                    <div class="box_2">
                        <div class="inner_row ">
                            <!--<i class="fa fa-fa-clock-o fa-clock-o icon_1"> </i>-->
                            <span class="glyphicon glyphicon-dashboard icon_2" aria-hidden="true"></span>
                            <h2>智慧招商</h2>
                            <h3>资源管理</h3>
                            <h3>项目管理</h3>
                            <h3>数字沙盘</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6 col-lg-3">
                    <div class="box_2">
                        <div class="inner_row">
                            <span class="glyphicon glyphicon-edit icon_2" aria-hidden="true"></span>
                            <h2>智慧管理</h2>
                            <h3>物业管理</h3>
                            <h3>安防管理</h3>
                            <h3>消防管理</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6 col-lg-3">
                    <div class="box_2">
                        <div class="inner_row">
                            <span class="glyphicon glyphicon-bell icon_2" aria-hidden="true"></span>
                            <h2>智慧服务</h2>
                            <h3>一站式入驻服务</h3>
                            <h3>园企互动服务</h3>
                            <h3>人才金融服务</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6 col-lg-3">
                    <div class="box_2">
                        <div class="inner_row">
                            <span class="glyphicon glyphicon-retweet icon_2" aria-hidden="true"></span>
                            <h2>智慧产业</h2>
                            <h3>产业云平台</h3>
                            <h3>产业趋势</h3>
                            <h3>产业指数</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div id="footer-in"><#include "footer_new.html"></div>
        <script type="text/javascript">
        $(function() {
			hasLogin =  true;
			userHero = 'user';
			//加载顶部能耗预警
//			$("#top-alert").load("top_warming.html");
            $("body").css('height',$(window).height());
            /*加载导航条*/
//            $("#nav").load("nav.html");
//           /* $("#footer-in").load("footer_new.html", function() {
//                /!*加载完成后让footer导航条固定在底部*!/
                $("#nav-footer").removeClass('navbar-static-bottom');
                $("#nav-footer").addClass('navbar-fixed-bottom');
//            });*/
        });
        </script>
<script type="text/javascript" src="/static/js/nav.js"></script>
<script type="text/javascript" src="/static/js/top_warmming.js"></script>
</body>

</html>