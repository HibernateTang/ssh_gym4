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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>后台</title>
    <link rel="stylesheet" href="/ui/semantic/semantic.min.css">
</head>

<body>
<%@ include file="/WEB-INF/admin/template_slider.jsp" %>
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
                    <a href="/admin?pageNow=${page.current-1}"
                       class="ui <c:if test="${page.current<= 1}">disabled</c:if> left labeled icon button"><i
                            class="left arrow icon"></i> 上一页 </a>
                    <a class="ui blue active button"></i> ${page.current}</a>
                    <a href="/admin?pageNow=${page.current+1}"
                       class="ui <c:if test="${page.current+1> page.total}">disabled</c:if> right labeled icon button"><i
                            class="right arrow icon"></i> 下一页 </a>
                </div>
            </div>
            <div class="ui segment">
                <div class="ui four stackable  special cards">
                    <c:if test="${not empty page.list}">
                        <c:forEach items="${page.list}" var="activity">
                            <div data-value="${activity.id}" class="card">
                                <div class="blurring dimmable image">
                                    <div class="ui dimmer">
                                        <div class="content">
                                            <div class="center">
                                                <a  href="javascript:;"
                                                 data-value="${activity.id}"  class="ui inverted button viewActivity">查看</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="${activity.bannerSrc}" onerror="this.src='/images/admin/ERROR.png'">
                                </div>
                                <div class="content">
                                    <a class="header">${activity.name}</a>
                                    <div class="meta">
                                        <span class="date"><fmt:formatDate value="${activity.createTime}"
                                                                           pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                    </div>
                                    <div class="description">
                                        <c:choose>
                                        <c:when test="${fn:length(activity.detail) > 10}">
                                            <c:out value="${fn:substring(activity.detail, 0, 10)}……"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${activity.detail}"/>
                                        </c:otherwise>
                                    </c:choose>
                                    </div>
                                </div>
                                <div class="extra content">
                                    <a href="/admin/activityDel?id=${activity.id}" class="right floated">删除</a>
                                    <a href="/admin/activityToEdit?id=${activity.id}"> 编辑 </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- modal-->
<div class="ui modal">
    <i class="close icon"></i>
    <div class="header" id="modal_name">

    </div>
    <div class="image content">
        <div class="ui medium image">
            <img src="/images/admin/ERROR.png" onerror="this.src='/images/admin/ERROR.png'" id="modal_bannerSrc">
        </div>
        <div class="description">
            <div class="ui header" >活动详情</div>
            <p id="modal_detail"></p>
            <div class="ui header" >活动时间</div>
            <p id="modal_date"></p>
            <div class="ui header" >活动细则</div>
            <div id="modal_more" class="ui horizontal list">

            </div>
        </div>
    </div>
    <div class="actions">
        <a id="modal_edit" href="/admin/activityToEdit?id=" class="ui positive right  icon button">
            编辑
        </a>
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

    $(".button.viewActivity").on('click',function () {
        var id = $(this).attr("data-value");
        $.ajax({
            type:'POST',
            url:'/admin/activityView',
            data:{
                'id':id
            },
            contentType:"application/x-www-form-urlencoded",
            dataType: "json",
            success: function (data) {
                if (data != null){
                    var activity = data[0];
                    $("#modal_name").text(activity.name);
                    $("#modal_bannerSrc").attr("src",activity.bannerSrc);
                    $("#modal_detail").text(activity.detail);
                    var modal_date = activity.beginDate + " ~ " + activity.endDate;
                    $("#modal_date").text(modal_date);
                    var modal_more = "";
                    modal_more += '<div class="item" ><div class="header">活动类别</div>' + activity.type + '</div>' ;
                    modal_more += '<div class="item" ><div class="header">活动收费类型</div>' + activity.chargeType + '</div>' ;
                    modal_more += '<div class="item" ><div class="header">活动人群</div>' + activity.crowd + '</div>' ;
                    modal_more += '<div class="item" ><div class="header">运动强度</div>' + activity.strength + '</div>' ;
                    $("#modal_more").html(modal_more);
                    var href = $("#modal_edit").attr("href") + id;
                    $("#modal_edit").attr("href",href);
                    $('.ui.modal').modal('show');
                }
            },
        })
    })

</script>
</body>

</html>
