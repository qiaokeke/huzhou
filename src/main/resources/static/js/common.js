var storage = null;
if (window.localStorage) {
    var storage = window.localStorage
}

function getLocalStorage(b) {
    var a = "";
    if (storage) {
        a = storage.getItem(b);
        if (a == null || a == "") {
            a = getCookie(b);
            storage.setItem(b, a)
        }
    } else {
        a = getCookie(b)
    }
    return a
}

function setLocalStorage(a, b) {
    if (storage) {
        storage.setItem(a, b)
    } else {
        ret = setCookie(a, b)
    }
}

function getCookie(b) {
    var a, c = new RegExp("(^| )" + b + "=([^;]*)(;|$)");
    if (a = document.cookie.match(c)) {
        return unescape(a[2])
    } else {
        return ""
    }
}

function setCookie(a, c) {
    var b = 30;
    var d = new Date();
    d.setTime(d.getTime() + b * 24 * 60 * 60 * 1000);
    document.cookie = a + "=" + escape(c) + ";expires=" + d.toGMTString() + ";path=/"
}

function isFuncExist(funcName) {
    try {
        if (typeof (eval(funcName)) == "function") {
            return true
        } else {
            return false
        }
    } catch (e) {}
    return false
}
var canLoginRegSubmit = true;

function switchToModal(a) {
    if (a == "reg") {
        $("#modalLogin").modal("hide");
        $("#modalReg").modal("show")
    } else {
        if (a == "login") {
            $("#modalReg").modal("hide");
            $("#modalLogin").modal("show")
        }
    }
}
var canLoginCallBack = false;

function login() {
    if ($("#modalLogin .lblerr").length > 0) {
        return
    }
    if (!$("#modalLoginErr").is(":hidden")) {
        return
    }
    var a = $.trim($("#modal-login-name").val());
    var b = $.trim($("#modal-login-pwd").val());
    var d = true;
    if (a == "") {
        var c = "璇疯緭鍏ラ偖绠�/鎵嬫満鍙�/鏄电О";
        $("#modal-login-name").parent().append("<label class='lblerr'>" + c + "</label>");
        d = false
    }
    if (b == "") {
        var c = "璇疯緭鍏ュ瘑鐮�";
        $("#modal-login-pwd").parent().append("<label class='lblerr'>" + c + "</label>");
        d = false
    }
    if (d) {
        $.post("/account/check", {
            name: a,
            pwd: b,
            rmb: ($("#chk-rmb").prop("checked") ? 1 : 0)
        }, function (g) {
            if (g && g.r == 1) {
                hasLogin = true;
                var e = g.rdi;
                var f = window.location.href;
                if (canLoginCallBack && isFuncExist("loginCallBack")) {
                    loginCallBack();
                    canLoginCallBack = false
                } else {
                    if (getQueryString("rdi")) {
                        window.location.href = getQueryString("rdi")
                    } else {
                        if (e == "/" && f.indexOf("/account/login") < 0) {
                            window.location.reload()
                        } else {
                            window.location.href = e
                        }
                    }
                }
            } else {
                if (g.msg && g.msg != "") {
                    $("#modal-login-pwd").blur();
                    $("#modalLoginErrCont").html(g.msg);
                    $("#modalLoginErr").show()
                }
            }
        }, "json")
    }
}

