<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>绿色智慧园区云管理系统</title>
    <!-- CSS -->
    <link rel="stylesheet" href="/static/http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
    <link rel="stylesheet" href="/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/static/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/static/css/login/form-elements.css" />
    <link rel="stylesheet" href="/static/css/login/style.css" />

    <!-- Javascript -->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/login/jquery.backstretch.min.js"></script>
    <script src="/static/js/login/scripts.js"></script>


    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/picture/logo.ico" />
    <style type="text/css">
    .warming-input {
        visibility: hidden;
        font-size: small;
        color: red;
    }
    .form-group {
        margin-bottom: 0 !important;
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
                        <h1><strong>中节能（湖州）</strong> 环保产业园</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>用户登录</h3>
                                <p>请输入用户名和密码</p>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-lock"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form role="form" action="" method="post" class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">用户名</label>
                                    <input type="text" name="form-username" placeholder="用户名" class="form-username form-control" id="form-username" />
                                    <label class="warming-input" id="warming-username">用户名输入不正确</label>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">密码</label>
                                    <input type="password" name="form-password" placeholder="密码" class="form-password form-control" id="form-password" />
                                    <label class="warming-input" id="warming-password">密码输入不正确</label>
                                </div>
                                <button  class="btn btn-info" id="login">登录</button>
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
            "/static/picture/backgrounds/b1.jpg"
        ], { duration: 1000, fade: 750 });
    });
    </script>
    <script type="text/javascript">
    $(function() {
        $("#login").click(function() {
            if (($("#form-username").val() != "") && ($("#form-password").val() != "")) {

                /*ajax请求验证*/
                // var it = $.ajax({
                //     type: 'GET',
                //     dataType: 'json',
                //     async: false,
                //     url: '',
                //     success: function(data) {

                //     },
                //     error: function() {
                //         console.log("信息读取失败");
                //     }
                // });
                window.location.href = "root_index_dnhgl.ftl";
                return false;
            }
			else if(($("#form-username").val() === "") && ($("#form-password").val() === "")){
				 $("#warming-username").css('visibility', 'visible');
				  $("#warming-password").css('visibility', 'visible');
			}
			
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
    });
    </script>
</body>

</html>