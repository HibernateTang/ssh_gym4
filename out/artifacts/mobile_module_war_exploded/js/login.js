
$(document).ready(function () {
    var loadingIndex;
    $.ajaxSetup({
        beforeSend: function () {
            loadingIndex = layer.load(2, {
                shade: [0.4,'#fff'] //0.1透明度的白色背景
            });
        },
        complete: function () {
            layer.close(loadingIndex);
        },
        error: function () {
            layer.close(loadingIndex);
        }
    });

    var mySwiper = new Swiper('.swiper-container', {})
    $(function () {
        FastClick.attach(document.body);
    });

    mySwiper.lockSwipes();
    $("#goSignIn").click(function () {
        mySwiper.unlockSwipes();
        mySwiper.slideNext(fadeInClass());
        mySwiper.lockSwipes();
    })

    $("#goSignUp").click(function () {
        mySwiper.unlockSwipes();
        mySwiper.slidePrev(fadeInClass());
        mySwiper.lockSwipes();
    })

    function fadeInClass() {
        if ($("#loginConnect p").hasClass("animated bounceInLeft")) {
            $("#loginConnect p").removeClass("animated bounceInLeft");
            $("#regConnect p").addClass("animated bounceInLeft")
        } else {
            $("#regConnect p").removeClass("animated bounceInLeft")
            $("#loginConnect p").addClass("animated bounceInLeft");
        }
        $("input").val("");
    }

    //登陆
    $("#signIn").click(function () {
        if (checkLogin()) {
            var tel = $("#login_tel").val();
            var pass = $("#login_pass").val();
            login_ajax(tel, pass);
        }
    })
    //注册

    $("#signUp").click(function () {
        if (checkReg()) {
            var reg_tel = $("#reg_tel").val();
            var reg_valnum = $("#reg_valnum").val();
            var reg_pass = $("#reg_pass").val();
            var reg_email = $("#reg_email").val();
            regsister_ajax(reg_tel, reg_valnum, reg_pass, reg_email);
        }

    })

    $("#test").click(function () {
        var reg_tel = $("#reg_tel").val("18566666666");
        var reg_valnum = $("#reg_valnum").val(1234);
        var reg_pass = $("#reg_pass").val("zed123");
        var reg_email = $("#reg_email").val("tangzi_123@163.com");
    })

    $("#btn-valnum").click(function () {
        var tel = $("#reg_tel").val();
        var isRegNum = checkInput(/^1[34578]\d{9}$/, $("#reg_tel"), "手机", "手机号格式不正确");
        if (isRegNum ) {
            var that = this;
            $.ajax({
                type: "POST",
                url: "/login/validateNum",
                data: {"tel": tel},
                contentType: "application/x-www-form-urlencoded",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.success == true) {
                        time($("#btn-valnum"));
                    } else {
                        alert("发送失败，请稍后再试.");
                    }
                }
            });
        }
    });

    var waitTime = 60;

    function time(o) {
        if (waitTime == 0) {
            o.removeAttr("disabled");
            o.text("发送验证码");
            waitTime = 60;
        } else {
            o.attr("disabled", true);//倒计时过程中禁止点击按钮
            o.text(waitTime + "s重新获取");
            waitTime--;
            setTimeout(function () {
                    time(o);//循环调用
                },
                1000)
        }
    }


    /*
     ajax方法
     */
    function login_ajax(telephone, password) {
        this.username = telephone;
//            this.password = hex_md5(password);
        this.password = $.md5(password);
        $.ajax({
            type: "POST",
            url: "/login/tologin",
            data: {"username": this.username, "password": this.password},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data.success == true && data.message == "登录成功") {
                    layer.msg('登录成功')

                    window.location.href = "/index";
//                            window.location.href = "../jsp/infojsp/info.jsp?userName="+data.value.username+
//                                    "&userId="+data.value.id;
                } else if (data.success == false && data.message == "密码错误") {
                    layer.msg('密码错误');
                } else if (data.success == false && data.message == "该用户不存在!") {
                    layer.msg('该用户不存在');
                }
            }
        });
    }

    function regsister_ajax(username, valnum, password, email) {
        this.valnum = valnum;
        this.username = username;
        this.password = $.md5(password);
        this.email = email;
        $.ajax({
            type: "POST",
            url: "/login/register",
            data: {"username": this.username, "valnum": this.valnum, "password": this.password, "email": this.email},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data.success == true && data.message == "注册成功") {
                    layer.msg('注册成功!正在跳转...');
                    mySwiper.unlockSwipes();
                    mySwiper.slidePrev(fadeInClass());
                    mySwiper.lockSwipes();
                    $("#login_tel").val(username);
                } else if (data.success == false) {
                    layer.msg(data.message);
                }

            }
        });
    }

    function checkLogin() {
        //手机
        var telChecked = checkInput(/^1[34578]\d{9}$/, $("#login_tel"), "手机", "手机号格式不正确");
        var passChecked = checkInput(/^(\w){6,20}$/, $("#login_pass"), "密码", "6-20个字母、数字、下划线");
        return telChecked && passChecked;
    }

    function checkReg() {
        //手机
        var passEquals = ($("#reg_pass").val() == $("#reg_repass").val());
        if (!passEquals) {
            $("#reg_repass").val("");
            $("#reg_repass").addClass("input-error");
            $("#reg_repass").attr("placeholder", "两次密码不一致");
            return false;
        } else {
            $("#reg_repass").removeClass("input-error");
            $("#reg_repass").attr("placeholder", "再次输入密码");
        }
        var telChecked = checkInput(/^1[34578]\d{9}$/, $("#reg_tel"), "输入手机号码", "手机号格式不正确");
        var passChecked = checkInput(/^(\w){6,20}$/, $("#reg_pass"), "输入密码", "6-20个字母、数字、下划线");
        var valnamChecked = checkInput(/^\d{4}$/, $("#reg_valnum"), "输入验证码", "4位数字");
        var mailChecked = checkInput(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/, $("#reg_email"), "输入邮箱地址", "邮箱格式不正确");
        return telChecked && valnamChecked && passChecked && mailChecked;
    }

    function checkInput(regx, ele, ph, phErr) {
        if (!regx.test($.trim(ele.val()))) {
            ele.val("");
            ele.addClass("input-error");
            ele.attr("placeholder", phErr);
            return false;
        } else {
            ele.removeClass("input-error");
            ele.attr("placeholder", ph);
            return true;
        }
    }
});