function reg() {
    if ($("#modalReg .lblerr").length > 0) {
        return
    }
    if (!$("#modalRegErr").is(":hidden")) {
        return
    }
    var a = $.trim($("#modal-reg-name").val());
    var b = $.trim($("#modal-reg-pwd").val());
    var d = true;
    if (a == "") {
        var c = "璇疯緭鍏ラ偖绠�/鎵嬫満鍙�";
        $("#modal-reg-name").parent().append("<label class='lblerr'>" + c + "</label>");
        d = false
    }
    if (b == "") {
        var c = "璇疯緭鍏ュ瘑鐮�";
        $("#modal-reg-pwd").parent().append("<label class='lblerr'>" + c + "</label>");
        d = false
    } else {
        if (b.length < 6) {
            var c = "瀵嗙爜涓嶈冻6浣�";
            $("#modal-reg-pwd").parent().append("<label class='lblerr'>" + c + "</label>");
            d = false
        }
    } if (d) {
        $.post("/account/reg", {
            name: a,
            pwd: b,
            pcode: $("#modal-reg-pcode").val(),
            captcha: $("#modal-reg-captcha").val()
        }, function (f) {
            if (f && f.r == 1) {
                if (f.hasSendMail == 1) {
                    var e = "<p>鎴戜滑缁欐偍鍙戦€佷簡楠岃瘉閭欢锛岃鍓嶅線鎮ㄧ殑閭鏌ユ敹銆�</p>";
                    if (f.loginAddr && f.loginAddr != "") {
                        e += "<p style='text-align:center;'><a href='" + f.loginAddr + "' target='_blank' rel='nofollow' role='button' class='btn' id='btn-tomymail'>鍓嶅線閭鏌ユ敹</a></p>"
                    }
                    $("#reg-succ-tips").html(e)
                } else {
                    window.location.reload()
                }
            } else {
                if (f.msg && f.msg != "") {
                    $("#modalRegErrCont").html(f.msg);
                    $("#modalRegErr").show()
                }
                if (f.nameerr && f.nameerr != "") {
                    $("#modal-reg-name").parent().append("<label class='lblerr'>" + f.nameerr + "</label>")
                }
                if (f.pwderr && f.pwderr != "") {
                    $("#modal-reg-pwd").parent().append("<label class='lblerr'>" + f.pwderr + "</label>")
                }
                $("#captcha-a").click()
            }
        }, "json")
    }
}

function resetLoginErr() {
    $(this).siblings().each(function () {
        if ($(this).hasClass("lblerr")) {
            $(this).remove()
        }
    });
    $("#modalLoginErr").hide();
    $("#modalLoginErrCont").html("");
    $("#modalRegErr").hide();
    $("#modalRegErrCont").html("");
    canLoginRegSubmit = true
}
var captchaPass = false;

function checkSameName() {
    var a = $.trim($("#modal-reg-name").val());
    if (a == "") {
        var b = "璇疯緭鍏ラ偖绠�/鎵嬫満鍙�";
        $("#modal-reg-name").parent().append("<label class='lblerr'>" + b + "</label>");
        canLoginRegSubmit = false
    } else {
        $.post("/account/checkSameName", {
            name: a
        }, function (c) {
            if (c && c.r == 1) {
                if (c.hasSame == 1) {
                    var d = "宸插瓨鍦�";
                    $("#modal-reg-name").parent().append("<label class='lblerr'>" + d + "</label>");
                    canLoginRegSubmit = false
                } else {
                    if (c.hasSame == -1) {
                        var d = "閭/鎵嬫満鏍煎紡閿欒";
                        $("#modal-reg-name").parent().append("<label class='lblerr'>" + d + "</label>");
                        canLoginRegSubmit = false
                    } else {
                        if (isPhone(a)) {
                            if (captchaPass) {
                                $("#pcode-area").slideDown(300);
                                sendPCode("pcode-a", "modal-reg-name")
                            }
                        }
                    }
                }
            }
        }, "json")
    }
}

function checkCaptcha() {
    var a = $(this).val();
    if (a.length == 4) {
        $.post("/account/captcha/check", {
            captcha: a
        }, function (b) {
            if (b.r != 1) {
                $("#reg-captcha").append("<label class='lblerr' style='right:120px'>楠岃瘉鐮佸嚭閿�</label>");
                $("#captcha-a").click();
                captchaPass = false
            } else {
                if (b.r == 1) {
                    captchaPass = true;
                    if (isPhone($.trim($("#modal-reg-name").val()))) {
                        $("#pcode-area").slideDown(300);
                        sendPCode("pcode-a", "modal-reg-name")
                    }
                }
            }
        }, "json")
    } else {
        $("#reg-captcha").append("<label class='lblerr' style='right:120px'>楠岃瘉鐮佸嚭閿�</label>");
        captchaPass = false
    }
}
var sendCodeCounter = null;
var initSec = 60;
var isDelay = false;

