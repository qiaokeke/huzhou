<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>绿色智慧园区云管理系统</title>

    <!-- CSS &ndash;&gt;-->

    <link rel="stylesheet" type="text/css"  href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"/>
    <link rel="stylesheet" type="text/css"  href="/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"  href="/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css"  href="/static/css/login/form-elements.css"/>
    <link rel="stylesheet" type="text/css"  href="/static/css/login/style.css"/>
    <!-- Javascript &ndash;&gt;&ndash;&gt;-->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/login/jquery.backstretch.min.js"></script>
    <script src="/static/js/login/scripts.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries &ndash;&gt;&ndash;&gt;-->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// &ndash;&gt;&ndash;&gt;-->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="/static/picture/logo.ico"/>
    <style type="text/css">
        .warming-input {
            visibility: hidden;
            font-size: small;
            color: red;
        }

        .form-group {
            margin-bottom: 0 !important;
        }

        #form-bottom{
            padding: 25px 25px 30px 25px;
            background: #eee;
            -moz-border-radius: 0 0 4px 4px;
            -webkit-border-radius: 0 0 4px 4px;
            border-radius: 0 0 4px 4px;
            text-align: left;
        }

        .form-bottom form button.btn {
            width: 100%;
        }

        #login{
            width: 100%;
        }
    </style>

</head>
<body>

<!-- Top content -->
<div class="top-content">
    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>中节能（湖州）</strong> 节能环保产业园</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>用户登录</h3>
                            <p>请输入用户名和密码</p>
                        <#--<span th:text="${msg}"></span>-->
                        <span>${msg!}</span>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div id="form-bottom">
                        <!--/*@thymesVar id="loginBean" type=""*/-->
                        <form role="form" method="post" class="login-form" id="sub">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">用户名</label>
                                <input type="text" name="username" placeholder="用户名" class="form-username form-control" id="form-username"  />
                                <label class="warming-input" id="warming-username">用户名输入不正确</label>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="password" placeholder="密码" class="form-password form-control" id="form-password"/>
                                <label class="warming-input" id="warming-password">密码输入不正确</label>
                            </div>
                            <button type="submit" class="btn btn-info" id="login">登录</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--[if lt IE 10]>
<script src="/static/js/login/placeholder.js"></script>
<![endif]-->
<script type="text/javascript">
    jQuery(document).ready(function() {
        $.backstretch([
            "/static/picture/backgrounds/b2.jpg"
        ], {duration: 1000, fade: 750});
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#login").click(function () {
            /*做判断，跳转到首页*/
            //window.location.href="index_dnhgl.html";
            f=document.getElementById("sub");
            f.submit();
        });
    });
    $("#form-username").blur(function() {
        if ($(this).val() === "") {
            $("#warming-username").css('visibility', 'visible');
        } else if ($(this).val() != "") {
            $("#warming-username").css('visibility', 'hidden');
        }
    });
    $("#form-password").blur(function() {
        if ($(this).val() === "") {
            $("#warming-password").css('visibility', 'visible');
        } else if ($(this).val() != "") {
            $("#warming-password").css('visibility', 'hidden');
        }
    });
</script>
</body>

</html>