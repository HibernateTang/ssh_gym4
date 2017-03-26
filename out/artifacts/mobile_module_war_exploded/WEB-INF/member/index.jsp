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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>会员主页</title>
    <link rel="stylesheet" type="text/css" href="/css/sm.min.css">
    <link rel="stylesheet" type="text/css" href="/css/swiper-3.4.2.min.css">

    <script src="/js/jquery-1.11.3.min.js"></script>
    <script src="/js/swiper-3.4.2.jquery.min.js"></script>

    <style>
        .card-exercise-time {
            font-size: 1rem;
            font-weight: bold;
            text-align: center;
            line-height: 17px;
        }

        .card-exercise-rank {
            font-size: 0.825rem;
            text-align: center;
            color: #398bfb;
        }

        .card-exercise-beyond {
            font-size: 0.825rem;
            text-align: center;
            color: #398bfb;
        }

        .exercise-total {
            text-align: center;
            font-size: 0.825rem;
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

        .no-padding {
            padding: 0;
        }

        .card-header>.list-block {
            width: 100%;
        }

        @font-face {
            font-family: 'iconfont';
            /* project id 260152 */
            src: url('//at.alicdn.com/t/font_hszk64a2aed8to6r.eot');
            src: url('//at.alicdn.com/t/font_hszk64a2aed8to6r.eot?#iefix') format('embedded-opentype'), url('//at.alicdn.com/t/font_hszk64a2aed8to6r.woff') format('woff'), url('//at.alicdn.com/t/font_hszk64a2aed8to6r.ttf') format('truetype'), url('//at.alicdn.com/t/font_hszk64a2aed8to6r.svg#iconfont') format('svg');
        }

        .icon-doublerow {
            content: "&#xe603;";
        }
    </style>

</head>

<body>
<div class="card">
    <div class="card-content">
        <div class="card-content-inner">
            费云路 <a href="/index/details">查询另一位宝宝>></a>

            <i class="icon-doublerow "></i>
        </div>
    </div>
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

    </div>
</div>

<div class="card">
    <div class="card-header no-padding">
        <div class="list-block">
            <ul>
                <li>
                    <a href="#" class="item-link item-content">
                        <div class="item-inner">
                            <div class="item-title">我的运动时间</div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="card-content">
        <p class="card-exercise-time">225分钟</p>
        <div class="row">
            <div class="col-50 exercise-total">完成5次</div>
            <div class="col-50 exercise-total">累计5天</div>
        </div>
    </div>
    <p class="card-exercise-beyond">过去<strong>三个月</strong>超过全国<strong>60%</strong>的会员</p>
    <p class="card-exercise-rank">在全国所有会员中排名<strong>439</strong>名</p>
</div>
</div>

<div class="card">
    <div class="card-content">
        <div class="swiper-container swiper-attend">
            <div class="swiper-wrapper">
                <div class="swiper-slide swiper-slide-active">
                    <ul class="details_list">
                        <li>
                            <span class="date">2017.1.18</span>
                            <span class="time">10:00</span>
                            <span class="class">小鸟班</span>
                            <span class="state">已出勤</span>
                            <a href="http://jy.qq125.com//1703/h5mobile_member/details.html"><span class="details">查看本周课程亮点</span></a>
                        </li>
                        <li>
                            <span class="date">2017.1.25</span>
                            <span class="time">10:00</span>
                            <span class="class">小鸟班</span>
                            <span class="state">已出勤</span>
                            <a href="http://jy.qq125.com//1703/h5mobile_member/details.html"><span class="details">查看本周课程亮点</span></a>
                        </li>
                        <li>
                            <span class="date">2017.2.1</span>
                            <span class="time">10:00</span>
                            <span class="class">小鸟班</span>
                            <span class="state">已出勤</span>
                            <a href="http://jy.qq125.com//1703/h5mobile_member/details.html"><span class="details">查看本周课程亮点</span></a>
                        </li>
                        <li>
                            <span class="date">2017.1.25</span>
                            <span class="time">10:00</span>
                            <span class="class">小鸟班</span>
                            <span class="state">已出勤</span>
                            <a href="http://jy.qq125.com//1703/h5mobile_member/details.html"><span class="details">查看本周课程亮点</span></a>
                        </li>
                        <li>
                            <span class="date">2017.2.1</span>
                            <span class="time">10:00</span>
                            <span class="class">小鸟班</span>
                            <span class="state">已出勤</span>
                            <a href="http://jy.qq125.com//1703/h5mobile_member/details.html"><span class="details">查看本周课程亮点</span></a>
                        </li>
                        <li>
                            <span class="date">2017.1.25</span>
                            <span class="time">10:00</span>
                            <span class="class">小鸟班</span>
                            <span class="state">已出勤</span>
                            <a href="http://jy.qq125.com//1703/h5mobile_member/details.html"><span class="details">查看本周课程亮点</span></a>
                        </li>
                        <li>
                            <span class="date">2017.2.1</span>
                            <span class="time">10:00</span>
                            <span class="class">小鸟班</span>
                            <span class="state">已出勤</span>
                            <a href="http://jy.qq125.com//1703/h5mobile_member/details.html"><span class="details">查看本周课程亮点</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>