function sendPCode(b, a) {
    if (!isDelay && captchaPass && isPhone($.trim($("#" + a).val()))) {
        $.post("/account/sendphonecode", {
            phone: $.trim($("#" + a).val())
        }, function (c) {
            if (c && c.r == 1) {
                isDelay = true;
                setSendBtStatus(b)
            }
        }, "json")
    }
}

function setSendBtStatus(a) {
    showMsg("鐭俊楠岃瘉鐮佸凡缁忓彂閫�");
    $("#" + a).html("<span id='" + a + "-cd'>" + initSec + "</span> 绉掑悗鍙互閲嶆柊鍙戦€�").prop("disabled", true);
    if (sendCodeCounter) {
        clearInterval(sendCodeCounter)
    }
    sendCodeCounter = setInterval("updateSendCounter('" + a + "')", 1000)
}

function updateSendCounter(a) {
    var b = parseInt($("#" + a + "-cd").html());
    if (b > 1) {
        $("#" + a + "-cd").html(--b)
    } else {
        isDelay = false;
        $("#" + a).html("鍙戦€侀獙璇佺爜").prop("disabled", false)
    }
}
$(function () {
    $("#modal-reg-name").focus(resetLoginErr);
    $("#modal-reg-pwd").focus(resetLoginErr);
    $("#modal-login-name").focus(resetLoginErr);
    $("#modal-login-pwd").focus(resetLoginErr);
    $("#modal-reg-name").blur(checkSameName);
    $("#modal-reg-captcha").blur(checkCaptcha);
    $("#modal-reg-captcha").focus(function () {
        $("#reg-captcha .lblerr").remove()
    });
    $("#modalLogin").on("hide.bs.modal", function (a) {
        $("#modalLogin .form-group .lblerr").remove();
        $("#modalLogin .form-group input").val("");
        $("#modalLoginErr").hide();
        $("#modalLoginErrCont").html("");
        $("#alertLoginTips").hide();
        $("#alertLoginTipsCont").html("")
    });
    $("#modalReg").on("hide.bs.modal", function (a) {
        $("#modalReg .form-group .lblerr").remove();
        $("#modalReg .form-group input").val("");
        $("#modalRegErr").hide();
        $("#modalRegErrCont").html("");
        $("#pcode-area").hide();
        $("#f-reg-bt").addClass("disabled");
        $("#modal-achk").prop("checked", false)
    });
    $("#modalReg").on("show.bs.modal", function (a) {
        $("#captcha-a").click()
    });
    $("#modal-mail-addr").focus(resetMailErr);
    $("#modal-reg-name").keypress(function (a) {
        if (a.which == "13" || a.which == "9") {
            $("#modal-reg-pwd").focus().select();
            a.stopPropagation()
        }
    });
    $("#modal-reg-pwd").keypress(function (a) {
        if (a.which == "13") {
            reg()
        }
    });
    $("#modal-login-name").keypress(function (a) {
        if (a.which == "13" || a.which == "9") {
            $("#modal-login-pwd").focus().select();
            a.stopPropagation()
        }
    });
    $("#modal-login-pwd").keypress(function (a) {
        if (a.which == "13") {
            login()
        }
    });
    $(document).click(function (b) {
        if ($(window).width() > 990) {
            return
        }
        if (b.target && b.target.id == "nav-login-area") {
            return
        }
        var a = $("#nav-login-area");
        if (!a.is(":hidden")) {
            a.slideUp(300)
        }
    });
    $("#modal-achk").click(function () {
        var a = $(this);
        if (a.prop("checked")) {
            $("#f-reg-bt").removeClass("disabled")
        } else {
            $("#f-reg-bt").addClass("disabled")
        }
    });
    $("#com-star>i").hover(function () {
        var a = $(this);
        var b = a.data("it");
        for (i = 0; i < b; i++) {
            $("#com-star>i").eq(i).removeClass("fa-star-o").addClass("fa-star")
        }
        for (i = b; i < 5; i++) {
            $("#com-star>i").eq(i).removeClass("fa-star").addClass("fa-star-o")
        }
    }, function () {
        var a = $("#com-star-val").val();
        for (i = 0; i < a; i++) {
            $("#com-star>i").eq(i).removeClass("fa-star-o").addClass("fa-star")
        }
        for (i = a; i < 5; i++) {
            $("#com-star>i").eq(i).removeClass("fa-star").addClass("fa-star-o")
        }
    }).click(function () {
        var a = $(this);
        $("#com-star-val").val(a.data("it"))
    });
    $("#mach-star>i").hover(function () {
        var a = $(this);
        var b = a.data("it");
        for (i = 0; i < b; i++) {
            $("#mach-star>i").eq(i).removeClass("fa-star-o").addClass("fa-star")
        }
        for (i = b; i < 5; i++) {
            $("#mach-star>i").eq(i).removeClass("fa-star").addClass("fa-star-o")
        }
    }, function () {
        var a = $("#mach-star-val").val();
        for (i = 0; i < a; i++) {
            $("#mach-star>i").eq(i).removeClass("fa-star-o").addClass("fa-star")
        }
        for (i = a; i < 5; i++) {
            $("#mach-star>i").eq(i).removeClass("fa-star").addClass("fa-star-o")
        }
    }).click(function () {
        var a = $(this);
        $("#mach-star-val").val(a.data("it"))
    })
});

