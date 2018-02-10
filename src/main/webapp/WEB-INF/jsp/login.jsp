<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description"
          content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link href="${pagecontext.request.getcontextpath}/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <link href="${pagecontext.request.getcontextpath}/css/animate.css" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">H+</h1>
        </div>
        <h3>欢迎使用 H+</h3>

        <form id="formlogin" class="m-t" role="form" method="post"
              onsubmit="return false;">
            <div class="form-group">
                <input type="text" class="form-control" id="loginname"
                       name="userName" placeholder="用户名" required="true">
            </div>
            <div class="form-group">
                <input type="password" id="nloginpwd" class="form-control"
                       name="password" placeholder="密码" required="true">
            </div>
            <button id="loginsubmit"
                    class="btn btn-primary block full-width m-b">登录
            </button>
            <p class="text-muted text-center">
                <a href="/user/login">
                    <small>忘记密码了？</small>
                </a> | <a href="/user/registerpage">注册一个新账号</a>
            </p>
        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="${pagecontext.request.getcontextpath}/js/jquery-2.1.1.min.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/bootstrap.min.js?v=3.4.0"></script>

<script type="text/javascript"
        src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

</body>
<script type="text/javascript">
    var LOGIN = {
        checkInput: function () {
            if ($("#loginname").val() == "") {
                alert("用户名不能为空");
                $("#loginname").focus();
                return false;
            }
            if ($("#nloginpwd").val() == "") {
                alert("密码不能为空");
                $("#nloginpwd").focus();
                return false;
            }
            return true;
        },
        doLogin: function () {
            $.post("/user/login", $("#formlogin").serialize(), function (data) {
                if (data.status == 200) {
                    // alert(1)
                    location.href = "<%=request.getContextPath()%>/index/showIndex";
                } else {
                    alert("登录失败，原因是：" + data.msg);
                    $("#loginname").select();
                }
            });
        },
        login: function () {
            if (this.checkInput()) {
                this.doLogin();
            }
        }
    };
    $(function () {
        $("#loginsubmit").click(function () {
            LOGIN.login();
        });
    });
</script>

</html>
