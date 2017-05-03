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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动</title>
    <link rel="stylesheet" href="/css/sm.min.css">
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

        .avitivity-text {}

        .text-primary {
            color: #337ab7;
        }

        .button-nav {
            padding: .175rem .3rem;
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
            <a class="button button-link  fa fa-user pull-right " id="myinfo" external  href="/activity/myinfo"></a>
            <a class="button button-link  fa fa-search  pull-right " id="search" href="/activity/search"></a>
            <a class="button button-link  fa fa-home  pull-right " id="home" href="/activity"></a>
        </header>
        <div class="content  pull-to-refresh-content infinite-scroll infinite-scroll-bottom">
            <div class="pull-to-refresh-layer">
                <div class="preloader"></div>
                <div class="pull-to-refresh-arrow"></div>
            </div>

            <div class="card-container">
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
    </div>
</div>

<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<!--禁用路由 -->
<script>$.config = {router: false}</script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script>
    var city = remote_ip_info['city'];
    $("#mycity").text(city);
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
                html += '<div class="card" Onclick="location.href=' + "'activity.html'" + '">' +
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
                        '<i class="fa fa-bicycle fa-2x text-primary" aria-hidden="true"></i>' +
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


    $.init()
</script>
</body>

</html>