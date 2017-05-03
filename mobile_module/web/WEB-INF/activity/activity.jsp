<%--
  Created by IntelliJ IDEA.
  User: hibernate
  Date: 2017/5/3
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动详情</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .gym-card-title {
            background: url('/images/member/card-bg.png');
            color: #eeeeee;
        }

        .gym-activity {
            background: url('/images/member/inform.jpg') no-repeat;
            background-size: 100% 100%;
            min-height: 7.5rem;
            /*padding-top: 3.5em;*/
        }

        .gym-activity a {
            color: #d2d2d2;
        }

        .gym-activity a:active {
            color: #fbfbfb;
        }

        .gym-title {
            font-family: "幼圆","Micsoft YaHei";
            position: absolute;
            font-size: 2.2rem;
            color: #fff;
            text-align: center;
            width: 100%;
        }

        .icon-item {
            color: #4a74b5;
            margin-top: .3rem;
            text-align: center;
        }

        .icon-item p {
            margin: 0.3rem 0;
        }

        .rule-title {
            font-family: "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei";
            font-size: 13px;
            padding-bottom: .2rem;
            margin: .4rem .5rem;
            border-bottom: 1px solid #eee;
        }

        .activity-detail {
            font-family: apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
            font-size: 12px;
            margin: 0 0 5px 0;
            padding: 1rem 2rem 1rem 1rem;
            -moz-border-radius: 1px 1px 1px 1px;
            -webkit-border-radius: 1px 1px 1px 1px;
            border-radius: 1px 1px 1px 1px;
        }

        .gym-apply {
            padding-top: .5rem;
            padding-left: 1rem;
            padding-bottom: .3rem;
            letter-spacing: 2px;
        }

        .gym-apply .gym-main {
            font-weight: 600;
            font-size: 17px;
        }

        .gym-apply .gym-text {
            font-size: 14px;
            color: #393D49;
        }

        .gym-checkbox {
            margin-left: 20px;
            font-size: 12px;
        }

        .gym-checkbox input[type="checkbox"] {
            position: absolute;
            margin-top: 4px\9;
            margin-left: -20px;
        }

        .rule-text {
            margin-left: .25rem;
            font-size: 12px;
            color: #2e6da4;
        }

        .item-media {
            width: 1.45rem;
            height: 1.45rem;
            color: #4a74b5;
        }

        .apply-title {
            color: #4a74b5;
        }

        .bar .button.pull-right {
            margin-left: 1rem;
            font-size: 1.5rem;
        }
    </style>
</head>

