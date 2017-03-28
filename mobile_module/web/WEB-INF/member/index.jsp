<%--
  Created by IntelliJ IDEA.
  User: 汁
  Date: 2017/3/25
  Time: 19:00
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
    <title>会员主页</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" type="text/css" href="/css/swiper-3.4.2.min.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!--<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>-->
    <!--<script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>-->


    <script src="/js/jquery-1.11.3.min.js"></script>
    <script src="/js/swiper-3.4.2.jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/fastclick/1.0.6/fastclick.min.js"></script>


    <script>
        $(function () {
            FastClick.attach(document.body);
        });
    </script>
    <style>
        .card-exercise-time {
            font-size: 1.5rem;
            text-align: center;
            line-height: 1.5rem;
        }

        .card-exercise-rank {
            font-size: 0.7rem;
            text-align: center;
            color: #31708f;
        }

        .card-exercise-beyond {
            font-size: 0.825rem;
            text-align: center;
            color: #31708f;
        }

        .exercise-total {
            text-align: center;
            font-size: 0.7rem;
        }

        .facebook-card .facebook-title {
            margin-left: 2.2rem;
            font-size: 0.825rem;
            font-weight: bold;
        }

        .facebook-card .facebook-text {
            margin-left: 2.2rem;
            font-size: 0.6rem;
        }

        .facebook-card .facebook-text .inform {
            color: #398bfb;
        }

        .card-header > .list-block {
            width: 100%;
        }

        .list-block ul ul {
            padding-left: 0;
        }

        strong {
            font-size: 125%;
        }

        .gym-icon-list p {
            margin: 0;
            font-size: 12px;
        }

        .index-bottom-img {
            width: 180px;
            height: 100px;
        }

        .swiper-container-dlist {
            /*position: absolute;*/
            width: 100%;
            height: 7.2rem;
            overflow: hidden;
        }

        .details_list {
            list-style: none;
            margin: 0px;
            padding: 0px
        }

        .details_list li {
            position: relative;
            width: 94%;
            height: 1.8rem;
            line-height: 1.8rem;
            margin: 0 auto;
            border-top: 1px solid #d7d7d7;
        }

        .details_list li span {
            text-align: center;
            color: #1f1c1d;
            font-size: 1.7vh;
            float: left;
        }

        .details_list li .date {
            width: 16.5%;
            margin-left: 5%;
            text-align: left;
        }

        .details_list li .time {
            width: 16%;
            margin-left: 1.3%;
        }

        .details_list li .class {
            width: 14%;
            margin-left: 0.1%;
        }

        .details_list li .state {
            width: 17%;
            margin-left: 2.3%;
        }

        .details_list li .details {
            width: 27%;
            color: #3f4896;
            float: right;
        }

        .details_list li .state[data-noClass='1'] {
            color: #dc2b46;
        }

        .gym-card-title {
            background: url('/images/member/card-bg.png');
            color: #fff;
            font-weight: 500;
        }

        .gym-card-title a {
            color: #fff;
        }
    </style>

</head>

<body>

