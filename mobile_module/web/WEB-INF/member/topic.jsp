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
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link href="http://cdn.bootcss.com/video.js/6.0.0-RC.5/video-js.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
    <script src="http://cdn.bootcss.com/video.js/6.0.0-RC.5/video.min.js"></script>

    <!--<script src="js/jquery-1.11.3.min.js"></script>-->
    <script src="/js/swiper-3.4.2.jquery.min.js"></script>
    <style>
        .gym-card-title {
            background: url('/images/member/card-bg.png');
            color: #fff;
            font-weight: 500;
        }

        .gym-card-title a {
            color: #fff;
        }

        .gym-topic a {
            color: #999;
        }

        .gym-topic {
            background: url('/images/member/classThemeBanner.jpg') no-repeat;
            background-size: 100% 100%;
            min-height: 7.5rem;
            /*padding-top: 3.5em;*/
        }

        .gym-topic .gym-topic-title {
            position: absolute;
            font-size: 2.2rem;
            color: #fff;
            font-weight: 600;
            text-align: center;
            width: 100%;
        }

        .gym-strong {
            font-size: 125%;
        }

        .gym-small {
            font-size: 85%;
        }

        .vjs-poster {
            background-size: 100% 100%;
        }
    </style>
</head>

<body>
<div class="content">
    <div class="card">
        <div class="card-content gym-topic">
            <a href="/index"><i class="fa fa-angle-double-left fa-3x"></i></a>
            <div class="gym-topic-title">中心主题</div>

        </div>
    </div>

    <div class="card">
        <div class="card-header gym-card-title">
            <div class="text-center">亲子课 Parent Child <br/>小鸟班 birds</div>
            <span class="gym-strong pull-right">24周</span>

        </div>
        <div class="card-content">
            <div class="card-content-inner">
                <div class="content-padded">
                    <div>主题：我的小鸟宝宝告诉我</div>
                    <div>关键词：发音</div>
                    <div>重点技能：P-bar上行走、悬挂</div>
                    <div>Group：How Much is That Doggie In the Window? 通过我们有意识的语音规划，提高孩子的语音发展，为他们打下基础</div>
                </div>
            </div>
        </div>

    </div>

    <div class="card">
        <div class="card-header no-border gym-card-title">作业 HomeWork</div>
        <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto"
               style="max-width:100%"
               height="200px" poster="http://vjs.zencdn.net/v/oceans.png" data-setup="{}"/>
        <source src="http://vjs.zencdn.net/v/oceans.mp4" type="video/mp4"/>
        <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm"/>
        <source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg"/>
        <track kind="captions" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
        <!-- Tracks need an ending tag thanks to IE9 -->
        <track kind="subtitles" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
        <!-- Tracks need an ending tag thanks to IE9 -->
        <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
        </p>
        </video>
        <div class="card-content">
            <div class="card-content-inner">

                <p class="gym-small">兼容性最好，支持ie6+，及所有现代浏览器。 支持按字体的方式去动态调整图标大小，颜色等等。
                    但是因为是字体，所以不支持多色。只能使用平台里单色的图标，就算项目里有多色图标也会自动去色。</p>
            </div>
        </div>
    </div>
</div>
<script>
    $.init()
</script>
</body>

</html>