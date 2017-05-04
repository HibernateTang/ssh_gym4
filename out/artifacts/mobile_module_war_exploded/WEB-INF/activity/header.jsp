<%--
  Created by IntelliJ IDEA.
  User: hibernate
  Date: 2017/5/4
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .bar .button.pull-right {
            margin-left: 1rem;
            font-size: 1.5rem;
        }
    </style>
</head>
<body>
<header class="bar bar-nav">
    <a class="button button-link pull-left "><i class="fa fa-location-arrow" aria-hidden="true"></i> <small>地点：<label id="mycity"></label></small></a>
    <a class="button button-link  fa fa-user pull-right " id="myinfo" external  href="/activity/myinfo"></a>
    <a class="button button-link  fa fa-search  pull-right " id="search" href="/activity/search"></a>
    <a class="button button-link  fa fa-home  pull-right " id="home" href="/activity"></a>
</header>

</body>
</html>