function showLogin() {
    $("#modalLogin").modal("show")
}

function toggleMore() {
    var a = $("#nav-login-area");
    if (a.is(":hidden")) {
        a.slideDown(300)
    } else {
        a.slideUp(300)
    }
}

function getRandomNum(a, c) {
    var d = c - a;
    var b = Math.random();
    return (a + Math.round(b * d))
}
$(function () {
    var a = parseInt(getLocalStorage("cmtidTipsCount"));
    if (isNaN(a) || a <= 0) {
        a = 1
    } else {
        a++
    }
    setLocalStorage("cmtidTipsCount", a);
    if (getCookie("cmtids") != "" && a <= 3) {
        $("#cmtidCountHref").attr("data-content", "鎮ㄦ柊寤虹殑鍚堝悓閮藉湪杩欓噷.").popover().focus()
    }
});

function resetMailErr() {
    $("#modalMailErr").hide();
    $("#modalMailErrCont").html("")
}

function YueSendMail() {
    var a = $("#cmtid").val();
    if (a != "") {
        var b = $("#modal-mail-addr").val();
        var c = $("#modal-mail-msg").val();
        if (b != "") {
            if (b.indexOf("@") < 0) {
                $("#modalMailErrCont").html("鍙戦€佸湴鍧€鏈夎锛岃妫€鏌�");
                $("#modalMailErr").show()
            } else {
                $(".btn-mail").html("鍙戦€佷腑...");
                $.post("/mail/send", {
                    cmtid: a,
                    addrs: b,
                    msg: c
                }, function (d) {
                    if (d && d.r == 1) {
                        showMsg("閭欢鍙戦€佹垚鍔�");
                        $("#modalMail").modal("hide")
                    } else {
                        if (d.msg != "") {
                            $("#modalMailErrCont").html(d.msg);
                            $("#modalMailErr").show()
                        }
                    }
                    $(".btn-mail").html("鍙戦€�<i class='fa fa-share'></i>")
                }, "json")
            }
        } else {
            $("#modalMailErrCont").html("鍙戦€佸湴鍧€涓虹┖");
            $("#modalMailErr").show()
        }
    }
}

function saveToLocalZanList(a, d) {
    if (d == "") {
        return
    }
    var b = getLocalStorage(a);
    var c = b.split("|");
    for (i = 0; i < c.length; i++) {
        if (c[i] == d) {
            return
        }
    }
    c.push(d);
    c = $.grep(c, function (e) {
        return $.trim(e).length > 0
    });
    setLocalStorage(a, c.join("|"))
}

