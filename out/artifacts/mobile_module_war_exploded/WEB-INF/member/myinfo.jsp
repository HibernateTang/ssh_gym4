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
    <title>宝宝信息</title>
    <link rel="stylesheet" href="/css/sm.min.css">
    <link rel="stylesheet" href="/css/gym.css">
    <link rel="icon" href="/images/admin/favicon.ico" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<div class="page-group">
    <div class="page" id="page_myinfo">
        <div class="content">
            <div class="card">
                <div class="card-header no-padding no-border gym-myinfo">
                    <a href="/index" class="gym-banner-left external"><i class="fa fa-angle-double-left fa-3x"></i></a>
                    <div class="gym-banner-title">我的信息</div>
                    <i></i>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="facebook-avatar">
                        <a class="open-avatar" data-popup="popup popup-avatar">
                                <img id="avatar" src="${sessionScope.user.head_src}" onerror="this.src='/images/member/head.png'"/>
                        </a>
                        <div class="gym-myinfo-info">
                            <p class="avatar-name">${childObj['name']}</p>
                            <p class="avatar-detail">年龄：${childObj['age']}</p>
                        </div>
                    </div>
                        <a href="/exist" class="button">退出登录</a>
                </div>

                <div class="card-content">
                    <c:choose>
                        <c:when test="${not empty listContract}">
                            <div class="card-content-inner" id="contract" data-value="0">
                                <div class="list-block gym-list">
                                    <ul>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title" >报名日期：<label id="c_regDate">${listContract[0]['报名日期']}</label></div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title" >有效期：<label id="c_validity">${listContract[0]['有效期']}</label></div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title" >剩余课时数：<label id="c_residuePeriods">${listContract[0]['剩余课时数']}</label>节</div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title" >报名课时数：<label id="c_regPeriods">${listContract[0]['报名课时数']}</label>节</div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title" >累计请假：<label id="c_totalLeave">${listContract[0]['累计请假数']}</label>节</div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title" >报名金额：<label id="c_regSum">${listContract[0]['合同金额']}</label></div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title" >班级：<label id="c_class">${listContract[0]['课程']}</label></div>
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title">赠课：<label id="c_give">${listContract[0]['赠课']}</label></div>
                                            </div>
                                        </li>
                                        <li class="item-content">
                                            <div class="item-inner">
                                                <div class="item-title" >积分：<label id="c_score">${listContract[0]['积分']}</label></div>
                                            </div>
                                            <div class="item-inner">
                                                <a id="view" class="item-title">所有合同&nbsp;<i class="fa fa-angle-double-right"
                                                                             aria-hidden="true"></i></a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card-content-inner">
                                <p class="color-danger text-center">没有找到有效期内的合同~</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Avatar Popup -->
<div class="popup popup-avatar">
    <form id="uploadForm" enctype="multipart/form-data">
        <div class="card facebook-card no-border">
            <div class="card-content">
                <img src="${sessionScope.user.head_src}" id="pre_avatar" class="pre-avatar">
            </div>
        </div>
        <div class="content-block">
            <p><a href="javascript:;" class="button  button-big file"><input type="file" name="file" id="avatarFile"
                                                                             accept="image/jpg,image/png,image/jpeg">更换头像</a></p>
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
        var extensions = ".jpg,.JPG,.jpeg,.JPEG,.png,.PNG";
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
            async: false,
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

    //全局
    var jsonArrayContract = ${listContract};
    $('#view').on('click', function () {
        var selectedContractId = $("#contract").attr("data-value");
        var buttons1 = [
            {
                text: '请选择合同',
                label: true
            }
        ];
        var buttons2 = [
            {
                text: '取消',
                bg: 'danger'
            }
        ];
        var contractName = "";
        var contractIndex = "";

        $.each(jsonArrayContract, function (index, contract) {
            contractName = contract['报名日期']+ '报名合同';
            contractIndex = index;
            var button_json = {
                text: contractName,
                id: contractIndex,
                disabled:selectedContractId == contractIndex,
                onClick: function () {
                    if (!this.disabled) {
                        contract_change(this.id);
                    }
                }
            };
            buttons1.push(button_json);
        })
        var groups = [buttons1, buttons2];
        $.actions(groups);
    });
    function contract_change(index) {
        $("#contract").attr('data-value',index);
        $("#c_regDate").text(jsonArrayContract[index]['报名日期']);
        $("#c_validity").text(jsonArrayContract[index]['有效期']);
        $("#c_residuePeriods").text(jsonArrayContract[index]['剩余课时数']);
        $("#c_regPeriods").text(jsonArrayContract[index]['报名课时数']);
        $("#c_totalLeave").text(jsonArrayContract[index]['累计请假数']);
        $("#c_regSum").text(jsonArrayContract[index]['合同金额']);
        $("#c_class").text(jsonArrayContract[index]['课程']);
        $("#c_give").text(jsonArrayContract[index]['赠课']);
        $("#c_score").text(jsonArrayContract[index]['积分']);
    }

    $.init();
</script>
</body>

</html>