<div class="content">
    <div class="card">
        <div class="card-header no-border gym-card-title">
            费云路
            <a href="/index/topic" class="pull-right">
                <small>查询另一位宝宝</small>
                <i class="fa fa-angle-double-right"></i></a>
        </div>
        <%--<div class="card-header no-border gym-card-title">--%>
        <%--<a href="/index/topic" class="pull-left"> <i class="fa fa-angle-double-left"></i><small>查询另一位宝宝</small></a>--%>
        <%--此么么--%>

        <%--</div>--%>
    </div>

    <div class="card facebook-card">
        <div class="card-header">
            <div class="facebook-avatar">
                <img src="/images/member/head.gif" width="100" height="90">
            </div>
            <div class="facebook-title">费云路</div>
            <div class="facebook-text">年龄：18个月</div>
            <div class="facebook-text">剩余课时数：45节课</div>
            <div class="facebook-text">活动通知：<span class="inform">这周奇怪的活动什么|啊啊实打实的|烦阿斯打扫打扫打扫</span></div>
            <!--<i class="fa fa-angle-right fa-4x pull-right"></i>-->
        </div>
    </div>

    <div class="card">
        <div class="card-content">
            <div class="list-block">
                        <a href="#" class="item-link item-content">
                            <div class="item-inner">
                                <div class="item-title">我的旅行</div>
                            </div>
                        </a>
            </div>
            <div class="card-content-inner">
                <div class="card-exercise-time">225分钟</div>
                <div class="row">
                    <div class="col-50 exercise-total">完成5次</div>
                    <div class="col-50 exercise-total">累计5天</div>
                </div>
                <div class="card-exercise-beyond">过去<strong>三个月</strong>超过全国<strong>60%</strong>的会员</div>
                <div class="card-exercise-rank">在全国所有会员中排名<strong>439</strong>名<i class="fa fa-angle-double-right"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-content-inner">
            <div class="row">
                <div class="col-100 text-center">
                    <i class="fa fa-angle-double-left fa-2x"></i> 2017/05/02 - 2017/06/02
                    <i class="fa fa-angle-double-right fa-2x"></i>
                </div>
            </div>
            <div class="row gym-icon-list">
                <div class="col-20  text-center"><i class="fa fa-calendar fa-lg"></i>
                    <p>日期</p>
                </div>
                <div class="col-20 text-center"><i class="fa fa-clock-o fa-lg"></i>
                    <p>时间</p>
                </div>
                <div class="col-20 text-center"><i class="fa fa-users fa-lg"></i>
                    <p>班级</p>
                </div>
                <div class="col-20 text-center"><i class="fa fa-check-square fa-lg"></i>
                    <p>状态</p>
                </div>
                <div class="col-20 text-center"><i class="fa fa-bar-chart-o fa-lg"></i>
                    <p>课程详情</p>
                </div>
            </div>
            <section class="swiper-container-dlist swiper-container-vertical swiper-container-free-mode">
                <div class="swiper-wrapper">
                    <div class="swiper-slide swiper-slide-active">
                        <ul class="details_list">
                            <li>
                                <span class="date">2017.1.18</span>
                                <span class="time">10:00</span>
                                <span class="class">小鸟班</span>
                                <span class="state">已出勤</span>
                                <a href="/index/topic"><span class="details">查看本周课程亮点</span></a>
                            </li>
                            <li>
                                <span class="date">2017.1.25</span>
                                <span class="time">10:00</span>
                                <span class="class">小鸟班</span>
                                <span class="state">已出勤</span>
                                <a href="/index/topic"><span class="details">查看本周课程亮点</span></a>
                            </li>
                            <li>
                                <span class="date">2017.2.1</span>
                                <span class="time">10:00</span>
                                <span class="class">小鸟班</span>
                                <span class="state">已出勤</span>
                                <a href="/index/topic"><span class="details">查看本周课程亮点</span></a>
                            </li>
                            <li>
                                <span class="date">2017.2.1</span>
                                <span class="time">10:00</span>
                                <span class="class">小鸟班</span>
                                <span class="state">已出勤</span>
                                <a href="/index/topic"><span class="details">查看本周课程亮点</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <div class="card">
        <div class="card-content">
            <div class="row">
                <div class="col-50"><img src="/images/member/classlist.gif" class="index-bottom-img"></div>
                <div class="col-50"><img src="/images/member/upclass.gif" class="index-bottom-img"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    if ($('.swiper-container-dlist').size()) {
        $('.swiper-container-dlist').find('.swiper-slide').height('auto');
        var swiper_dList = new Swiper('.swiper-container-dlist', {
            scrollbar: $('.swiper-container-dlist').find('.swiper-scrollbar')[0],
            direction: 'vertical',
            slidesPerView: 'auto',
            mousewheelControl: true,
            freeMode: true,
            scrollbarHide: false,
        })

    }
    // $("#my-input").calendar({
    //     value: ['2015-12-05']
    // });
</script>


</html>