function addZan() {
    var b = $("#pid").val();
    if (!hasLogin) {
        var a = getLocalStorage("zanlist");
        if (a.indexOf(b) >= 0) {
            showMsg("鎮ㄥ凡缁忚禐杩囦簡");
            return
        } else {
            saveToLocalZanList("zanlist", b)
        }
    }
    $.post("/contract/zan", {
        pid: b
    }, function (c) {
        if (c && c.r == 1) {
            var d = parseInt($("#zan-num").html());
            if (isNaN(d)) {
                d = 1
            } else {
                d++
            }
            $("#zan-num").html(d)
        } else {
            if (c.msg != "") {
                showMsg(c.msg)
            }
        }
    }, "json")
}

function addFav() {
    if (hasLogin) {
        $.post("/my/favorites/add", {
            pid: $("#pid").val()
        }, function (b) {
            if (b && b.r == 1) {
                var a = parseInt($("#zan-shou-num").html());
                if (isNaN(a)) {
                    a = 1
                } else {
                    a++
                }
                $("#zan-shou-num").html(a)
            } else {
                if (b.msg != "") {
                    showMsg(b.msg)
                }
            }
        }, "json")
    } else {
        $("#modalLogin").modal("show")
    }
}

function submitComment() {
    var a = $.trim($("#comment-txt").val());
    var b = parseInt($("#com-star-val").val());
    if (isNaN(b) || b < 1) {
        showMsg("璇锋墦鎬讳綋璇勪环鍒嗘暟")
    } else {
        if (a.length == 0) {
            showMsg("璇勮鍐呭涓嶈兘涓虹┖")
        } else {
            $.post("/comment/add", {
                cont: a,
                name: $("#comment-txt-name").val(),
                pid: $("#pid").val(),
                star: b,
                type: $("#ttype").val()
            }, function (c) {
                if (c && c.r == 1) {
                    window.location.reload()
                }
            }, "json")
        }
    }
}

function machComment() {
    var a = $.trim($("#mach-txt").val());
    var b = parseInt($("#mach-star-val").val());
    if (isNaN(b) || b < 1) {
        showMsg("璇锋墦鎬讳綋璇勪环鍒嗘暟")
    } else {
        if (a.length == 0) {
            showMsg("璇勮鍐呭涓嶈兘涓虹┖")
        } else {
            $.post("/comment/addMach", {
                cont: a,
                pid: $("#mach-pid").val(),
                star: b,
                type: $("#mach-ttype").val()
            }, function (c) {
                if (c && c.r == 1) {
                    window.location.reload()
                }
            }, "json")
        }
    }
}

function getCommentP(c, b) {
    if (!isNaN(c) && c > 0) {
        var d = $("#ctablename").val();
        var a = 0;
        if (d == "diy") {
            a = $("#pid").val()
        }
        $.post("/comment/get", {
            page: c,
            psize: b,
            ttype: d,
            pid: a
        }, function (e) {
            $("#comment-area-in").html(e)
        })
    }
}
var msgETA = 3 * 1000;
var msgTimer = null;

function hideMsg() {
    $("#msg_area").fadeOut(300);
    $("#msg_mask").hide()
}

