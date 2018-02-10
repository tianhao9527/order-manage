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
                    <c:if test="${category.name =='' || category.name==null }">
                        <li><strong>所有账单</strong></li>
                    </c:if>
                    <c:if test="${category.name!='' && category.name!=null} ">
                        <li><strong>${category.name}</strong></li>
                    </c:if>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>所有类型</h5>
                            <div class="ibox-tools">
                                <a href="/project/addCategory" class="btn btn-primary btn-xs">创建新项目</a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row m-b-sm m-t-sm">
                                <div class="col-md-1">
                                    <button type="button" id="loading-example-btn"
                                            class="btn btn-white btn-sm">
                                        <i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </div>
                                <form id="searchForm" method="post" action="/project/search">
                                    <div class="col-md-11">
                                        <div class="input-group">
                                            <input type="text" name="name" placeholder="请输入项目名称"
                                                   class="input-sm form-control"> <span
                                                class="input-group-btn">
												<input type="submit" class="btn btn-sm btn-primary" value="搜索">
											</span>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="project-list">

                                <table class="table table-hover">
                                    <tbody>
                                    <c:forEach items="${result}" var="category">
                                        <tr>
                                            <td class="project-title"><a href="#">${category.name }</a>
                                                <br/>
                                            <td class="project-actions">
                                                <a href="/category/${category.id }" class="btn btn-white btn-sm"><i
                                                        class="fa fa-pencil"></i> 编辑 </a>
                                                <a href="/category/delete/${category.id }" class="btn btn-white btn-sm"><i
                                                        class="fa fa-pencil"></i> 删除 </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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

<!-- Custom and plugin javascript -->
<script src="${pagecontext.request.getcontextpath}/js/hplus.js?v=2.2.0"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/pace/pace.min.js"></script>

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

<script type="text/javascript"
        src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

</body>
<script type="text/javascript">
    /* $(function(){
       $("#searchBtn").click(function(){
           $.post("/project/search",$("#searchForm").serialize(),function(data){

           });
       });
   });  */
</script>
</html>
