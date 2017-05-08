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
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

</head>
<body>
<div class="page-group">
    <div class="page page-current" child-index="0" id="child1">
        <div class="content">
            <div class="card">
                <div class="card-header no-border gym-card-title">
                    <label>${listChild[0]['name']}</label>
                    <c:if test="${listChild.size()>1}">
                        <a href="#child2">
                            <small>查询另一位宝宝</small>
                            <i class="fa fa-angle-double-right"></i></a>
                    </c:if>
                </div>
            </div>
            <div  class="card toMyInfo">
                <div class="card-header no-padding card-backinfo">
                    <i></i>
                    <div class="gym-header">
                        <div class="header-img">
                            <c:choose>
                                <c:when test="${sessionScope.user.head_src=''}">
                                    <img src="${sessionScope.user.head_src}"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="/images/member/head.jpg"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="header-text">
                            <div class="header-p">
                                <p>姓名：${listChild[0]['name']}</p>
                                <p>年龄：${listChild[0]['age']}</p>
                                <p>剩余课时：${listChild[0]['rest']}节课</p>
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
                        <c:when test="${not empty listRank[0]}">
                            <div class="card-content-inner exercise-content">
                                <div class="row no-gutter  row-box">
                                    <div class="col-33 ">
                                        <div class="sign-first">过去三月超过全国</div>
                                        <label class="big">${listRank[0]['outpass']}</label>%会员
                                    </div>
                                    <div class="col-33 c">
                                        <div class="sign-first">总共训练</div>
                                        <label class="big">${listRank[0]['mins']}</label>分钟
                                    </div>
                                    <div class="col-33">
                                        <div class="sign-first">全国会员中排第</div>
                                        <label class="big">${listRank[0]['ranking']}</label>名<i
                                            class="fa fa-angle-double-right"></i></div>
                                </div>
                                <div class="exercise-text">
                                    <p><label class="big">219</label>天您已加入小小运动馆</p>
                                    <p><label class="big">${listRank[0]['times']}</label>次您孩子共锻炼次数</p>
                                </div>

                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="card-content-inner">
                                <p>暂时还没有排名数据！</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <a class="gym-select" id="gymSelected_1"
                       gym-id="${listGymSelectedSession[0].gym['gymId']}">${listGymSelectedSession[0].gym['gymName']}</a>
                </div>
                <div class="card-content-inner">
                    <div>
                        <div class="gym-datepicker">
                            <i class="fa fa-angle-double-left"></i>
                            <input type="text" readonly id="beginDate_1" class="beginDate" value="${listGymSelectedSession[0]['beginDate']}"
                                   data-toggle="data"/> -
                            <input type="text" readonly id="endDate_1" class="endDate" value="${listGymSelectedSession[0]['endDate']}"
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
                                    <ul class="details_list">
                                        <c:choose>
                                            <c:when test="${not empty listGymClass[0]}">
                                                <c:forEach items="${listGymClass[0]}" var="gymClass">
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
                                                <p class="text-center">没有查询到课程</p>
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

    <div class="page" child-index="1" id="child2">
        <div class="content">
            <div class="card">
                <div class="card-header no-border gym-card-title">
                        <a href="#child1">
                            <i class="fa fa-angle-double-left"></i><small>查询另一个宝宝</small></a>

                    <label>${listChild[1]['name']}</label>
                </div>
            </div>
            <div class="card toMyInfo">
                <div class="card-header no-padding card-backinfo">
                    <i></i>
                    <div class="gym-header">
                        <div class="header-img">
                            <c:choose>
                                <c:when test="${sessionScope.user.head_src=''}">
                                    <img src="${sessionScope.user.head_src}"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="/images/member/head.jpg"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="header-text">
                            <div class="header-p">
                                <p>姓名：${listChild[1]['name']}</p>
                                <p>年龄：${listChild[1]['age']}</p>
                                <p>剩余课时：${listChild[1]['rest']}节课</p>
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
                        <c:when test="${not empty listRank[1]}">
                            <div class="card-content-inner exercise-content">
                                <div class="row no-gutter  row-box">
                                    <div class="col-33 ">
                                        <div class="sign-first">过去三月超过全国</div>
                                        <label class="big">${listRank[1]['outpass']}</label>%会员
                                    </div>
                                    <div class="col-33 c">
                                        <div class="sign-first">总共训练</div>
                                        <label class="big">${listRank[1]['mins']}</label>分钟
                                    </div>
                                    <div class="col-33">
                                        <div class="sign-first">全国会员中排第</div>
                                        <label class="big">${listRank[1]['ranking']}</label>名<i
                                            class="fa fa-angle-double-right"></i></div>
                                </div>
                                <div class="exercise-text">
                                    <p><label class="big">219</label>天您已加入小小运动馆</p>
                                    <p><label class="big">${listRank[1]['times']}</label>次您孩子锻炼次数</p>
                                </div>

                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="card-content-inner">
                                <p>你暂时还没有排名 数据！</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <a class="gym-select"  id="gymSelected_2"
                       gym-id="${listGymSelectedSession[1].gym['gymId']}">${listGymSelectedSession[1].gym['gymName']}</a>
                </div>

                <div class="card-content-inner">
                    <div>
                        <div class="gym-datepicker">
                            <i class="fa fa-angle-double-left"></i>
                            <input type="text" readonly id="beginDate_2" class="beginDate" value="${listGymSelectedSession[1]['beginDate']}"
                                   data-toggle="data"/> -
                            <input type="text" readonly id="endDate_2" class="endDate" value="${listGymSelectedSession[1]['endDate']}"
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
                                    <ul  class="details_list">
                                        <c:choose>
                                            <c:when test="${not empty listGymClass[1]}">
                                                <c:forEach items="${listGymClass[1]}" var="gymClass">
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
                                                <p class="text-center">没有查询到课程</p>
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
    /*当前孩子标识index 0|1 */
    var CHILD_INDEX = 0;
    CHILD_INDEX = $(".page-current").attr("child-index");

    $(".beginDate").calendar({
       value:['2017-04-01']
    });
    $(".endDate").calendar({
        value:['2017-04-21']
    });

    if ($('.swiper-container-dlist').size()) {
        $('.swiper-container-dlist').find('.swiper-slide').height('auto');
        var swiper_dList = new Swiper('.swiper-container-dlist', {
            direction: 'vertical',
            slidesPerView: 'auto',
            mousewheelControl: true,
            freeMode: true,
            scrollbarHide: false,
        })
    }

    $(".toMyInfo").on('click', function () {
        $.showIndicator();
        location.href = '/index/myinfo?idhz=${listChild[0]['idhz']}';
    })

    $(".beginDate,.endDate").on('change', function () {
        var gymId = $(".gym-select").eq(CHILD_INDEX).attr('gym-id');
        var gymName = $(".gym-select").eq(CHILD_INDEX).text();

        var hzId = ${listChild[0]['idhz']};
        var beginDate = $(".beginDate").eq(CHILD_INDEX).val();
        var endDate = $(".endDate").eq(CHILD_INDEX).val();
        attend_ajax(gymId, gymName, hzId, beginDate, endDate);
    })

    //考勤明细
    function attend_ajax(idGym, nameGym, idChild, beginDate, endDate) {
        $.ajax({
            type: "GET",
            url: "/index/attend",
            data: {"idGym": idGym, "nameGym": nameGym, "idChild": idChild, "beginDate": beginDate, "endDate": endDate},
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            beforeSend: function () {
                $(".details_list").eq(CHILD_INDEX).html('<p class="text-center  animated slideInDown "><i class="fa fa-circle-o-notch fa-2x fa-spin"></i></p>');
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
                    divGymClass = '<p class="text-center">没有查询到课程</p>';
                }
                $(".details_list").eq(CHILD_INDEX).html(divGymClass);
            },
        });
    }

    //    gyms绑定到actions上
    $('.gym-select').on('click', function () {
        var selectedGymId = $(".gym-select").eq(CHILD_INDEX).attr("gym-id");
        var buttons1 = [
            {
                text: '请选择中心',
                label: true
            }
        ];
        var gymId = "";
        var gymName = "";

        <c:forEach items="${sessionScope.listGym}" var="mygym">
        gymName = "${mygym['gymName']}";
        gymId = "${mygym['gymId']}";
        var button_json = {
            text: gymName,
            disabled: selectedGymId == gymId,
            id: gymId,
            onClick: function () {
                gym_change(this.text, this.id);
            }
        };
        var buttons2 = [
            {
                text: '取消',
                bg: 'danger'
            }
        ];
        buttons1.push(button_json);
        </c:forEach>
        var groups = [buttons1, buttons2];
        $.actions(groups);
    });

    function gym_change(gymName, gymId) {
        $(".gym-select").eq(CHILD_INDEX).text(gymName);
        $(".gym-select").eq(CHILD_INDEX).attr("gym-id", gymId);
        attend_ajax(gymId, gymName, ${listChild[0]['idhz']}, $(".beginDate").eq(CHILD_INDEX).val(), $(".endDate").eq(CHILD_INDEX).val());
    }

    $.init();
</script>
</body>

</html>