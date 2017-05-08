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
    <title>我的信息</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/gym.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<div class="page-group">
    <div class="page">
        <div class="content">
            <div class="card">
                <div class="card-content gym-myinfo">
                    <a href="/index" class="myinfo-row " external><i class="fa fa-angle-double-left fa-3x"></i></a>
                    <div class="gym-myinfo-title">我的信息</div>
                </div>
            </div>

            <div class="card facebook-card">
                <div class="card-header">
                    <div class="facebook-avatar">
                        <a class="open-avatar" data-popup="popup popup-avatar">
                            <div class="header-img">
                                <img id="avatar"
                                        <c:choose>
                                            <c:when test="${sessionScope.user.head_src!=''}">
                                                src="${sessionScope.user.head_src}"
                                            </c:when>
                                            <c:otherwise>
                                                src="/images/member/head.jpg"
                                            </c:otherwise>
                                        </c:choose>
                                />
                            </div>
                        </a>
                    </div>
                    <div>
                        <div class="facebook-title">${childObj['name']}</div>
                        <div class="facebook-text">年龄：${childObj['age']}</div>
                    </div>

                </div>

                <div class="card-content">

                    <c:choose>
                        <c:when test="${not empty infoObj}">
                            <div class="card-conntent-inner">
                                <div class="list-block gym-list">
                                    <ul>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title">报名日期：${infoObj['报名日期']}</div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title">有效期：${infoObj['有效期']}</div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title">剩余课时数：${infoObj['剩余课时数']}节</div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title">报名课时数：${infoObj['报名课时数	']}节</div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title">累计请假：${infoObj['累计请假数']}节</div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title">报名金额：${infoObj['合同金额']}</div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title">班级：${infoObj['课程']}</div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title">赠课：${infoObj['赠课']}</div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title">积分：${infoObj['积分']}</div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title">所有合同<i class="fa fa-angle-double-right"
                                                                               aria-hidden="true"></i></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card-conntent-inner text-center">
                                <h3>没有合同信息！</h3>
                                <br/>
                                <br/>
                                <br/>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="card" id="activity">
                <div class="card-header no-border gym-card-title"><i></i>上海环球中心本月通知<i></i></div>
                <div class="card-content">
                    <img src="/images/member/inform.jpg" width="100%"></div>
            </div>
        </div>
    </div>
</div>


<!-- About Popup -->
<div class="popup popup-avatar">
    <form id="uploadForm" enctype="multipart/form-data">
        <div class="card facebook-card no-border">
            <div class="card-content">
                <img src="${sessionScope.user.head_src}" id="pre_avatar" class="pre-avatar">
            </div>
        </div>
        <div class="content-block">
            <p><a href="javascript:;" class="button  button-big file"><input type="file" name="file" id="avatarFile"
                                                                             accept="image/*">更换头像</a></p>
            <p><a href="javascript:;" class="button  button-big" id="updateAvatar">确定</a></p>
            <p><a href="javascript:;" class="button  button-danger button-big close-popup" id="cancelUpdate">取消</a></p>
        </div>
    </form>
</div>


<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>

<script>

    $(".open-avatar").on('click', function () {
        $.popup('.popup-avatar');

    });
    $("#cancelUpdate").on('click', function () {
        $("#pre_avatar").attr("src", $("#avatar").attr("src"));
        $("#avatarFile").val("");
    })
    $("#updateAvatar").on('click', function () {
        upload_ajax();
    })
    $("#avatarFile").on('change', function () {
        var objUrl = getObjectURL($("#avatarFile")[0].files[0]);
        if (objUrl) {
            $("#pre_avatar").attr("src", objUrl);
        }
    });

    function upload_ajax() {
        var uploadFile = $("#avatarFile");
        if (uploadFile.val() == "") {
            $.closeModal(".popup-avatar");
            return false;
        }
        var fileExtension = uploadFile.val().substring(uploadFile.val().lastIndexOf("."), uploadFile.val().length);
        var extensions = ".jpg,.JPG,.jpeg,.JPEG,.gif,.GIF,.png,.PNG";
        if (extensions.indexOf(fileExtension) < 0) {
            $.alert("请选择正确的图片格式!");
            return false;
        }
        var formData = new FormData();
        formData.append('file', uploadFile[0].files[0]);
        var imageSize = uploadFile[0].files[0].size;

        if (imageSize > 1024 * 1024 * 3) {
            $.alert("图片大于3M,请重新选择！")
            return;
        }
        $.ajax({
            url: '/index/upload',
            type: 'POST',
            data: formData,
//            async: false,
//            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function () {
                $.showIndicator();
            },
            success: function (data) {
                if (data.success == true) {
                    $.toast("上传成功");
                    location.reload();
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


    //获得文件的网络路径
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }

    $("#activity").on('click', function () {
        location.href = "/activity";
    })
    $.init();
</script>
</body>

</html>