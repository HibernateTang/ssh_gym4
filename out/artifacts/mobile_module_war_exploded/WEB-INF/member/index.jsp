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
    <link rel="stylesheet" href="/css/gym.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

    <style>


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
                 class="card" ontouchstart="return false;">
                <div class="card-header no-padding card-backinfo">
                    <i></i>
                    <div class="gym-header">
                        <div class="header-img">
                            <img src="${sessionScope.user.head_src}"/>
                        </div>
                        <div class="header-text">
                            <div class="header-p">
                                <p>姓名：${indexObj['name']}</p>
                                <p>年龄：${indexObj['age']}</p>
                                <p>剩余课时：${indexObj['rest']}节课</p>
                            </div>
                            <div class="header-row-right">
                                <i class="fa fa-angle-right fa-4x "></i>
                            </div>

                        </div>
                    </div>
                    <div class="inform">
                        <div class="inform-title">活动通知：</div>
                        <div class="activity-info">植树节活动|4月1号全面涨价</div>
                    </div>
                    <i></i>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="item-title">我的旅行</div>
                    <i></i>
                </div>
                <div class="card-content">
                    <c:choose>
                        <c:when test="${not empty rankObj}">
                            <div class="card-content-inner exercise-content">
                                <div class="row no-gutter  row-box">
                                    <div class="col-33 ">
                                        <div class="sign-first">过去三月超过全国</div>
                                        <label class="big">${rankObj['outpass']}</label>%会员
                                    </div>
                                    <div class="col-33 c">
                                        <div class="sign-first">总共训练</div>
                                        <label class="big">${rankObj['mins']}</label>分钟
                                    </div>
                                    <div class="col-33">
                                        <div class="sign-first">全国会员中排第</div>
                                        <label class="big">${rankObj['ranking']}</label>名<i
                                            class="fa fa-angle-double-right"></i></div>
                                </div>
                                <div class="exercise-text">
                                    <p><label class="big">219</label>天您已加入小小运动馆</p>
                                    <p><label class="big">1.5</label>次您孩子每周锻炼次数</p>
                                </div>

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
                <div class="card-header">
                    <a class="gym-select" id="gym-select" gym-id="${sessionScope.gym['idGymSelected']}">假装月球中心</a>
                    <%--var button_json;--%>
                    <%--<c:forEach items="${sessionScope.listGym}" var="mygym">--%>
                        <%--var gymName = ${mygym['gymName']};--%>
                        <%--var gymId = ${mygym['idGym']};--%>
                        <%--button_json = "{text:'" + gymName + "',onClick:function(){ $.alert('" + gymId + "') } }";--%>
                    <%--</c:forEach>--%>
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
                        <section
                                class="swiper-container-dlist swiper-container-vertical swiper-container-free-mode">
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
                                                        <a href="/index/topic"><span
                                                                class="col-20 details">课程亮点</span></a>
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

    <div class="page" id="child_2">

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
                        if (content.kq == "尚未开课") {
                            divGymClass += "<span class='col-20  state text-danger'>";
                        } else {
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

    $('.gym-select').on('click', function () {
        var buttons1 = [
            {
                text: '请选择中心',
                label: true
            },
            {
                text: '卖出',
                bold: true,
                color: 'danger',
                onClick: function () {
                    $.alert("你选择了“卖出“" + $(".gym-select").attr("gym-id"));
                }
            },
            {
                text: '买入',
                onClick: function () {
                    $.alert("你选择了“买入“");
                }
            }
        ];
        var buttons2 = [
            {
                text: '取消',
                bg: 'danger'
            }
        ];
        var groups = [buttons1, buttons2];
        var button_json = {text:'',onClick:''};
        <c:forEach items="${sessionScope.listGym}" var="mygym">
        var gymName = "${mygym['gymName']}";
        var gymId = "${mygym['idGym']}";
        button_json.text = gymName;
        button_json.onClick = function () {
            $.alert(gymId)
        }
//        button_json += "{'text':'" + gymName + "','onClick':function(){ $.alert('" + gymId + "') } }";
        buttons1.push(JSON.parse(button_json));
        </c:forEach>
//        alert(button_json)

        $.actions(groups);
    });

    function gym_change(gymName,gymId){
        <%--$("#gym-select").text(gymName);--%>
        <%--$("#gym-select").attr("gym-id",gymId);--%>
        <%--attend_ajax($("#gym-select").attr("gym-id"), ${indexObj['idhz']}, $("#beginDate").val(), $("#endDate").val());--%>
    }
</script>
</body>

</html>