<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>单一厂房明细</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/static/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/static/css/root_single_data.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/nav/nav-style.css" />
    <link href="/static/css/nav/newmain.css" rel="stylesheet" />
    <link href="/static/css/main.css" type="text/css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/picture/logo.ico" />
</head>

<body>
<div class="wrapper">
    <div class="main">
<!--导航条-->
<div id="nav"><#include "nav.html"></div>
    <!-- 产房电压电流值 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12" id="voltage_current"></div>
            </div>
        </div>
    </section>
    <!-- 水能耗 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12" id="water_data"></div>
            </div>
        </div>
    </section>
    <!-- 详细数据&&能耗预警 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12" id="data-wrap">
                    <div class="col-lg-6 col-md-6" id="detail-data">
                        <table class="table table-striped text-center table-hover">
                            <caption class="text-center">实时数据明细【日期】 2017-8-8</caption>
                            <thead>
                                <tr>
                                    <th>峰能耗</th>
                                    <th>峰电费</th>
                                    <th>谷能耗</th>
                                    <th>谷电费</th>
                                    <th>总能耗</th>
                                    <th>总电费</th>
                                    <th>记录时间</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>30.5</td>
                                    <td>26.49</td>
                                    <td>11.5</td>
                                    <td>12.74</td>
                                    <td>42</td>
                                    <td>39.23</td>
                                    <td>09:26:38</td>
                                </tr>
                                <tr>
                                    <td>30.5</td>
                                    <td>26.49</td>
                                    <td>11.5</td>
                                    <td>12.74</td>
                                    <td>42</td>
                                    <td>39.23</td>
                                    <td>09:23:38</td>
                                </tr>
                                <tr>
                                    <td>30.5</td>
                                    <td>26.49</td>
                                    <td>11.5</td>
                                    <td>12.74</td>
                                    <td>42</td>
                                    <td>39.23</td>
                                    <td>09:22:38</td>
                                </tr>
                                <tr>
                                    <td>30.5</td>
                                    <td>26.49</td>
                                    <td>11.5</td>
                                    <td>12.74</td>
                                    <td>42</td>
                                    <td>39.23</td>
                                    <td>09:20:38</td>
                                </tr>
                                <tr>
                                    <td>30.5</td>
                                    <td>26.49</td>
                                    <td>11.5</td>
                                    <td>12.74</td>
                                    <td>42</td>
                                    <td>39.23</td>
                                    <td>09:19:38</td>
                                </tr>
                                <tr>
                                    <td>30.5</td>
                                    <td>26.49</td>
                                    <td>11.5</td>
                                    <td>12.74</td>
                                    <td>42</td>
                                    <td>39.23</td>
                                    <td>09:16:38</td>
                                </tr>
                                <tr>
                                    <td>30.5</td>
                                    <td>26.49</td>
                                    <td>11.5</td>
                                    <td>12.74</td>
                                    <td>42</td>
                                    <td>39.23</td>
                                    <td>09:14:38</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-6 col-md-6" id="warming-data">
                        <table class="table table-striped text-center table-hover">
                            <caption class="text-center">能耗预警</caption>
                            <thead>
                                <tr>
                                    <th>时间</th>
                                    <th>用电量</th>
                                    <th>购电量</th>
                                    <th>预警</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2017-8</td>
                                    <td>233.49</td>
                                    <td>67.5</td>
                                    <td>1140.74</td>
                                </tr>
                                <tr>
                                    <td>2017-7</td>
                                    <td>233.49</td>
                                    <td>67.5</td>
                                    <td>1140.74</td>
                                </tr>
                                <tr>
                                    <td>2017-6</td>
                                    <td>233.49</td>
                                    <td>67.5</td>
                                    <td>1140.74</td>
                                </tr>
                                <tr>
                                    <td>2017-5</td>
                                    <td>233.49</td>
                                    <td>67.5</td>
                                    <td>1140.74</td>
                                </tr>
                                <tr>
                                    <td>2017-4</td>
                                    <td>233.49</td>
                                    <td>67.5</td>
                                    <td>1140.74</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </div>
</div>
    <!-- footer -->
    <div id="footer-in"><#include "footer_1.html"></div>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/root_single_data.js"></script>
    <script type="text/javascript">
    $(function() {
		hasLogin =  true;
		userHero = 'root';
//		$("#nav").load("nav.html");
//        $("#footer-in").load("footer_new.html");
//        $("#nav-footer").addClass('navbar-static-bottom');
    });
    </script>
    <script type="text/javascript" src="/static/js/nav.js"></script>
</body>

</html>