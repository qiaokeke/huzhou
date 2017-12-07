<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/navigatoin.css" />
    <link rel="shortcut icon" href="/static/picture/logo.ico" />
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />
    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
    <script type="text/javascript" src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/common.js"></script>
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
		/*#footer-in{*/
			/*position:absolute;*/
			/*width:100%;*/
			/*bottom:0;*/
		/*}*/
		html,body{
		height:100%;
		}
        a:link,a:visited{
            text-decoration:none;  /*超链接无下划线*/
        }
        a:hover{
            text-decoration:underline;  /*鼠标放上去有下划线*/
            color: #f1a179;
        }
        #menu-top a:hover{
          color: white !important;
        }
    </style>
		<title>导航页</title>
	</head>
	<body class="bg">
	<div class="wrapper">
		<div class="main">
	  <!--导航条-->
	  <div id="nav"><#include "nav.html"></div>
	  <!--内容-->
	  <div class="container">
  	  <div class="row ">
          <div class=" ">
              <a href="main">首页</a>
              >><a href="javascript:void (0)">绿色•低碳•能源•大数据平台</a>
          </div>
      </div>
    </div>
	<div id="gap"></div>
	  <div class="container-fluid" style="margin-top:6%;">
	    <div class="row">
		  <div class="col-sm-12 col-md-3 col-lg-3"></div>
	      <div class="col-sm-12 col-md-3 col-lg-3 text-center">
	        <a href="../login">
				<img src="/static/picture/images/manager.png" class="img-responsive center-block"/>
				<h2>园区管理</h2>
			</a>
	      </div>
	      <div class="col-sm-12 col-md-3 col-lg-3 text-center">
	        <a href="../login">
				<img src="/static/picture/images/user.png" class="img-responsive center-block"/>
				<h2>园区租户</h2>
			</a>
          </div>
		  <div class="col-sm-12 col-md-3 col-lg-3"></div>
	    </div>
	  </div>
		</div>
	</div>
	  <div id="footer-in"><#include "footer_1.html"></div>
	<script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	</body>
	<script>
	$(function(){
	hasLogin =  false;
//	$("#nav").load("/templates/huzhou/nav.html");
//	$("#footer-in").load("footer_new.html");
	});
	</script>
    <script type="text/javascript" src="/static/js/nav.js"></script>
</html>
