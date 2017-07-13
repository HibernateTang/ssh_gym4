<%--
  Created by IntelliJ IDEA.
  User: 汁
  Date: 2017/4/5
  Time: 20:16
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
    <title>我的优惠券</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/gym.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<div class="page-group">
    <div class="page" id="page_coupon">

        <div class="content">
            <!-- 我的优惠券 -->
            <div class="card">
                <div class="card-content">
                    <div class="card-content-inner">
                        <c:choose>
                            <c:when test="${not empty coupon && coupon.success == true}">
                                <div class="coupon-box">
                                    <c:choose>
                                        <c:when test="${coupon['value']['used']==false}">
                                            <a href="javascript:;" class="coupon" data-value="1"><img
                                                    src="/images/member/coupon_unused.png">
                                            </a>
                                            <span class="fa fa-question-circle fa-2x coupon-rule  open-popup"
                                                  data-popup=".popup-coupon-rule"></span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:;" class="coupon" data-value="0"><img
                                                    src="/images/member/coupon_used.png"> <span
                                                    class="fa fa-question-circle fa-2x coupon-rule open-popup"
                                                    data-popup=".popup-coupon-rule"></span> </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <div class="no-coupon text-center">
                                    <img src="/images/member/no_coupon.png"/>
                                    <p>您目前没有优惠券可用</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="popup popup-coupon-rule">

    <div class="content">
        <h1 class="title">活动规则</h1>
        <div class="content-block">
            <p>1、获得优惠券之日起，有限期为一年，用于会员本人续报课程</p>
            <p>2、此券不与其他优惠共享</p>
            <p>3、不支持兑换现金</p>
            <p><a href="javascript:;" class="close-popup">关闭</a></p>
        </div>
    </div>
</div>
<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
<script>
    $(".coupon").on('click', function () {
        if ($(this).attr("data-value") == "0") {
            return;
        }
        $.prompt('请输入核销码', function (value) {
                    if ($.trim(value) == "") {
                        $.alert("核销码值不能为空");
                        return;
                    }
                    ajax_useCoupon(value);
                }
        );
    })

    function ajax_useCoupon(code) {
        this.code = code;

        $.ajax({
            url: '/coupon/use',
            type: 'POST',
            data: {'code': this.code},
//            async: false,
            contentType: "application/x-www-form-urlencoded",
            dataType: "json",
            beforeSend: function () {
                $.showIndicator();
            },
            success: function (data) {
                if (data.success == true) {
                    $.toast("使用成功√");
                    location.reload();
                } else if (data.success == false) {
                    $.alert("使用失败," + data.message);
                }
            },
            complete: function () {
                $.hideIndicator();
            },
            error: function (data) {
                $.alert("异常错误,稍后再试");
            }
        });
    }
    $.init();
</script>
</body>

</html>