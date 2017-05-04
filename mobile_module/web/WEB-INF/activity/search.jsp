<%--
  Created by IntelliJ IDEA.
  User: hibernate
  Date: 2017/5/3
  Time: 16:44
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
    <title>搜索</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
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

    .bar .button.pull-right {
        margin-left: 1rem;
        font-size: 1.5rem;
    }
</style>

<body>
<div class="page-group">
    <div class="page">
        <jsp:include page="header.jsp" flush="true"/>
        <div class="bar bar-header-secondary">
            <div class="searchbar">
                <a class="searchbar-cancel">取消</a>
                <div class="search-input">
                    <label class="search-fa fa fa-search" aria-hidden="true" for="search"></label>
                    <input type="search" id='search' placeholder='输入关键字...' />
                </div>
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
</script>
    <script>
        $("#search").addClass("active");
        $.init()
    </script>
</body>

</html>