function showMsg(b, a) {
    if (b != "") {
        if ($("#msg_area").length == 0) {
            $("body").append("<div id='msg_area'><span id='msg_cont'></span></div><div id='msg_mask'></div>");
            $("#msg_mask").click(hideMsg)
        }
        $("#msg_cont").html(b);
        $("#msg_mask").show();
        $("#msg_area").fadeIn(100);
        msgTimer = setTimeout(function () {
            hideMsg();
            if (typeof (a) === "function") {
                a()
            }
        }, msgETA)
    }
}
window.onresize = function () {
    if (typeof (chartArr) != "undefined" && chartArr.length > 0) {
        $("#chart-area").width($("#chart-area").parent().width() - 2);
        for (i = 0; i < chartArr.length; i++) {
            chartArr[i].resize()
        }
    }
    var b = $("#nav-login-area");
    var c = $("#top-main-menu");
    var a = $("#top-my-menu");
    if ($(window).width() > 990) {
        if (b.is(":hidden")) {
            b.show().css("display", "inline-block")
        } else {
            b.css("display", "inline-block")
        }
        c.show();
        a.hide()
    } else {
        b.hide();
        c.hide();
        a.show()
    }
};
$(document).scroll(function () {
    if ($(this).scrollTop() > 150) {
        if ($("#rnav-wxc").is(":hidden")) {
            $("#top-a").fadeIn(300)
        }
    } else {
        $("#top-a").fadeOut(300)
    }
});

function toTop() {
    $("body,html").animate({
        scrollTop: 0
    }, 200)
}

function isEmail(c) {
    var a = false;
    var b = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
    if (b.test(c)) {
        a = true
    }
    return a
}

function isPhone(c) {
    var a = false;
    var b = /^1[345789]\d{9}$/;
    if (b.test(c)) {
        a = true
    }
    return a
}

function gblen(c) {
    var a = 0;
    for (var b = 0; b < c.length; b++) {
        if (c.charCodeAt(b) > 127 || c.charCodeAt(b) == 94) {
            a += 2
        } else {
            a++
        }
    }
    return a
}

function GetRandomNum(a, c) {
    var d = c - a;
    var b = Math.random();
    return (a + Math.round(b * d))
}

function getQueryString(a) {
    var b = new RegExp("(^|&)" + a + "=([^&]*)(&|$)", "i");
    var c = window.location.search.substr(1).match(b);
    if (c != null) {
        return unescape(c[2])
    }
    return null
}
// $(function () {
//     $("#agreeModalCont").height($(window).height() * 0.7);
//     $.ajax({
//         type: "GET",
//         url: "http://notify.yuehetong.com/rd?r=" + Math.random(),
//         dataType: "json",
//         xhrFields: {
//             withCredentials: true
//         },
//         success: function (b) {
//             if (b && b.r == 1) {
//                 var a = "<i class='rdtips'></i>";
//                 if (parseInt(b.index) > 0) {
//                     $("#mbt").append(a);
//                     $("#top-nav-bt").append(a)
//                 }
//                 if (parseInt(b.serIndex) > 0) {
//                     $("#mbt2").append(a);
//                     $("#top-nav-bt").append(a)
//                 }
//                 if (parseInt(b.diy) > 0) {
//                     $(".mbt-diy").append(a)
//                 }
//                 if (parseInt(b.gai) > 0) {
//                     $(".mbt-gai").append(a)
//                 }
//                 if (parseInt(b.xie) > 0) {
//                     $(".mbt-xie").append(a)
//                 }
//             }
//         }, error: function () {}
//     })
// });
var agreechk = $("#agreeChk");

function agreeToggle() {
    if (agreechk.hasClass("fa-square-o")) {
        agreechk.removeClass("fa-square-o").addClass("fa-check-square");
        $("#bt-create").prop("disabled", false);
        $("#a-create").removeClass("disabled")
    } else {
        agreechk.removeClass("fa-check-square").addClass("fa-square-o");
        $("#bt-create").prop("disabled", true);
        $("#a-create").addClass("disabled")
    }
}

function loadUserAgree() {
    $("#agreeModal").modal("show")
}

function agreeModalAccept() {
    agreechk.removeClass("fa-square-o").addClass("fa-check-square");
    $("#bt-create").prop("disabled", false);
    $("#agreeModal").modal("hide");
    var a = $("#contract-maker");
    if (a.length > 0) {
        saveAllTable();
        a.submit()
    } else {
        makeFOrder()
    }
}

function agreeModalRefuse() {
    agreechk.removeClass("fa-check-square").addClass("fa-square-o");
    $("#bt-create").prop("disabled", true);
    $("#agreeModal").modal("hide")
}

