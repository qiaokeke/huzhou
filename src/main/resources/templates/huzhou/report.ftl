<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>电费报表</title>
    <!-- 引入打印样式 -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css" media="print">
    <link rel="stylesheet" type="text/css" href="/static/css/report2.css" media="print">
    <!-- 正常引入页面浏览样式 -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/report2.css">
    <script language="javascript" src="/static/js/jquery.min.js"></script>
    <!-- 
如果您使用的是高版本jQuery调用下面jQuery迁移辅助插件即可
<script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script>
-->
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</head>

<body>
    <script type="text/javascript">
        function preview(oper)
        {
            if (oper < 10)
            {
                bdhtml=window.document.body.innerHTML;//获取当前页的html代码
                sprnstr="<!--startprint-->";//设置打印开始区域
                eprnstr="<!--endprint-->";//设置打印结束区域
                prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html

                prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
                window.document.body.innerHTML=prnhtml;
                console.log(prnhtml);
                window.print();
                window.document.body.innerHTML=bdhtml;
            } else {
                window.print();
            }
        }

    </script>
    <!--startprint-->
    <div id="report">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <h3 class="text-center" id="topic">中国节能湖州环保产业园2017年7月份电费报表</h3>
                    <input type="button" onclick="print_page()" value="打印" id="print-input" class="btn btn-default" />
                    <img src="/static/picture/cecep.png" id="cecep">
                    <p class="text-center">抄表日期：2017年8月10日</p>
                    <table class="table text-center table-hover" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>序号</th>
                                <th>公司名称</th>
                                <th>用户地址</th>
                                <th>表名</th>
                                <th>上次抄表
                                    <br/><span class="reading-time">(7月10日)</span></th>
                                <th>本次抄表
                                    <br/><span class="reading-time">(8月10日)</span></th>
                                <th>累计数</th>
                                <th>倍率</th>
                                <th>累计总数</th>
                                <th>单价</th>
                                <th>尖峰谷电费</th>
                                <th>小计</th>
                                <th>基本容量</th>
                                <th>基本容量费</th>
                                <th>基本电费</th>
                                <th>电费合计</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 厂房1 -->
                            <tr>
                                <td rowspan="4">1</td>
                                <td rowspan="4">爱家电器</td>
                                <td rowspan="4">1#厂房</td>
                                <td>总表</td>
                                <td>1,988.57</td>
                                <td>2,170.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">7255.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房2 -->
                            <tr>
                                <td rowspan="4">2</td>
                                <td rowspan="4">亮兮柯电子</td>
                                <td rowspan="4">2#厂房</td>
                                <td>总表</td>
                                <td>1,988.57</td>
                                <td>2,170.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">5635.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房3 -->
                            <tr>
                                <td rowspan="4">3</td>
                                <td rowspan="4">米达卡服饰</td>
                                <td rowspan="4">3#厂房</td>
                                <td>总表</td>
                                <td>1,988.57</td>
                                <td>2,170.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">6335.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房4 -->
                            <tr>
                                <td rowspan="4">4</td>
                                <td rowspan="4">沃尔德</td>
                                <td rowspan="4">5#厂房</td>
                                <td>总表</td>
                                <td>1,988.57</td>
                                <td>2,170.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">6635.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房5 -->
                            <tr>
                                <td rowspan="4">5</td>
                                <td rowspan="4">汉珏机械</td>
                                <td rowspan="4">7#厂房</td>
                                <td>总表</td>
                                <td>1,588.57</td>
                                <td>2,173.74</td>
                                <td>122.17</td>
                                <td>40</td>
                                <td>7386.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">6435.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房6 -->
                            <tr>
                                <td rowspan="4">6</td>
                                <td rowspan="4">普利派克</td>
                                <td rowspan="4">8#厂房</td>
                                <td>总表</td>
                                <td>1,788.57</td>
                                <td>2,10.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">7225.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房7 -->
                            <tr>
                                <td rowspan="4">7</td>
                                <td rowspan="4">威斯柏</td>
                                <td rowspan="4">12#厂房</td>
                                <td>总表</td>
                                <td>1,988.57</td>
                                <td>2,170.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">7365.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,616.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>543.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房8 -->
                            <tr>
                                <td rowspan="4">8</td>
                                <td rowspan="4">嘉兴进隆塑业</td>
                                <td rowspan="4">16#厂房</td>
                                <td>总表</td>
                                <td>1,908.57</td>
                                <td>2,170.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">5335.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">5535.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>832.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,490.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 厂房9 -->
                            <tr>
                                <td rowspan="4">9</td>
                                <td rowspan="4">碧波化工</td>
                                <td rowspan="4">18#厂房</td>
                                <td>总表</td>
                                <td>1,588.57</td>
                                <td>2,170.74</td>
                                <td>182.17</td>
                                <td>40</td>
                                <td>7286.80</td>
                                <td></td>
                                <td></td>
                                <td rowspan="4">6135.83</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">30</td>
                                <td rowspan="4">900.00</td>
                                <td rowspan="4">7035.83</td>
                            </tr>
                            <tr>
                                <td>峰</td>
                                <td>1,473.86</td>
                                <td>1,614.44</td>
                                <td>140.58</td>
                                <td>40</td>
                                <td>5623.20</td>
                                <td>0.9672</td>
                                <td>5438.76</td>
                            </tr>
                            <tr>
                                <td>尖</td>
                                <td>739.54</td>
                                <td>822.57</td>
                                <td>83.03</td>
                                <td>30</td>
                                <td>2,400.90</td>
                                <td>1.2267</td>
                                <td>3055.59</td>
                            </tr>
                            <tr>
                                <td>谷</td>
                                <td>4,672.44</td>
                                <td>5，188.71</td>
                                <td>516.27</td>
                                <td>30</td>
                                <td>15,488.10</td>
                                <td>0.4804</td>
                                <td>7440.48</td>
                            </tr>
                            <!-- 合计 -->
                            <tr>
                                <td></td>
                                <td>合计</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>32240.27</td>
                                <td></td>
                                <td></td>
                                <td>29350.00</td>
                                <td>61590.27</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div id="table-two">
                            <table class="table text-center table-hover" id="small-table">
                                <thead>
                                    <tr>
                                        <td></td>
                                        <td>总表总度数</td>
                                        <td>总表峰尖谷电费</td>
                                        <td>分表合计</td>
                                        <td>本月电单价</td>
                                        <td>损耗率(含公共用电)</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>峰</td>
                                        <td>99915.00</td>
                                        <td>0.932600</td>
                                        <td>96342.10</td>
                                        <td>0.9672</td>
                                        <td>3.58%</td>
                                    </tr>
                                    <tr>
                                        <td>尖</td>
                                        <td>11220.00</td>
                                        <td>1.114600</td>
                                        <td>55352.20</td>
                                        <td>0.4797</td>
                                        <td>7.08%</td>
                                    </tr>
                                    <tr>
                                        <td>谷</td>
                                        <td>59190.00</td>
                                        <td>0.448600</td>
                                        <td>55352.20</td>
                                        <td>0.4797</td>
                                        <td>6.48%</td>
                                    </tr>
                                    <tr>
                                        <td>合计</td>
                                        <td>170325.00</td>
                                        <td></td>
                                        <td>162120.10</td>
                                        <td></td>
                                        <td>4.82%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--endprint-->
    <script type="text/javascript">
    function print_page() {
        if (!!window.ActiveXObject || "ActiveXObject" in window) {
            remove_ie_header_and_footer();
        }
        window.print();
    };

    function remove_ie_header_and_footer() {
        var hkey_root, hkey_path, hkey_key;
        hkey_path = "HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
        try {
            var RegWsh = new ActiveXObject("WScript.Shell");
            RegWsh.RegWrite(hkey_path + "header", "");
            RegWsh.RegWrite(hkey_path + "footer", "");
        } catch (e) {}
    }
    </script>
</body>

</html>