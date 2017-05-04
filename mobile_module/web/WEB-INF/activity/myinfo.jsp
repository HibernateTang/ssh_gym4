<%--
  Created by IntelliJ IDEA.
  User: hibernate
  Date: 2017/5/3
  Time: 16:40
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
    <title>个人信息</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <style>




        .bar .button.pull-right {
            margin-left: 1rem;
            font-size: 1.5rem;
        }
    </style>
</head>

<body>
<div class="page-group">
    <div class="page">
        <jsp:include page="header.jsp" flush="true"/>
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
                            <div class="item-input"><input type="text" placeholder="" value="上海 浦东新区" id="city-picker" readonly=""></div>
                            <div class="item-after" id="changeCity">修改城市</div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="content-block-title">已报名的活动，共<label class="text-danger">1</label>个活动</div>
            <div class="list-block">
                <ul>
                    <a class="item-content item-link" href="activity.html">
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
        <h3 class="text-center">报名信息</h3>
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
<!--禁用路由 -->
<script>$.config = {router: false}</script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/sm-city-picker.min.js' charset='utf-8'></script>
<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script>
    var city = remote_ip_info['city'];
    $("#mycity").text(city);
</script>
<script>
    $("#myinfo").addClass("active");
    $("#info").on('click', function () {
        $.popup('.popup-about');
    });

    $("#city-picker").cityPicker({});
    $("#changeCity").on('click', function () {
        $("#city-picker").picker("open");
    })
    $.init()
</script>
</body>

</html>