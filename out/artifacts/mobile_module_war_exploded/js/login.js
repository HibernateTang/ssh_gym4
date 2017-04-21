var loadingIndex;
$.ajaxSetup({
        beforeSend: function () {
           loadingIndex = layer.open({
                type:2,
            });
        },
        complete: function () {
            layer.close(loadingIndex)
        },
        error: function () {
            layer.close(loadingIndex)
        }
    });

    var mySwiper = new Swiper('.swiper-container', {})
    // $(function () {
    //     FastClick.attach(document.body);
    // });

    mySwiper.lockSwipes();
    $("#goSignIn").click(function () {
        mySwiper.unlockSwipes();
        mySwiper.slideNext(fadeInClass());
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
                    // console.log(data);
                    if (data.success == true) {
                        time($("#btn-valnum"));
                    } else {
                        layer.open({
                            content: '发送失败，请稍后再试'
                            ,skin: 'msg'
                            ,time: 2 //2秒后自动关闭
                        });
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

    $("#reg_tel").on('change',function () {
        var reg_tel = $("#reg_tel").val();
        if(/^1[34578]\d{9}$/.test($.trim(reg_tel))){
            exist_ajax(reg_tel);
        }

    })


    /*
     ajax方法
     */
    function login_ajax(telephone, password) {
        this.username = telephone;
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


                    window.location.href = "/index";
                } else if (data.success == false && data.message == "密码错误") {
                    layer.open({
                        content: '密码错误'
                        ,skin: 'msg'
                        ,time: 2 //2秒后自动关闭
                    });
                } else if (data.success == false && data.message == "该用户不存在!") {
                    layer.open({
                        content: '该用户不存在'
                        ,skin: 'msg'
                        ,time: 2 //2秒后自动关闭
                    });
                }
            },
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
                    layer.open({
                        content: '注册成功'
                        ,skin: 'msg'
                        ,time: 2 //2秒后自动关闭
                    });
                    mySwiper.unlockSwipes();
                    mySwiper.slidePrev(fadeInClass());
                    mySwiper.lockSwipes();
                    $("#login_tel").val(username);
                } else if (data.success == false) {
                    layer.open({
                        content: data.message
                        ,skin: 'msg'
                        ,time: 2 //2秒后自动关闭
                    });
                }

            }
        });
    }


    function exist_ajax(telephone){
        $.ajax({
            type:"POST",
            url: "/login/exist",
            data: {"telephone": telephone},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data.success != true) {
                    layer.open({
                        content: '您不是我们的会员，不能注册'
                        ,btn: ['我是', '取消']
                        ,yes: function(index){
                            layer.open({
                                type: 1
                                ,content: $("#feedback").html()
                                ,anim: 'up'
                                 });
                            layer.close(index);
                            feedback_ajax($("#zxName").val(),$("#details").val(),$("#contactTel").val())
                            location.reload();
                        }
                    });
                }
            }
        });
    }

    function feedback_ajax(zxName,details,contactTel){
        $.ajax({
            type:POST,
            url: "/login/feedback",
            data: {"Franchisee": Franchisee,"details":details,"contactTel":contactTel},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            success: function (data) {
                layer.open({
                    content: '我们已收到您的反馈'
                    ,skin: 'msg'
                    ,time: 2 //2秒后自动关闭
                });
                location.reload();
            }
        })
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
        var valnumChecked = checkInput(/^\d{4}$/, $("#reg_valnum"), "输入验证码", "4位数字");
        var mailChecked = checkInput(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/, $("#reg_email"), "输入邮箱地址", "邮箱格式不正确");
        return telChecked && valnumChecked && passChecked && mailChecked;
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

   