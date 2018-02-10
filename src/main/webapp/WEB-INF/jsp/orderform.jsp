<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>项目</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description"
          content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link href="${pagecontext.request.getcontextpath}/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <link href="${pagecontext.request.getcontextpath}/css/animate.css" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body>
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation"
                 style="margin-bottom: 0">
                <ul class="nav navbar-top-links navbar-right">
                    <li><span class="m-r-sm text-muted welcome-message"><a
                            href="/index/showIndex" title="返回首页"><i class="fa fa-home"></i></a>欢迎使用H+后台主题</span>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle count-info"
                                            data-toggle="dropdown" href="index.html#"> <i
                            class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                    </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left"> <img alt="image"
                                                                                   class="img-circle" src="img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong>
                                        项目已处理完结 <br>
                                        <small class="text-muted">3天前
                                            2014.11.8
                                        </small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left"> <img alt="image"
                                                                                   class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>国民岳父</strong>
                                        这是一条测试信息 <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html"> <i class="fa fa-envelope"></i> <strong>
                                        查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle count-info"
                                            data-toggle="dropdown" href="index.html#"> <i
                            class="fa fa-bell"></i> <span class="label label-primary">8</span>
                    </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li><a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息 <span
                                        class="pull-right text-muted small">4分钟前</span>
                                </div>
                            </a></li>
                            <li class="divider"></li>
                            <li><a href="profile.html">
                                <div>
                                    <i class="fa fa-qq fa-fw"></i> 3条新回复 <span
                                        class="pull-right text-muted small">12分钟钱</span>
                                </div>
                            </a></li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html"> <strong>查看所有 </strong> <i
                                            class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>


                    <li><a href="/user/logout"> <i class="fa fa-sign-out"></i>
                        退出
                    </a></li>
                </ul>

            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>项目</h2>
                <ol class="breadcrumb">
                    <li><a href="/index/showIndex">主页</a></li>
                    <li><strong>${category.categoryName}</strong></li>
                </ol>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5 align="center">添加账单</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" id="orderForm" method="post">
                        <p>欢迎登录本站(⊙o⊙)</p>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">账单名称：</label>
                            <div class="col-lg-8">
                                <input type="text" id="orderName" name="orderName" placeholder="账单名称"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">账单分类：</label>
                            <div class="col-lg-8">
                                <input type="text" placeholder="账单分类" class="form-control"
                                       disabled="disabled" value="${category.categoryName }">
                                <input type="hidden" name="orderType" value="${category.id }">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">账单金额：</label>
                            <div class="col-lg-8">
                                <input type="text" id="_money" name="_money" placeholder="账单金额"
                                       class="form-control">
                                <input type="hidden" name="money" id="money">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">账单详情：</label>

                            <div class="col-lg-8">
                                <textarea rows="2" cols="30" name="orderDesc" placeholder="账单详情"
                                          class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-3 col-lg-8">
                                <input type="submit" id="submitBtn" class="btn btn-primary pull-right" value="提 交"></input>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
                By：<a href="http://www.zi-han.net" target="_blank">zihan's blog</a>
            </div>
            <div>
                <strong>Copyright</strong> H+ &copy; 2014
            </div>
        </div>

    </div>
</div>
</div>

<!-- Mainly scripts -->
<script src="${pagecontext.request.getcontextpath}/js/jquery-2.1.1.min.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pagecontext.request.getcontextpath}/js/hplus.js?v=2.2.0"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/pace/pace.min.js"></script>

<!-- jQuery Validation plugin javascript-->
<script src="${pagecontext.request.getcontextpath}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/form/jquery-form.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/validate/messages_zh.min.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/myjs/num_validate.js"></script>


</body>


<script>
    //以下为修改jQuery Validation插件兼容Bootstrap的方法，没有直接写在插件中是为了便于插件升级
    $.validator.setDefaults({
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            element.closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorElement: "span",
        errorClass: "help-block m-b-none",
        validClass: "help-block m-b-none"
    });


    //以下为官方示例
    $().ready(function () {
        $("#orderForm").validate({
            rules: {
                orderName: {
                    required: true
                },
                _money: {
                    required: true,
                    number: true,     //输入必须是数字
                    min: 0.01,          //输入的数字最小值为0.01，不能为0或者负数
                    minNumber: $("#_money").val()    //调用自定义验证
                }
            },
            messages: {
                orderName: {
                    required: "请输入账单名称"
                },
                _money: {
                    required: "请输入账单金额",
                    number: "请正确输入金额",
                    min: "输入最小金额为0.01",
                    length: "输入数字最多小数点后两位"
                }
            },
            submitHandler: function (form) {

                var m = $("#money").val($("#_money").val()*100)
                $.post("/order/save", $("#orderForm").serialize(), function (data) {
                    if (data.status == 200) {
                        alert('添加账单成功!');
                        window.location.href = "/index/category/${category.id }";
                    } else {
                        alert('添加账单失败!');
                    }
                });
            },
            invalidHandler: function (form, validator) {
                return false;
            }
        });
    });
</script>


</html>
