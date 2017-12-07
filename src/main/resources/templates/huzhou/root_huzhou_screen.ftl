<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>湖州能耗大屏</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="shortcut icon" href="/static/picture/logo.ico" />
    <link href="/static/css/huzhou_screen.css?version=1.8.10" rel="stylesheet" />
</head>

<body>
    <!-- 添加滤镜层 -->
    <div class="filter">
        <!-- 使用bootstrap实现三列等高布局 -->
        <div class="container-fluid">
            <div class="row" id="wrap-all">
                <!-- 左部 -->
                <div class="col-lg-4 col-md-4 wrap" id="wrap-left">
                    <!-- 左边顶部 -->
                    <div id="left-top" class="set-height">
                        <div class="weather-left col-lg-4 col-md-4">
                            <img src="/static/picture/weather/duoyun.png" id="weather-img" />
                            <p></p>
                            <p>PM2.5:21μg/m³</p>
                            <p>PM10:32μg/m³</p>
                            <p>O3:181ug/m³</p>
                            <p>SO2:4ug/m³</p>
                            <p>NO2:7ug/m³</p>
                            <p>CO:8ug/m³</p>
                        </div>
                        <div class="weather-right">
                            <div class="weather-text">
                                <div class="weather-text-left"><span class="centigrade">10&#176;</span></div>
                                <div class="weather-text-right">湖州<br />多云</div>
                            </div>
                            <div class="weather-bottom">
                                <div class="weather-bottom-left">
                                    <p>2&#176; ~ 12&#176;  北风三级</p>
                                    <p>湿度：28%</p>
                                    <p>PH值:6.8</p>
                                    <p>蚀度:0.5</p>
                                    <p>电导率:30μS/cm</p>
                                    <p>氨氮:0．5mg/L</p>
                                </div>
                                <div class="weather-bottom-right">
                                    <p>COD:60mg/L</p>
                                    <p>DO:28.3ml/L</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <!-- 左边中部 -->
                    <div id="left-middle" class="set-height"></div>
                    <!-- 左边底部 -->
                    <div id="left-bottom" class="set-height">
                        <div class="item-font text-center">实时能耗</div>
                        <marquee id="affiche" align="left" behavior="scroll"  direction="up" width="100%" height="100%" hspace="50" vspace="20" loop="-1" scrollamount="3" scrolldelay="100" onMouseOut="this.start()" onMouseOver="this.stop()">
                            <div class="item-1" id="needWrap">
                                <table class="table table-condensed table-bg" id="cons">
                                    <tr class="text-center">
                                        <td></td>
                                        <td>公司名称</td>
                                        <td>电能耗(kwh)</td>
                                        <td>水能耗(吨)</td>
                                    </tr>
                                </table>
                            </div>
                        </marquee>
                    </div>
                </div>
                <!-- 中部 -->
                <div class="col-lg-4 col-md-4 wrap" id="wrap-center">
                    <div id="center-top" class="text-center">
                        <h2>中节能（湖州）节能环保产业园<br>低碳能源大数据服务平台</h2>
                        <div class="text-center time">
                            <span class="glyphicon glyphicon-time"></span>
                            <span class="now"></span>
                        </div>
                        <div class="wrap-cost">
                            <span class="day-cost">当年能耗(单位：千克标煤)</span>
                            <div>
                                <ul id="coal">
                                    <li>0</li>
                                    <li>0</li>
                                    <li>0</li>
                                    <li>0</li>
                                    <li>0</li>
                                    <li>0</li>
                                    <li>.</li>
                                    <li>0</li>
                                    <li>0</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="center-middle"></div>
                    <div id="center-bottom">
                        <table class="table text-center table-hover" id="consumption-warming">
                            <caption class="text-center">能耗预警</caption>
                            <thead>
                            <tr>
                                <th>监测点</th>
                                <th>当前值</th>
                                <th>最低阀值</th>
                                <th>最高阀值</th>
                                <th>信息</th>
                                <th>时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>电力监测点A22</td>
                                <td>0</td>
                                <td>23.52</td>
                                <td>578.66</td>
                                <td>A相电流异常</td>
                                <td>12:34:00 9/12</td>
                            </tr>
                            <tr>
                                <td>水力监测点A21</td>
                                <td>0</td>
                                <td>29.56</td>
                                <td>478.66</td>
                                <td>设备离线</td>
                                <td>10:22:00 9/8</td>
                            </tr>
                            <tr>
                                <td>电力监测点B10</td>
                                <td>0</td>
                                <td>23.52</td>
                                <td>578.66</td>
                                <td>数值异常</td>
                                <td>12:34:00 9/6</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 右部 -->
                <div class="col-lg-4 col-md-4 wrap" id="wrap-right">
                    <!-- 右边顶部 -->
                    <div id="right-top" class="set-height"></div>
                    <!-- 右边中部 -->
                    <div id="right-middle" class="set-height"></div>
                    <!-- 右边底部 -->
                    <div id="right-bottom" class="set-height"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 引入js文件 -->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/huzhou_screen.js?version=1.8.10"></script>
</body>

</html>