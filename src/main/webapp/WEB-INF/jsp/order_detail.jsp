<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>项目详情</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description"
          content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link
            href="${pagecontext.request.getcontextpath}/css/bootstrap.min.css?v=3.4.0"
            rel="stylesheet">
    <link
            href="${pagecontext.request.getcontextpath}/font-awesome/css/font-awesome.css?v=4.3.0"
            rel="stylesheet">

    <link href="${pagecontext.request.getcontextpath}/css/animate.css"
          rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/style.css?v=2.2.0"
          rel="stylesheet">
    <style type="text/css">
        input, textarea {
            border: none;
            outline: none;
        }

        .border {
            border: 2px solid #CCFFFF;
        }
    </style>
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
                <h2>项目详情</h2>
                <ol class="breadcrumb">
                    <li><a href="/index/showIndex">主页</a></li>
                    <li><strong>项目详情</strong></li>
                </ol>
            </div>
        </div>
        <form method="post" id="itemForm">
            <div class="row">
                <div class="col-lg-9">
                    <div class="wrapper wrapper-content animated fadeInUp">
                        <div class="ibox">
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="m-b-md">
                                            <input type="text" name="orderName" readonly="readonly" size="32px"
                                                   style="font-size: 32px" value="${result.orderName }"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <input type="hidden" name="orderId" value="${result.orderId }">
                                        <input type="hidden" name="orderType" value="${result.orderType }">
                                        <div class="dl-horizontal">
                                            <dt>支入/支出：</dt>
                                            <input type="text" name="money" readonly="readonly"
                                                   value="${result.money/100 }"/>
                                            <dt>详情：</dt>
                                            <textarea rows="3" name="orderDesc" cols="30" readonly="readonly"
                                                      style=" resize: none; ">${result.orderDesc}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-7" id="cluster_info">
                                        <dl class="dl-horizontal">
                                            <shiro:hasRole name="admin">
                                                <dt>用户：</dt>
                                                <dd>${result.username }</dd>
                                            </shiro:hasRole>
                                            <%--<c:if test="${result.username != null}">
                                                <dt>用户：</dt>
                                                <dd>${result.username }</dd>
                                            </c:if>--%>
                                            <dt>创建于：</dt>
                                            <dd>${result.createtime }</dd>
                                            <dt>最后一次修改于：</dt>
                                            <dd>${result.updatetime }</dd>
                                        </dl>
                                    </div>
                                    <shiro:hasRole name="user">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="m-b-md">
                                                <a href="javascript:" id="save"
                                                   class="btn btn-white btn-xs pull-right">保存</a>
                                                <a href="javascript:" id="edit"
                                                   class="btn btn-white btn-xs pull-right">编辑账单</a>
                                                <a href="javascript:" id="del"
                                                   class="btn btn-white btn-xs pull-right">删除</a>
                                            </div>
                                        </div>
                                    </div>
                                    </shiro:hasRole>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- Mainly scripts -->
    <script
            src="${pagecontext.request.getcontextpath}/js/jquery-2.1.1.min.js"></script>
    <script
            src="${pagecontext.request.getcontextpath}/js/bootstrap.min.js?v=3.4.0"></script>
    <script
            src="${pagecontext.request.getcontextpath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script
            src="${pagecontext.request.getcontextpath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script
            src="${pagecontext.request.getcontextpath}/js/hplus.js?v=2.2.0"></script>
    <script
            src="${pagecontext.request.getcontextpath}/js/plugins/pace/pace.min.js"></script>

    <script>
        $(document).ready(function () {

            $('#loading-example-btn').click(function () {
                btn = $(this);
                simpleLoad(btn, true)

                // Ajax example
                //                $.ajax().always(function () {
                //                    simpleLoad($(this), false)
                //                });

                simpleLoad(btn, false)
            });
        });

        function simpleLoad(btn, state) {
            if (state) {
                btn.children().addClass('fa-spin');
                btn.contents().last().replaceWith(" Loading");
            } else {
                setTimeout(function () {
                    btn.children().removeClass('fa-spin');
                    btn.contents().last().replaceWith(" Refresh");
                }, 2000);
            }
        }
    </script>

</body>
<script type="text/javascript">
    $(function () {
        $("#edit").click(function () {
            $("input,textarea").addClass("border");
            $("input,textarea").removeAttr("readonly");
        });
        $("#save").click(function () {
            $.post("/order/edit", $("#itemForm").serialize(), function (data) {
                if (data.status == 200) {
                    alert('修改成功!');
                    $("input,textarea").attr("readonly",true);
                    $("input,textarea").removeClass("border");
                } else {
                    alert('修改失败!');
                }
            })
        });
        $("#del").click(function () {
            $.post("/order/delete", $("#itemForm").serialize(), function (data) {
                if (data.status == 200) {
                    alert('删除成功!');
                     window.location.href = "/index/category/" + data.msg + "";
                } else {
                    alert('删除失败!');
                }
            })
        });
    })
</script>
</html>