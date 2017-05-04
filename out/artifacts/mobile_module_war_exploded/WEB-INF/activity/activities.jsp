<%--
  Created by IntelliJ IDEA.
  User: hibernate
  Date: 2017/5/3
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <style>
        .gym-activity-title {
            font-size: .85rem;
        }

        .gym-activity-item {
            display: flex;
            margin-top: 1em;
            justify-content: space-between;
        }

        .gym-activity-item p {
            font-size: .625rem;
            margin: 0;
        }

        .avitivity-text {
        }

        .bar .button.pull-right {
            margin-left: 1rem;
            font-size: 1.5rem;
        }

        .item-inner .item-input input {
            padding-left: 0;
        }

        .search-fa {
            position: absolute;
            font-size: 0.9rem;
            color: #b4b4b4;
            top: 50%;
            left: 0.3rem;
            -webkit-transform: translate3D(0, -50%, 0);
            transform: translate3D(0, -50%, 0);
            z-index: 20;
            padding: .5rem .1rem;
            line-height: 1.2rem;
        }

        .fixed-selected {
            position: fixed;
            bottom: 20px;
            right: 20px;
            color: #337ab7;
            z-index: 999;
            box-shadow: 0 4px 12px 0 rgba(7, 17, 27, .1);
        }

        .panel-selected {
            background-color: #e2e2e2;
        }

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
            font-family: "幼圆", "Micsoft YaHei";
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
            margin-top: 4px \9;
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
    </style>
</head>

<body>
<div class="page-group">

    <div class="page page-current" id="home">
        <header class="bar bar-nav">
            <a class="button button-link pull-left "><i class="fa fa-location-arrow" aria-hidden="true"></i>
                <small>地点：<label class="mycity"></label></small>
            </a>
            <a class="button button-link  fa fa-user pull-right " href="#myinfo"></a>
            <a class="button button-link  fa fa-search  pull-right " href="#search"></a>
            <a class="button button-link  fa fa-home  pull-right active" href="#home"></a>
        </header>
        <div class="content  pull-to-refresh-content infinite-scroll infinite-scroll-bottom">
            <div class="pull-to-refresh-layer">
                <div class="preloader"></div>
                <div class="pull-to-refresh-arrow"></div>
            </div>

            <div class="card-container ">
                <!--<div class="card">
                    <div class="card-header no-border no-padding">
                        <img class="card-cover" src="images/inform.jpg" /></div>
                    <div class="card-content">
                        <div class="card-content-inner">
                            <div class="gym-activity-title">
                                奇怪的植树节活动
                            </div>
                            <div class="gym-activity-item">
                                <div class="avitivity-text">
                                    <p>日期: 2017-12-12 ~ 2017-12-22</p>
                                    <p>运动: 轮滑</p>
                                </div>
                                <i class="fa fa-bicycle fa-2x text-primary" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
            <!-- 加载提示符 -->
            <div class="infinite-scroll-preloader">
                <div class="preloader"></div>
            </div>
        </div>
        <div class="fixed-selected  open-panel">
            <i class="fa fa-university fa-2x" aria-hidden="true"></i>
        </div>
    </div>

    <div class="page" id="activity">
        <header class="bar bar-nav">
            <a class="button button-link pull-left "><i class="fa fa-location-arrow" aria-hidden="true"></i>
                <small>地点：<label class="mycity"></label></small>
            </a>
            <a class="button button-link  fa fa-user pull-right active" href="#myinfo"></a>
            <a class="button button-link  fa fa-search  pull-right " href="#search"></a>
            <a class="button button-link  fa fa-home  pull-right " href="#home"></a>
        </header>
        <div class="content">
            <div class="card">
                <div class="card-content gym-activity">
                    <a href="#home"><i class="fa fa-angle-double-left fa-3x"></i></a>
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
                    <div class="gym-checkbox"><label><input id="agree" type="checkbox" checked>我已同意小小运动馆相关条约和规定</label>
                    </div>

                    <a class="button button-fill popup-about" id="pickerActivity" href="javascript:;">选择场次</a>
                </div>
            </div>

        </div>
    </div>

    <div class="page" id="search">
        <header class="bar bar-nav">
            <a class="button button-link pull-left "><i class="fa fa-location-arrow" aria-hidden="true"></i>
                <small>地点：<label class="mycity"></label></small>
            </a>
            <a class="button button-link  fa fa-user pull-right " href="#myinfo"></a>
            <a class="button button-link  fa fa-search  pull-right active" href="#search"></a>
            <a class="button button-link  fa fa-home  pull-right " href="#home"></a>
        </header>
        <div class="bar bar-header-secondary">
            <div class="searchbar">
                <a class="searchbar-cancel">取消</a>
                <div class="search-input">
                    <label class="search-fa fa fa-search" aria-hidden="true" for="search"></label>
                    <input type="search" id='keyword' placeholder='输入关键字...'/>
                </div>
            </div>
        </div>
    </div>

    <div class="page" id="myinfo">
        <header class="bar bar-nav">
            <a class="button button-link pull-left "><i class="fa fa-location-arrow" aria-hidden="true"></i>
                <small>地点：<label class="mycity"></label></small>
            </a>
            <a class="button button-link  fa fa-user pull-right active" href="#myinfo"></a>
            <a class="button button-link  fa fa-search  pull-right " href="#search"></a>
            <a class="button button-link  fa fa-home  pull-right " href="#home"></a>
        </header>
        <div class="content">
            <div class="content-block-title">个人信息</div>
            <div class="list-block">
                <ul>
                    <li class="item-content item-link" id="info">
                        <div class="item-inner">
                            <div class="item-title">未知</div>
                            <div class="item-after">修改信息</div>
                        </div>
                    </li>
                    <li class="item-content item-link">
                        <div class="item-inner">
                            <div class="item-input"><input type="text" placeholder="" value="上海 浦东新区" id="city-picker"
                                                           readonly=""></div>
                            <div class="item-after" id="changeCity">修改城市</div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="content-block-title">已报名的活动，共<label class="text-danger">1</label>个活动</div>
            <div class="list-block">
                <ul>
                    <a class="item-content item-link" href="#activity">
                        <div class="item-inner">
                            <div class="item-title">植树节</div>
                            <div class="item-after">查看</div>
                        </div>
                    </a>
                </ul>
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
                <div class="col-50"><a href="javascript:;"
                                       class="button button-big button-fill button-danger close-popup">取消</a></div>
                <div class="col-50"><a href="javascript:;" class="button button-big button-fill button-success">提交</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel panel-right panel-reveal panel-selected">
    <div class="content-block">
        <p>活动筛选</p>
        <p>
            <small>请选择筛选的活动门店</small>
        </p>
        <!-- Click on link with "close-panel" class will close panel -->
        <div class="list-block">
            <ul>
                <li><a href="javascript:;" class="item-link list-button">确定</a></li>
                <li><a href="javascript:;" class="item-link list-button close-panel color-gray">取消</a></li>
            </ul>
        </div>

    </div>

