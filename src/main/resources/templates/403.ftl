<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>403 forbidden</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/static/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="/static/css/matrix-style.css" />
    <link rel="stylesheet" href="/static/css/matrix-media.css" />
    <link href="/static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <style>
        html,body{
            margin: 0 auto;
        }
        #content{
            margin: 0 auto;
        }
        #footer-bar{
            position: absolute;
            bottom: 20px;
            left: 45%;
        }
        #header{
            margin-top: 12%;
        }
    </style>
</head>
<body>

<!--Header-part-->
<div id="header">
    <h1 class="text-center"><a href="dashboard.html">Matrix Admin</a></h1>
</div>

<!--top-Header-menu-->
<!--<div th:include="common/top :: top"></div>
<div th:include="common/menu :: menu"></div>-->


<div id="content">
    <div id="content-header">
        <div id="breadcrumb" class="text-center"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Sample pages</a> <a href="#" class="current">Error</a> </div>
        <h1 class="text-center">Error 403</h1>
    </div>
    <div class="container-fluid" id="content">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
                        <h5 class="text-center">Error 403</h5>
                    </div>
                    <div class="widget-content">
                        <div class="error_ex">
                            <h1 class="text-center">403</h1>
                            <h3 class="text-center">Opps, You're lost.</h3>
                            <p class="text-center">Access to this page is forbidden</p>
                            <p class="text-center"><a class="btn btn-warning btn-big text-center"  href="/login">Back to Home</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Footer-part-->
<div class="container-fluid text-center"  id="footer-bar">
    <div class="row">
        <div> 2017 &copy; yqj <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
    </div>
</div>
</body>
</html>