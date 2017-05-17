<%--
  Created by IntelliJ IDEA.
  User: hibernate
  Date: 2017/5/12
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>后台</title>
    <link rel="stylesheet" href="/ui/semantic/semantic.min.css">
</head>

<body>
<div class="ui  thin sidebar left inverted vertical menu">
    <div class="header item">
        <img class="logo" src="/images/member/head.jpg">
    </div>
    <a class="item">活动
        <i class="browser icon"></i>
    </a>
    <a class="item">课程</a>
</div>
<div class="pusher">
    <div class="ui masthead  segment">
        <div class="ui container">
            <div class="ui breadcrumb">
                <a class="section" id="menu">Home</a>
                <i class="right angle icon divider"></i>
                <div class="active section">活动</div>
            </div>
        </div>
    </div>
    <div class="ui container">
        <div class="ui segments">
            <div class="ui segment">
                <div class="ui two column stackable grid">
                    <div class="column">
                        <a href="/admin/activityToAdd" class="ui primary button">新建活动</a>
                    </div>
                    <div class="column right aligned">
                        <select name="skills" multiple="" class="ui multiple search selection dropdown">
                            <option value="">上海</option>
                            <option value="angular">北京</option>
                            <option value="css">江苏</option>
                        </select>
                        <a href="" class="ui primary button">查询</a>
                    </div>
                </div>
            </div>
            <div class="ui segment right aligned">
                <div class="ui buttons">
                    <button class="ui left labeled icon button"><i class="left arrow icon"></i> 上一页 </button>
                    <button class="ui blue button">1</button>
                    <button class="ui right labeled icon button"><i class="right arrow icon"></i> 下一页 </button>
                </div>
            </div>
            <div class="ui segment">
                <div class="ui stackable special cards">
                    <div class="card">
                        <div class="blurring dimmable image">
                            <div class="ui dimmer">
                                <div class="content">
                                    <div class="center">
                                        <a href="/admin/activityEdit?id=1" class="ui inverted button">编辑活动</a>
                                    </div>
                                </div>
                            </div>
                            <img src="/images/member/classThemeBanner.jpg">
                        </div>
                        <div class="content">
                            <a class="header">植树节活动</a>
                            <div class="meta">
                                <span class="date">Create in 2017-01-02</span>
                            </div>
                        </div>
                        <div class="extra content">
                            <a class="right floated">删除</a>
                            <a> 查看 </a>
                        </div>
                    </div>
                    <div class="ui card">
                        <div class="blurring dimmable image">
                            <div class="ui inverted dimmer">
                                <div class="content">
                                    <div class="center">
                                        <a class="ui primary button">编辑活动</a>
                                    </div>
                                </div>
                            </div>
                            <img src="/images/member/classThemeBanner.jpg">
                        </div>
                        <div class="content">
                            <a class="header">涨价活动</a>
                            <div class="meta">
                                <span class="date">Create in 2017-01-02</span>
                            </div>
                        </div>
                        <div class="extra content">
                            <a> 查看 </a>
                            <a class="right floated">删除</a>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script type='text/javascript' src='/js/jquery-1.11.3.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/ui/semantic/semantic.min.js' charset='utf-8'></script>
<script>
    $('.ui.dropdown').dropdown();
    $("#menu").on('click', function () {
        $(".ui.sidebar").sidebar('toggle');
    })
    $('.special.cards .image').dimmer({
        on: 'hover'
    });
    $('.clear .button').on('click', function () {
        $('.clear.ui.dropdown').dropdown('clear');
        alert(1)
    })
    ;
</script>
</body>

</html>