function makeFOrder() {
    if ($("#agreeChk").hasClass("fa-square-o")) {
        $("#agreeModal").modal("show");
        return
    }
    if ($("#bt-create").prop("disabled")) {
        return
    }
    $.post("/form/save", {
        cid: $("#contract_id").val(),
        ctitle: $("#contract_title").val()
    }, function (a) {
        if (a && a.r == 1) {
            if (a.rdi) {
                window.location.href = a.rdi
            }
        } else {
            if (a.msg != "") {
                showMsg("淇濆瓨澶辫触锛岃妫€鏌ュ悗閲嶈瘯")
            }
        }
    }, "json")
}

function jumpToResult() {
    window.location.href = "/diy/view/" + cmtid
}

function submitDIY() {
    if (hasLogin) {
        if ($("#agreeChk").hasClass("fa-square-o")) {
            $("#agreeModal").modal("show")
        } else {
            saveAllTable();
            $("#contract-maker").submit()
        }
    } else {
        $("#alertLoginTipsCont").html("鎮﹀悎鍚屾俯棣ㄦ彁绀猴細璇风櫥褰曞悗浣跨敤璇ュ姛鑳�");
        $("#alertLoginTips").show();
        canLoginCallBack = true;
        $("#modalLogin").modal("show")
    }
}

function saveAllTable() {
    var a = $("#cmtid").val();
    $(".tablediv").each(function () {
        var b = $(this);
        var d = b.data("tableid");
        var c = $("#table_" + d).handsontable("getInstance");
        var g = JSON.stringify(c.getData());
        var f = "";
        if (c.mergeCells.mergedCellInfoCollection) {
            mergeColl = c.mergeCells.mergedCellInfoCollection;
            f = JSON.stringify(mergeColl)
        }
        var e = b.find("table").html();
        $.ajax({
            type: "post",
            url: "/diy/make/savetable",
            data: {
                tdata: g,
                mergeConf: f,
                tableid: d,
                cmtid: a,
                tableraw: e
            },
            dataType: "json",
            async: false,
            success: null
        })
    })
}

function delorder(a) {
    if (a != "") {
        if (confirm("鎮ㄧ‘瀹氬垹闄よ璁㈠崟涔堬紵")) {
            $.post("/my/order/del", {
                oid: a
            }, function (b) {
                if (b && b.r == 1) {
                    window.location.reload()
                }
            }, "json")
        }
    }
}
var uiarr = new Array();
var curUi = 0;
var uiShowInit = 8000;
var uiShowDelay = 20000;
var uiHideDelay = 4500;
var aD = 300;

function showUITips() {
    if (uiarr[curUi]) {
        showUITipsLayer(uiarr[curUi]);
        curUi++;
        setTimeout("showUITips()", uiShowDelay)
    }
}
var uitips = null;

function showUITipsLayer(a) {
    if (!uitips) {
        uitips = $("#uitips")
    }
    $("#uitipscont").html(a);
    uitips.animate({
        right: "0px"
    }, aD);
    setTimeout("hideUITips()", uiHideDelay)
}

function hideUITips() {
    uitips.stop().animate({
        right: "-300px"
    }, aD)
}
$(function () {
    var a = '<i class="fa fa-weixin"></i>';
    $("#rnav-wx").hover(function () {
        var d = $(this).data("cont");
        $(this).html(d).addClass("rnav-wx2");
        $("#rnav-wxc").fadeIn(300)
    }, function () {
        $(this).html(a).removeClass("rnav-wx2");
        $("#rnav-wxc").fadeOut(300)
    });
    var b = '<i class="fa fa-phone"></i>';
    $("#rnav-tel").hover(function () {
        var d = $(this).data("cont");
        $(this).html(d).addClass("rnav-wx2");
        $("#rnav-telc").fadeIn(300)
    }, function () {
        $(this).html(b).removeClass("rnav-wx2");
        $("#rnav-telc").fadeOut(300)
    })
});