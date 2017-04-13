<%--
  Created by IntelliJ IDEA.
  User: 汁
  Date: 2017/3/25
  Time: 19:00
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
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>会员主页</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

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

        .facebook-card .card-header {
            display: flex;
            -webkit-justify-content: flex-start;
            justify-content: flex-start;
        }

        .facebook-card .card-header.row-right {
            background: url("/images/member/single-row-right.png") no-repeat 95% 50%;
        }

        /*点击header*/

        .facebook-card .card-header:active, .card-header:visited {
            background-color: #d9d9d9;
        }

        .facebook-card .facebook-title {
            font-size: 0.825rem;
            font-weight: bold;
        }

        .facebook-card .facebook-text {
            font-size: 0.6rem;
        }

        .facebook-card .facebook-text .inform {
            color: #398bfb;
        }

        strong {
            font-size: 125%;
        }

        .gym-icon-list p {
            margin: 0;
            font-size: 12px;
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
            width: 100%;
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
        .details_list li span.text-danger {
            color: #a94442;
        }

        .details_list li .details {
            color: #3f4896;
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

        .facebook-avatar img {
            float: left;
            width: 72px;
            height: 72px;
            border-radius: 50%;
            border: 2px solid #fff;
            margin-right: 12px;
        }

        .gym-datepicker {
            display: table;
            margin: auto;
        }

        .gym-datepicker input {
            display: table-cell;
            border: none;
            width: 4.8rem;
            text-align: center;
        }

        .gym-datepicker i {
            display: table-cell;
        }

        .gym-card-title a:active {
            color: #eee;
        }


    </style>


</head>

<body>
<div class="page-group">
    <div class="page page-current" id="child1">
        <div class="content">
            <div class="card">
                <div class="card-header no-border gym-card-title">
                    ${indexObj['name']}
                    <c:if test="${indexObj['showAnother']==true}">
                        <a href="#child2" class="pull-right">
                            <small>查询另一位宝宝</small>
                            <i class="fa fa-angle-double-right"></i></a>
                    </c:if>
                </div>
            </div>

            <div onClick="location.href='/index/myinfo?idhz=${indexObj['idhz']}'" id="toMyInfo"
                 class="card facebook-card" ontouchstart="return false;">
                <div class="card-header row-right">
                    <div class="facebook-avatar">
                        <img src="/images/member/head.jpg">
                    </div>

                    <div>
                        <div class="facebook-title">${indexObj['name']}</div>
                        <div class="facebook-text">年龄：${indexObj['age']}</div>
                        <div class="facebook-text">合同剩余课时数：${indexObj['rest']}节课</div>
                        <div class="facebook-text">活动通知：<span class="inform">植树节活动</span></div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="item-title">我的旅行</div>
                    <i class="fa fa-send-o"></i>
                </div>
                <div class="card-content">
                    <c:choose>
                        <c:when test="${not empty rankObj}">

                            <div class="card-content-inner">
                                <div class="card-exercise-time">${rankObj['mins']}分钟</div>
                                <div class="exercise-total">完成${rankObj['times']}次</div>
                                <div class="card-exercise-beyond">
                                    过去<strong>三个月</strong>超过全国<strong>${rankObj['outpass']}%</strong>的会员
                                </div>
                                <div class="card-exercise-rank">在全国所有会员中排名<strong>${rankObj['ranking']}</strong>名<i
                                        class="fa fa-angle-double-right"></i></div>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="card-content-inner">
                                <h1>你暂时还没有排名！</h1>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="card">
                <div class="list-block">
                    <div class="item-content">
                        <div class="item-media"><i class="fa fa-soccer-ball-o"></i></div>
                        <div class="item-inner">
                            <select id="gyms">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.listGym}">
                                        <c:forEach items="${sessionScope.listGym}" var="mygym">
                                            <option value="${mygym['idGym']}"
                                                    <c:if test="${mygym['idGym'] == sessionScope.gym['idGymSelected']}">selected </c:if> >${mygym['gymName']}
                                            </option>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">没有中心</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                </div>



                <div class="card-content-inner">

                    <div>
                        <div class="gym-datepicker">
                            <i class="fa fa-angle-double-left"></i>
                            <input type="text" readonly id="beginDate" value="${sessionScope.gym['beginDate']}"
                                   data-toggle="data"/> -
                            <input type="text" readonly id="endDate" value="${sessionScope.gym['endDate']}"
                                   data-toggle="data"/>
                            <i class="fa fa-angle-double-right"></i>
                        </div>
                        <div class="row no-gutter gym-icon-list">
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

                                    <ul id="details_list" class="details_list">
                                        <c:choose>
                                            <c:when test="${not empty listGymClass}">
                                                <c:forEach items="${listGymClass}" var="gymClass">
                                                    <li class="row no-gutter">
                                                <span class="col-20  date"><fmt:formatDate value="${gymClass['date']}"
                                                                                           pattern="yyyy.MM.dd"/></span>
                                                        <span class="col-20  time">${gymClass['time']}</span>
                                                        <span class="col-20  class">${gymClass['course']}</span>
                                                        <span class="col-20  state">${gymClass['kq']}</span>
                                                        <a href="/index/topic"><span class="col-20 details">课程亮点</span></a>
                                                    </li>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="row no-gutter">
                                                    <h3 class="col-100 text-center">没有查询到课程</h3>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>


                                    </ul>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
<script src="/js/swiper-3.4.2.jquery.min.js"></script>
<script>
    $(function () {
        $("#beginDate").calendar({
            value: [$("#beginDate").val()]
        });
        $("#endDate").calendar({
            value: [$("#endDate").val()]
        });
        $.init();
    })

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


    $("#beginDate,#endDate,#gyms").change(function () {
        attend_ajax($("#gyms").val(), ${indexObj['idhz']}, $("#beginDate").val(), $("#endDate").val());
    })

    //考勤明细
    function attend_ajax(idGym, idChild, beginDate, endDate) {
        $.ajax({
            type: "GET",
            url: "/index/attend",
            data: {"idGym": idGym, "idChild": idChild, "beginDate": beginDate, "endDate": endDate},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            beforeSend: function () {
                $("#details_list").html('<li class="row no-gutter"><span class="col-100 text-center"><i class="fa  fa-refresh  fa-2x fa-spin"></i></span></li>')
            },
            success: function (data) {
                var divGymClass = "";
                if (data != null) {
                    $.each(data, function (index, content) {
                        divGymClass += "<li class='row no-gutter'>"
                        divGymClass += "<span class='col-20  date'>" + content.date + "</span>";
                        divGymClass += "<span class='col-20  time'>" + content.time + "</span>";
                        divGymClass += "<span class='col-20  class'>" + content.course + "</span>";
                        if (content.kq == "尚未开课"){
                            divGymClass += "<span class='col-20  state text-danger'>";
                        }else{
                            divGymClass += "<span class='col-20  state'>";
                        }
                        divGymClass += content.kq + "</span>";
                        divGymClass += "<a href='/index/topic'><span class='col-20 details'>课程亮点</span></a>";
                        divGymClass += "</li>";
                    });
                } else {
                    divGymClass = '<li class="row no-gutter">' +
                            '<h3 class="col-100 text-center">没有查询到课程</h3>' +
                            '</li>';
                }

                $("#details_list").html(divGymClass);
            }
        });
    }


</script>
</body>

</html>