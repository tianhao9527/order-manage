<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>数据表格</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

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
    <script src="${pagecontext.request.getcontextpath}/js/hplus.js?v=2.2.0"></script>
    <script
            src="${pagecontext.request.getcontextpath}/js/plugins/pace/pace.min.js"></script>

    <script src="${pagecontext.request.getcontextpath}/js/bootstrap-paginator.js"></script>

    <!-- jQuery Validation plugin javascript-->
    <script src="${pagecontext.request.getcontextpath}/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pagecontext.request.getcontextpath}/js/plugins/form/jquery-form.js"></script>
    <script src="${pagecontext.request.getcontextpath}/js/plugins/validate/messages_zh.min.js"></script>
</head>

<body>
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="index.html" title="返回首页"><i
                                class="fa fa-home"></i></a>欢迎使用H+后台主题</span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
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
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
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
        <div class="ibox ">
            <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content animated bounceInRight">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                            </button>
                            <i class="fa fa-laptop modal-icon"></i>
                            <h5 class="modal-title">添加账单分类</h5>
                        </div>
                        <form method="post" id="addForm">
                            <div class="modal-body">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">账单类型：</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="categoryType">
                                                <option value="1">收入</option>
                                                <option value="2">支出</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-3 control-label">账单分类名称：</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="name" name="categoryName" required aria-required="true"
                                                   class="form-control" placeholder="请输入账单分类名称">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer ">
                                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                <input type="submit" id="addBtn" class="btn btn-primary" value="保存"></input>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>数据表格</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/index/showIndex">主页</a>
                    </li>
                    <li>
                        <strong>账单类型</strong>
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
                            <h5>账单类型</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#myModal">
                                    添加
                                </button>
                                <%--<a id="addRow" href="javascript:void(0);" class="btn btn-primary ">添加</a>--%>
                            </div>
                            <table class="table table-striped table-bordered table-hover " id="editable">
                                <form id="categoryForm" method="post">
                                    <thead>
                                    <tr>
                                        <th>账单分类</th>
                                        <th>类型名称</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="example">

                                    <c:forEach items="${list}" var="category" varStatus="status">
                                        <tr>
                                            <td>
                                                <c:if test="${category.categoryType==1}">
                                                    收入
                                                </c:if>
                                                <c:if test="${category.categoryType==2}">
                                                    支出
                                                </c:if>
                                            </td>
                                            <td id="editTd${category.id}" contentEditable="true">${category.categoryName}</td>
                                            <input type="hidden" id="hidName" name="categoryName"
                                                   value="${category.categoryName}">
                                            <input type="hidden" id="categoryId" name="id" value="${category.id}">
                                            <td>
                                                    <%--<button class="btn btn-primary" id="editBtn">修改</button>--%>
                                                <button class="btn btn-primary" myAttr="none" >删除</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </form>
                            </table>
                        </div>
                        <div class="text-center">
                            <div class="pagination" id="page"></div>
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


<script type='text/javascript'>
    //根据第一次传递进来的值初始化分页插件
    var options = {
        currentPage: ${page.pageNow},
        totalPages: ${page.totalPageCount},
        numberOfPages: 5,
        itemTexts: function (type, page, current) {
            switch (type) {
                case "first":
                    return "首页";
                case "prev":
                    return "上一页";
                case "next":
                    return "下一页";
                case "last":
                    return "末页";
                case "page":
                    return page;
            }
        },
        //事件响应
        onPageClicked: function (event, originalEvent, type, page) {
            //异步访问数据
            $.ajax({
                url: "<%=request.getContextPath()%>/category/management?pn=" + page,
                type: "post",
                date: "",
                success: function (data1) {
                    $("#example").empty();
                    page = data1.page;
                    list = data1.list;
                    if (list != null) {
                        $.each(list, function (index, category) {
                            var html = '<tr class="gradeX">' +
                                '<td>' + category.categoryType + '<td/>' +
                                '<td>' + category.categoryName + '<td/>' +
                                '</tr>';
                            $("#example").append(html);
                        });
                    } else {
                        $("example").append('没有找到相应数据');
                    }
                }
            });
        }
    }
    //初始化分页插件
    $('#page').bootstrapPaginator(options);
</script>
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

    $().ready(function () {
        $("#addForm").validate({
            rules: {
                name: {
                    required: true
                }
            },
            messages: {
                name: {
                    required: "请输入您要添加的分类名称"
                }
            },
            submitHandler:function(form){
                $.ajax({
                    url : "/category/add",
                    type : "post",
                    dataType : "json",
                    data: $("#addForm").serialize(),
                    success : function(data) {
                        $('#myModal').modal('hide');
                        //要执行的代码
                        if(data.status==200){
                            alert("添加成功");
                            window.location.href="<%=request.getContextPath()%>/category/management?pn=1"
                        }else{
                            alert(data.msg);
                        }
                    }
                });
            },
            invalidHandler: function(form, validator) {return false;}
        });

        $("[contentEditable]").blur(function () {
            var $this = $(this);
            var categoryName = $this.html();
            // 旧名
            var _categoryName = $this.next().val();
            var id = $this.next().next().val();

            if (categoryName == _categoryName) {
                return false;
            } else {
                $.post("/category/update", {id: id, categoryName: categoryName}, function (data) {
                    if (data.status != 200) {
                        alert("修改失败，请重试")
                    }
                });
            }
        });
        $("[myAttr]").click(function () {
            var $this = $(this);
            var id = $this.parent().prev().val();
            $.post("/category/delete",{id:id},function (data) {
                if(data.status==200){
                    window.location.href="<%=request.getContextPath()%>/category/management"
                    alert("删除成功");
                }else{
                    alert(data.msg);
                }
            })
        });
    });
</script>
</body>

</html>