</div>
<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/sm-city-picker.min.js' charset='utf-8'></script>
<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script>
    var city = remote_ip_info['city'];
    $(".mycity").text(city);

    $("#home").addClass("active");
    infiniteScroll();

    function infiniteScroll() {
        // 加载flag
        var loading = false;
        // 最多可加载的条目
        var maxItems = 100;
        // 每次加载添加多少条目
        var itemsPerLoad = 10;

        function addItems(number, lastIndex) {
            // 生成新条目的HTML
            var html = '';
            for (var i = lastIndex + 1; i <= lastIndex + number; i++) {
                html += '<div class="card animated pulse" Onclick="toActivity(2)">' +
                        '<div class="card-header no-border no-padding">' +
                        '<img class="card-cover" src="/images/member/inform.jpg"/>' +
                        '</div>' +
                        '<div class="card-content">' +
                        '<div class="card-content-inner">' +
                        '<div class="gym-activity-title">奇怪的植树节活动' + i +
                        '</div>' +
                        '<div class="gym-activity-item">' +
                        '<div class="avitivity-text">' +
                        '<p>日期: 2017-12-12 ~ 2017-12-22</p>' +
                        '<p>运动: 轮滑</p>' +
                        '</div>' +
                        '<i class="fa fa-bicycle fa-2x color-primary" aria-hidden="true"></i>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
            }
            // 添加新条目
            $('.infinite-scroll-bottom .card-container').append(html);

        }

        //预先加载20条
        addItems(itemsPerLoad, 0);
        // 上次加载的序号
        var lastIndex = 10;
        // 注册'infinite'事件处理函数
        $(document).on('infinite', '.infinite-scroll-bottom', function () {
            // 如果正在加载，则退出
            if (loading) return;
            // 设置flag
            loading = true;
            // 模拟1s的加载过程
            setTimeout(function () {
                // 重置加载flag
                loading = false;

                if (lastIndex >= maxItems) {
                    // 加载完毕，则注销无限加载事件，以防不必要的加载
                    $.detachInfiniteScroll($('.infinite-scroll'));
                    // 删除加载提示符
                    $('.infinite-scroll-preloader').remove();
                    return;
                }

                // 添加新条目
                addItems(itemsPerLoad, lastIndex);
                // 更新最后加载的序号
                lastIndex = $('.list-container li').length;
                //容器发生改变,如果是js滚动，需要刷新滚动
                $.refreshScroller();
            }, 1000);
        });
    }


    $(document).on('refresh', '.pull-to-refresh-content', function (e) {
        // 模拟2s的加载过程
        setTimeout(function () {
            // var cardNumber = $(e.target).find('.card').length + 1;
            // var cardHTML = '<div class="card">' +
            //     '<div class="card-header">card' + cardNumber + '</div>' +
            //     '<div class="card-content">' +
            //     '<div class="card-content-inner">' +
            //     '这里是第' + cardNumber + '个card，下拉刷新会出现第' + (cardNumber + 1) + '个card。' +
            //     '</div>' +
            //     '</div>' +
            //     '</div>';

            // $(e.target).find('.card-container').prepend(cardHTML);


            // 加载完毕需要重置
            $.pullToRefreshDone('.pull-to-refresh-content');
            location.reload();
        }, 2000);

    });

    function toActivity(idActivity) {
        location.href="#activity";
        location.reload();
    }

    /*myinfo*/
    $("#info").on('click', function () {
        $.popup('.popup-about');
    });

    $("#city-picker").cityPicker({});
    $("#changeCity").on('click', function () {
        $("#city-picker").picker("open");
    })

    /*activity*/
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
        if (!$(this).hasClass("disabled")) {
            $.popup('.popup-about');
        } else {
            $.alert("您必须同意小小运动馆相关条约和规定！")
        }

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