<body>
<div class="page-group">
    <div class="page">
        <header class="bar bar-nav">
            <a class="button button-link pull-left "><i class="fa fa-location-arrow" aria-hidden="true"></i> <small>地点：<label id="mycity"></label></small></a>
            <a class="button button-link  fa fa-user pull-right " id="myinfo"  href="/activity/myinfo"></a>
            <a class="button button-link  fa fa-search  pull-right " id="search" href="/activity/search"></a>
            <a class="button button-link  fa fa-home  pull-right " id="home" href="/activity"></a>
        </header>
        <div class="content">
            <div class="card">
                <div class="card-content gym-activity">
                    <a href="activities.html"><i class="fa fa-angle-double-left fa-3x"></i></a>
                    <div class="gym-title">植树节活动</div>

                </div>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="row">
                        <div class="col-25">
                            <div class="icon-item" id="icon-like">
                                <i class="fa fa-heart-o fa-2x"></i>
                                <p>喜欢</p>
                            </div>
                        </div>
                        <div class="col-25">
                            <div class="icon-item" id="icon-apply">
                                <i class="fa fa-file-text fa-2x"></i>
                                <p>参加</p>
                            </div>
                        </div>
                        <div class="col-25">
                            <div class="icon-item" id="icon-rule">
                                <i class="fa fa-reorder fa-2x"></i>
                                <p>细则</p>
                            </div>
                        </div>
                        <div class="col-25">
                            <div class="icon-item" id="icon-review">
                                <i class="fa fa-photo fa-2x"></i>
                                <p>回顾</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card" id="rule">
                <div class="card-header gym-card-title">
                    <i></i>
                    <div class="">活动细则</div>
                    <i></i>
                </div>
                <div class="card-content">
                    <div class="row no-gutter">
                        <div class="col-50">
                            <div class="rule-title">活动时间：<label class="rule-text">2017.01.12</label></div>
                        </div>
                        <div class="col-50">
                            <div class="rule-title">活动类别：<label class="rule-text">亲子</label></div>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-50">
                            <div class="rule-title">收费类型：<label class="rule-text">现金</label></div>
                        </div>
                        <div class="col-50">
                            <div class="rule-title">针对人群：<label class="rule-text">3-6岁</label></div>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-50">
                            <div class="rule-title">运动强度：<label class="rule-text">一般</label></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card" id="detail">
                <div class="card-header gym-card-title">
                    <i></i>
                    <div>活动详情</div>
                    <i></i>
                </div>
                <div class="card-content">
                    <div class="activity-detail">
                        在与同类组件的比较中，layer总是能轻易获胜。她尽可能地在以更少的代码展现更强健的功能，且格外注重性能的提升、易用和实用性，正因如此，越来越多的开发者将媚眼投上了layer（已被4280634人次关注）。
                    </div>
                </div>
            </div>

            <div class="card" id="apply">
                <div class="card-content">
                    <div class="gym-apply">
                        <div class="gym-main"><i class="fa fa-user"></i>报名人：刘翔</div>
                        <div class="gym-text">点击修改或者增加报名信息</div>
                    </div>

                </div>
                <div class="card-footer">
                    <div class="gym-checkbox"><label><input id="agree" type="checkbox" checked>我已同意小小运动馆相关条约和规定</label></div>

                    <a class="button button-fill popup-about" id="pickerActivity" href="#">选择场次</a>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="popup popup-about">
    <div class="content">
        <h3 class="apply-title text-center">报名信息</h3>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="fa fa-user fa-2x"></i></div>
                        <div class="item-inner">
                            <div class="item-input">
                                <input type="text" placeholder="姓名">
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="fa fa-phone fa-2x"></i></div>
                        <div class="item-inner">
                            <div class="item-input">
                                <input type="email" placeholder="手机">
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="fa fa-commenting-o fa-2x"></i></div>
                        <div class="item-inner">
                            <div class="item-input">
                                <input type="email" placeholder="验证码">
                            </div>
                            <div class="item-after">
                                <a class="button button-fill button-success">获取验证码</a>
                            </div>
                        </div>

                    </div>
                </li>
            </ul>
        </div>
        <div class="content-block">
            <div class="row">
                <div class="col-50"><a href="#" class="button button-big button-fill button-danger close-popup">取消</a></div>
                <div class="col-50"><a href="#" class="button button-big button-fill button-success">提交</a></div>
            </div>
        </div>
    </div>
</div>



<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/fx.js' charset='utf-8'></script>
<!--禁用路由 -->
<script>$.config = {router: false}</script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>

<script>

    $("div[id^='icon-']").on('click', function () {
        idNative = $(this).attr("id");
        idOffset = idNative.split("-")[1];
        if (idOffset != 'review' && idOffset != 'like') {
            $('.content').scrollTop($("#" + idOffset).offset().top)
        }
    });

    $("#icon-like").on('click', function () {
        toggleLike();
    });

    $("#agree").on('change', function () {
        var is_checked = $(this).prop("checked");
        $("#pickerActivity").toggleClass("disabled");
    })

    $(".gym-apply").on('click', function () {
        var buttons1 = [
            {
                text: '请选择',
                label: true
            },
            {
                text: '增加',
                bold: true,
                color: 'danger',
                onClick: function () {
                    $.alert("你选择了“增加报名“");
                }
            },
            {
                text: '修改',
                onClick: function () {
                    $.alert("你选择了“修改信息“");
                }
            }
        ];
        var buttons2 = [
            {
                text: '取消',
                bg: 'danger'
            }
        ];
        var groups = [buttons1, buttons2];
        $.actions(groups);
    });

    $("#pickerActivity").on('click', function () {
        $.popup('.popup-about');
    });

    function ajax_getlike(avtivity_name) {
        var sql = "select is_like from activity where userid = " + 3 + "avtivity_name = " + avtivity_name;
        return true;
    }

    function toggleLike() {
        var iconLike = $("#icon-like i");
        if (iconLike.hasClass("fa fa-heart fa-2x")) {
            $("#icon-like i").removeClass("fa fa-heart fa-2x");
            $("#icon-like i").addClass("fa fa-heart-o fa-2x");
            $.toast("已取消", 500);
        } else {
            $("#icon-like i").removeClass("fa fa-heart-o fa-2x");
            $("#icon-like i").addClass("fa fa-heart fa-2x");
            $.toast("已喜欢", 500);
        }
    }

    $.init()
</script>
</body>

</html>