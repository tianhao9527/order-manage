<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>用户列表</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link href="${pagecontext.request.getcontextpath}/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${pagecontext.request.getcontextpath}/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${pagecontext.request.getcontextpath}/css/animate.css" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body>
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="index.html" title="返回首页"><i class="fa fa-home"></i></a>欢迎使用H+后台主题</span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong> 项目已处理完结
                                        <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>国民岳父</strong> 这是一条测试信息
                                        <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i>  <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="/user/logout">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>数据表格</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/index/showIndex">主页</a>
                    </li>
                    <li>
                        <strong>用户列表</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>用户列表</h5>
                        </div>
                        <div class="ibox-content">
                            <table class="table table-striped table-bordered table-hover" id="userTable">
                                <c:if test="${userlist!=null}">
                                    <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${userlist}" var="user">
                                        <tr>
                                            <td>${user.userName}</td>
                                            <td><a class="btn btn-primary btn-sm" href="/user/profile">查看</a> <a class="btn btn-primary btn-sm" href="/user/delete/${user.userId}">删除</a> </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </c:if>
                                <c:if test="${userBoList!=null}">
                                    <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>登录IP</th>
                                        <th>sessionId</th>
                                        <th>最后一次登录时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${userBoList}" var="userbo">
                                        <tr>
                                            <td>${userbo.userName}</td>
                                            <td>${userbo.host}</td>
                                            <td>${userbo.sessionId}</td>
                                            <td>${userbo.lastAccessTime}</td>
                                            <td>
                                                <input type="hidden" value="${userbo.sessionId}">
                                                <button id="kickoutBtn" class="btn btn-primary btn-sm">踢出</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </c:if>
                            </table>
                        </div>
                    </div>
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

<script src="${pagecontext.request.getcontextpath}/js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- Data Tables -->
<script src="${pagecontext.request.getcontextpath}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pagecontext.request.getcontextpath}/js/hplus.js?v=2.2.0"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/pace/pace.min.js"></script>

<!-- Page-Level Scripts -->

<%--<script>
    $(document).ready(function() {
        //点击查找
        $("#search").click(function () {
            table.ajax.reload();
        });
        //初始化datatables
        var table = $('#userTable').DataTable({
            "searching": false,
            "serverSide": true,
            "bProcessing": true,
            "bPaginate": true, //翻页功能
            "bLengthChange": true, //改变每页显示数据数量
            "bFilter": true, //过滤功能
            "bSort": false, //排序功能
            "sPaginationType": "full_numbers",
            "fnServerData": function (sSource, aoData, fnCallback) {
                var json = {
                    "page": {
                        "start": aoData[3].value,
                        "length": aoData[4].value,
                    },
                    "search": {
                        "xb": $("#searchTitle").val()
                    }
                };
                $.ajax({
                    "dataType": 'json',
                    "type": "POST",
                    "url": "user/list",
                    "contentType": "application/json; charset=utf-8",
                    "data": JSON.stringify(json),
                    "success": function (data) {
                        data.recordsTotal = data.page.recordsTotal;
                        data.recordsFiltered = data.page.recordsTotal;
                        fnCallback(data);
                    }
                });
            },
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据",
            },
            "aoColumns": [
                {"data": "zy"},
                {"data": "xm"},
                {"data": "xb"},
                {"data": "fov"}
            ]
        });
    });
</script>--%>




</body>
<script type="text/javascript">
    $("#kickoutBtn").click(function () {
        alert(1)
        var $this = $(this);
        var sessionId = $this.prev().val();
        $.post("/user/kickout",{sessionId:sessionId},function (data) {
            if(data.status==200){
                window.location.reload();//刷新当前页面.
            }else{
                alert("踢出失败，请重试")
            }
        })
    });
</script>
</html>
