<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>电费通知单</title>
    <!-- 引入打印样式 -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css" media="print">
    <link rel="stylesheet" type="text/css" href="/static/css/report1.css" media="print">
    <!-- 正常引入页面浏览样式 -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/report1.css">
    <script language="javascript" src="/static/js/jquery.min.js"></script>
    <!-- 
    如果您使用的是高版本jQuery调用下面jQuery迁移辅助插件即可
    <script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script>
    -->
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</head>

<body>
    <div id="report">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <h3 class="text-center" id="topic">电费通知单（2017年7月）</h3>
                    <input type="button" onclick="print_page()" value="打印" id="print-input" class="btn btn-default"/>
                    <img src="/static/picture/cecep.png" id="cecep">
                    <p>嘉兴道默工程塑料有限公司：</p>
                    <p class="text1">根据贵公司与我司签订的协议规定，贵公司2017年7月份应缴纳的带你飞如下，请贵司核对本月的用电数量，我司将开具增值税发票。</p>
                    <table class="table text-center table-hover">
                        <thead>
                            <tr>
                                <th>厂房</th>
                                <th>表名</th>
                                <th>上次抄表</th>
                                <th>本次抄表</th>
                                <th>累计数</th>
                                <th>倍率</th>
                                <th>实际用电量(度)</th>
                                <th>单价(元/度)</th>
                                <th>实际用电量金额(元)</th>
                                <th>基本容量</th>
                                <th>基本容量单价</th>
                                <th>基本容量费</th>
                                <th>合计(元)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="3">19#厂房</td>
                                <td>&nbsp;峰&nbsp;</td>
                                <td>4,189.01</td>
                                <td>4,631.45</td>
                                <td>442.44</td>
                                <td>30</td>
                                <td>13,273.20</td>
                                <td>0.9641</td>
                                <td>12796.69</td>
                                <td rowspan="3">50.00</td>
                                <td rowspan="3">30.00</td>
                                <td rowspan="3">1500.00</td>
                                <td rowspan="3">24,792.76</td>
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
                        </tbody>
                    </table>
                    <div>
                        <div class="col-md-4 cil-sm-4 col-xs-4">制表人：<span style="margin-right: 30px;">晁敏只</span></div>
                        <div class="col-md-4 cil-sm-4 col-xs-4">审核人：<span></span></div>
                        <div class="col-md-4 cil-sm-4 col-xs-4"> 日期：<span></span></div>
                    </div>
                    <div class="row">
                        <div class="">
                            <p style="margin-top: 40px;">应于<span>2017年8月10日</span>前按以上费用项目支付。</p>
                        <p>发票号码：</p>
                        <p>开户银行：<span style="margin-right: 60px;">建设银行嘉兴秀洲支行</span>账号：<span>33001638035059856999</span></p>
                            <p>本通知书已于_____ 年___ 月___日___时___分送达。</p>
                            <p>通知单签收人：</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-8 col-sm-offset-7 col-xs-offset-8">
                            <p>中节能（嘉兴）环保科技园发展有限公司</p>
                            日期：<span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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