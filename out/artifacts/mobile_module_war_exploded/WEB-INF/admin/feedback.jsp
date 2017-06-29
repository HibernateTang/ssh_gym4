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
                <div class="active section">反馈</div>
            </div>
        </div>
    </div>
    <div class="ui container">
        <div class="ui segments">
            <div class="ui segment">
                <div class="ui two column stackable grid">
                    <div class="column right aligned">
                        <a href="" class="ui primary button">查询</a>
                    </div>
                </div>
            </div>
            <div class="ui segment right aligned">
                <div class="ui buttons">
                    <a href="/admin?page=${page.current-1}"
                       class="ui <c:if test="${page.current<= 1}">disabled</c:if> left labeled icon button"><i
                            class="left arrow icon"></i> 上一页 </a>
                    <a class="ui blue active button"></i> ${page.current}</a>
                    <a href="/admin?page=${page.current+1}"
                       class="ui <c:if test="${page.current+1> page.total}">disabled</c:if> right labeled icon button"><i
                            class="right arrow icon"></i> 下一页 </a>
                </div>
            </div>
            <div class="ui segment">
                <c:if test="${not empty page.list}">
                    <div class="ui ordered list">
                        <c:forEach items="${page.list}" var="feedback">
                            <div class="item">
                                <div class="content">
                                    <a href="javascript:;" data-id="${feedback.id}" class="item feedback-details">
                                        <c:choose>
                                            <c:when test="${feedback.details==''}">无</c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${fn:length(feedback.details) > 40}">
                                                        <c:out value="${fn:substring(feedback.details, 0, 40)}……"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="${feedback.details}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                    <div class="ui green horizontal label">${feedback.franchisee}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- modal -->
<div class="ui modal">
    <i class="close icon"></i>
    <div class="header">
        反馈详情
    </div>
    <div class="image content">
        <div class="description">
            <div class="ui header"></div>
            <p></p>
            <p></p>
        </div>
    </div>
    <div class="actions">
        <div class="ui black deny button">
            Nope
        </div>
        <div class="ui positive right labeled icon button">
            Yep, that's me
            <i class="checkmark icon"></i>
        </div>
    </div>
</div>
<script type='text/javascript' src='/js/jquery-1.11.3.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/ui/semantic/semantic.min.js' charset='utf-8'></script>
<script>
    $("#menu").on('click', function () {
        $(".ui.sidebar").sidebar('toggle');
    })

    $(".feedback-details").on('click',function () {
        var that = $(this);
        var id = that.data('id');
        $('.ui.modal').modal('show');
    })

    function inFeedback(id){
        $.ajax({
            type:'POST',
            url:'/admin/feedbackView',
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
    }
</script>
</body>

</html>
