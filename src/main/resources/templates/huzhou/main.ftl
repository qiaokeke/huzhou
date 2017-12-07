<!DOCTYPE html>
<html lang="en">

<head>
    <title>中节能（湖州）环保产业园</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1,maximum-scale=1, user-scalable=no" />
    <meta name="applicable-device" content="pc,mobile" />
    <meta name="description" content="中国节能环保集团公司是唯一一家主业为节能减排、环境保护的中央企业。拥有各级子公司338家，上市公司5家，分布在国内近30个省市及境外近40个国家和地区，致力于成为质量优秀的科技型服务型跨国经营企业集团。" />
    <meta name="keywords" content="中国节能环保集团公司，中国节能，中国节能环保，www.cecep.cn" />
    <meta name="author" content="中国节能环保集团公司" />
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />
    <link rel="icon" href="/static/picture/logo.ico" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
</head>

<body class="bg">
<div class="wrapper">
    <div class="main">
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
        <#--用户为空的时候-->
  <#--  <#if username??>
        ${username}
    <#else>
        <span>怎么则</span>
    </#if>-->
        <#--<@shiro.user>
            <@shiro.principal/>
        </@shiro.user>-->
    <div id='main-carousel' class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#main-carousel" data-slide-to="0" class="active"></li>
            <li data-target="#main-carousel" data-slide-to="1"></li>
            <li data-target="#main-carousel" data-slide-to="2"></li>
            <li data-target="#main-carousel" data-slide-to="3"></li>
            <li data-target="#main-carousel" data-slide-to="4"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="">
            <div class="carousel-inner" role="listbox" style="margin: 50px auto ; ">
                <div class="item active height ">
                    <a href='javascript:void (0)' title="湖州园区">
                    <img src="/static/picture/backgrounds/b3.png" class="img-responsive center-block" alt="湖州园区" />
                </a>
                </div>
                <div class="item height">
                    <a href='javascript:void (0)' title="湖州园区">
                    <img src="/static/picture/backgrounds/b2.png" class="img-responsive center-block" alt="湖州园区" />
                </a>
                </div>
                <div class="item height">
                    <a href='javascript:void (0)' title="湖州园区">
                    <img src="/static/picture/backgrounds/b1.png" class="img-responsive center-block" alt="湖州园区" />
                </a>
                </div>
                <div class="item height">
                    <a href='/templates/huzhou/ssjc_map.html' title="湖州园区">
                    <img src="/static/picture/backgrounds/b2.jpg" class="img-responsive " alt="湖州园区" />
                </a>
                </div>
                <div class="item height">
                    <a href='/templates/huzhou/ssjc_map.html' title="湖州园区">
                    <img src="/static/picture/backgrounds/b5.png" class="img-responsive center-block" alt="湖州园区" />
                </a>
                </div>
            </div>
        </div>
        <!-- Controls 左右箭头-->
        <a class="left carousel-control" href="#main-carousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">上一张</span>
    </a>
        <a class="right carousel-control" href="#main-carousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">下一张</span>
    </a>
    </div>
    </div>
</div>
    <div id="footer-in"><#include "footer_1.html"></div>
    <div id='query-sug-outer'></div>
    <div id='uitips'>
        <div id='uitipsbar'>&times;</div>
        <div id='uitipscont'></div>
    </div>
    <script src='/static/js/jquery.min.js'></script>
    <script src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
    $(function () {
        $('.carousel').carousel({
            interval: 50000*36
        });
		
        /*加载导航条*/
	/*	hasLogin = false;
//        $("#nav").load("nav.html");
		$("#menu-top li:nth-child(2) a").attr('href', 'navigation.html')
        $("#menu-top li:nth-child(3) a").attr('href', 'navigation.html')
		$("#top-my-menu a:nth-child(2)").attr('href', 'navigation.html')
        $("#top-my-menu a:nth-child(3)").attr('href', 'navigation.html')*/
//        $("#footer-in").load("footer_new.html",function(){
//            /*加载完成后让footer导航条固定在底部*/
//            $("#nav-footer").removeClass('navbar-static-bottom');
//            $("#nav-footer").addClass('navbar-fixed-bottom');
//        });
    });
	</script>
<script src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/nav.js"></script>
</body>
</html>