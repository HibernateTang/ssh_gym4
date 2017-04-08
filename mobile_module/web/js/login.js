$(document).ready(function () {
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

    $("#signIn").click(function () {
        if (checkLogin()) {
            var tel = $("#login_tel").val();
            var pass = $("#login_pass").val();
            login_ajax(tel, pass);
        }
    })

    $("#signUp").click(function () {
        if ($("#reg_valnum").val() == $("#code").val()){
            alert("验证成功！");
        }else {
            alert("验证失败");
        }
    })



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

    

    $("#btn-valnum").click(function () {
        var tel = $("#reg_tel").val();
        var isRegNum = checkInput(/^1[34578]\d{9}$/, $("#reg_tel"), "手机", "手机号格式不正确");
//            if (isRegNum == true) {
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
                    $("#code").val(data.message);
                    time($("#btn-valnum"));
                } else {
                    alert("发送失败，请稍后再试.");
                }
            }
        });
//            }
    });

    var waitTime=60;
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
        this.password = password;
        $.ajax({
            type: "POST",
            url: "/login/tologin",
            data: {"username": this.username, "password": this.password},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data.success == true && data.message == "登录成功") {
                    alert("登录成功!");

                    window.location.href = "/index";
//                            window.location.href = "../jsp/infojsp/info.jsp?userName="+data.value.username+
//                                    "&userId="+data.value.id;
                } else if (data.success == false && data.message == "密码错误") {
                    alert("密码错误!");
                } else if (data.success == false && data.message == "该用户不存在!") {
                    alert("该用户不存在!");
                }
            }
        });
    }
    
    function regsister_ajax(username, password, email) {
        this.username = username;
        this.password = password;
        this.email = email;
        $.ajax({
            type: "POST",
            url: "/login/register",
            data: {"username": this.username, "password": this.password, "email": this.email},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data.success == true && data.message == "注册成功") {
                    alert("注册成功!");
                    mySwiper.unlockSwipes();
                    mySwiper.slidePrev(fadeInClass());
                    mySwiper.lockSwipes();
                } else if (data.success == false && data.message == "该用户名已存在...") {
                    alert("该用户名已被注册...");
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
        var telChecked = checkInput(/^1[34578]\d{9}$/, $("#reg_tel"), "手机", "手机号格式不正确");
        var passChecked = checkInput(/^(\w){6,20}$/, $("#reg_pass"), "密码", "6-20个字母、数字、下划线");
        var mailChecked = checkInput(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/, $("#reg_mail"), "输入邮箱地址", "邮箱格式不正确");
        return telChecked && passChecked && mailChecked;
    }

});