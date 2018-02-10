<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>注册</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description"
          content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link href="${pagecontext.request.getcontextpath}/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/animate.css" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">H+</h1>

        </div>
        <h3>欢迎注册 H+</h3>
        <p>创建一个H+新账户</p>
        <form id="personRegForm" class="m-t" role="form" onsubmit="return false">
            <div class="form-group">
                <input type="text" id="regName" name="userName" class="form-control" placeholder="请输入用户名"
                       required="">
            </div>
            <div class="form-group">
                <input type="password" id="pwd" name="password" class="form-control" placeholder="请输入密码"
                       required="">
            </div>
            <div class="form-group">
                <input type="password" id="pwdRepeat" class="form-control" placeholder="请再次输入密码"
                       required="">
            </div>
            <div class="form-group text-left">
                <div class="checkbox i-checks">
                    <label class="no-padding"> <input type="checkbox"><i></i>
                        我同意注册协议
                    </label>
                </div>
            </div>
            <button type="submit" id="registsubmit" class="btn btn-primary block full-width m-b"
                    onclick="REGISTER.reg();">注
                册
            </button>

            <p class="text-muted text-center">
                <small>已经有账户了？</small>
                <a href="/login">点此登录</a>
            </p>

        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="${pagecontext.request.getcontextpath}/js/jquery-2.1.1.min.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/bootstrap.min.js?v=3.4.0"></script>
<!-- iCheck -->
<script src="${pagecontext.request.getcontextpath}/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>

</body>
<script type="text/javascript">
    var REGISTER = {
        inputcheck: function () {
            //不能为空检查
            if ($("#regName").val() == "") {
                alert("用户名不能为空");
                $("#regName").focus();
                return false;
            }
            if ($("#pwd").val() == "" || $("#pwd").val().length<5) {
                alert("密码不能为空且不能小于5位");
                $("#pwd").focus();
                return false;
            }
            //密码检查
            if ($("#pwd").val() != $("#pwdRepeat").val()) {
                alert("确认密码和密码不一致，请重新输入！");
                $("#pwdRepeat").select();
                $("#pwdRepeat").focus();
                return false;
            }
            return true;
        },
        beforeSubmit: function () {
            //检查用户是否已经被占用
            $.ajax({
                url: "/user/check/" + escape($("#regName").val()) + "?r=" + Math.random(),
                success: function (data) {
                    if (data.data == true) {
                        // 用户名存在
                        alert('用户名已存在');
                    } else {
                        REGISTER.doSubmit();
                    }
                }
            });
        },
        doSubmit: function () {
            $.post("/user/register", $("#personRegForm").serialize(), function (data) {
                if (data.status == 200) {
                    alert('用户注册成功，请登录！');
                    window.location.href = "/login";
                } else {
                    alert(data.msg);
                }
            });
        },
        login: function () {
            window.location.href = "/user/login";
            return false;
        },
        reg: function () {
            if (this.inputcheck()) {
                this.beforeSubmit();
            }
        }
    };
</script>

</html>

