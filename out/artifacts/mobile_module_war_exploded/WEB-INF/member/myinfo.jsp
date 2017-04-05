<%--
  Created by IntelliJ IDEA.
  User: 汁
  Date: 2017/4/5
  Time: 20:16
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
    <title>我的信息</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .gym-card-title {
            background: url('/images/member/card-bg.png');
            color: #fff;
            font-weight: 500;
        }

        .gym-card-title a {
            color: #fff;
        }

        .gym-myinfo a {
            color: #999;
        }

        .gym-myinfo {
            background: url('/images/member/myinfo-banner.jpg') no-repeat;
            background-size: 100% 100%;
            min-height: 7.5rem;
        }

        .gym-myinfo .gym-myinfo-title {
            position: absolute;
            font-size: 2.2rem;
            color: #fff;
            font-weight: 400;
            text-shadow: 2px 2px 2px #333;
            text-align: center;
            width: 100%;
        }

        .facebook-card .card-header {
            display: flex;
            -webkit-justify-content: flex-start;
            justify-content: flex-start;
        }

        .gym-list {
            font-size: 0.65rem;
        }

        .facebook-avatar img {
            float: left;
            width: 72px;
            height: 72px;
            border-radius: 50%;
            border: 2px solid #fff;
            margin-right: 12px;
        }

        .facebook-card .facebook-title {
            font-size: 0.825rem;
            font-weight: bold;
        }

        .facebook-card .facebook-text {
            font-size: 0.6rem;
        }
    </style>
</head>

<body>
        <div class="content">
            <div class="card">
                <div class="card-content gym-myinfo">
                    <a href="/index"><i class="fa fa-angle-double-left fa-3x"></i></a>
                    <div class="gym-myinfo-title">我的信息</div>
                </div>
            </div>

            <div class="card facebook-card">
                <div class="card-header">
                    <div class="facebook-avatar">
                        <img src="/images/member/head.jpg" >
                    </div>
                    <div>
                        <div class="facebook-title">费云路</div>
                        <div class="facebook-text">年龄：18个月</div>
                    </div>

                </div>
                <div class="card-content">
                    <div class="card-conntent-inner">
                        <div class="list-block gym-list">
                            <ul>
                                <li class="item-content">
                                    <div class="item-inner">
                                        <div class="item-title">报名日期：2016/04/01</div>
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title">有效期：2018/04/01</div>
                                    </div>
                                </li>
                                <li class="item-content">
                                    <div class="item-inner">
                                        <div class="item-title">剩余课时数：45节</div>
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title">报名课时数：100节</div>
                                    </div>
                                </li>
                                <li class="item-content">
                                    <div class="item-inner">
                                        <div class="item-title">累计请假：0节</div>
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title">报名金额：11800</div>
                                    </div>
                                </li>
                                <li class="item-content">
                                    <div class="item-inner">
                                        <div class="item-title">班级：小鸟班</div>
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title">赠课：球类怪兽10节</div>
                                    </div>
                                </li>
                                <li class="item-content">
                                    <div class="item-inner">
                                        <div class="item-title">积分：1000</div>
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title">所有合同</div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header no-border gym-card-title"><i></i>上海环球中心本月通知<i></i></div>
                <div class="card-content">
                    <img src="/images/member/inform.jpg" width="100%"></div>
            </div>
        </div>

<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
<script src="/js/swiper-3.4.2.jquery.min.js"></script>
<script>
    $(function () {
        $.init();
    })
</script>
</body>

</html>