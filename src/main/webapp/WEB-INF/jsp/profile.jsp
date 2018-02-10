<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>个人资料</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link href="${pagecontext.request.getcontextpath}/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/animate.css" rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body>
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="profile.html#"><i
                            class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="/index/showIndex" title="返回首页"><i
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
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>个人资料</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/index/showIndex">主页</a>
                    </li>
                    <li>
                        <a>页面</a>
                    </li>
                    <li>
                        <strong>个人资料</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <div class="wrapper wrapper-content">
            <div class="row animated fadeInRight">
                <div class="col-md-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>个人资料</h5>
                        </div>
                        <div>
                            <div class="ibox-content no-padding border-left-right">
                                <img alt="image" class="img-responsive" src="img/profile_big.jpg">
                            </div>
                            <div class="ibox-content profile-content">
                                <h4><strong>Beaut-zihan</strong></h4>
                                <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                                <h5>
                                    关于我
                                </h5>
                                <p>
                                    会点前端技术，div+css啊，jQuery之类的，不是很精；热爱生活，热爱互联网，热爱新技术；有一个小的团队，在不断的寻求新的突破。
                                </p>
                                <div class="row m-t-lg">
                                    <div class="col-md-4">
                                        <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                        <h5><strong>169</strong> 文章</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                        <h5><strong>28</strong> 关注</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <span class="bar">5,3,2,-1,-3,-2,2,3,5,2</span>
                                        <h5><strong>240</strong> 关注者</h5>
                                    </div>
                                </div>
                                <div class="user-button">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <button type="button" class="btn btn-primary btn-sm btn-block"><i
                                                    class="fa fa-envelope"></i> 发送消息
                                            </button>
                                        </div>
                                        <div class="col-md-6">
                                            <button type="button" class="btn btn-default btn-sm btn-block"><i
                                                    class="fa fa-coffee"></i> 赞助
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>最新动态</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="profile.html#">选项1</a>
                                    </li>
                                    <li><a href="profile.html#">选项2</a>
                                    </li>
                                </ul>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">

                            <div>
                                <div class="feed-activity-list">

                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a1.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">1天前</small>
                                            <strong>奔波儿灞</strong> 关注了 <strong>灞波儿奔</strong>.
                                            <br>
                                            <small class="text-muted">54分钟前 来自 皮皮时光机</small>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a class="btn btn-xs btn-danger"><i class="fa fa-heart"></i> 收藏</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/profile.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">5分钟前</small>
                                            <strong>作家崔成浩</strong> 发布了一篇文章
                                            <br>
                                            <small class="text-muted">今天 10:20 来自 iPhone 6 Plus</small>

                                        </div>
                                    </div>

                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a2.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">2小时前</small>
                                            <strong>作家崔成浩</strong> 抽奖中了20万
                                            <br>
                                            <small class="text-muted">今天 09:27 来自 Koryolink iPhone</small>
                                            <div class="well">
                                                抽奖，人民币2000元，从转发这个微博的粉丝中抽取一人。11月16日平台开奖。随手一转，万一中了呢？
                                            </div>
                                            <div class="pull-right">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                                <a class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i> 评论</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a3.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">2天前</small>
                                            <strong>天猫</strong> 上传了2张图片
                                            <br>
                                            <small class="text-muted">11月7日 11:56 来自 微博 weibo.com</small>
                                            <div class="photos">
                                                <a target="_blank"
                                                   href="http://24.media.tumblr.com/20a9c501846f50c1271210639987000f/tumblr_n4vje69pJm1st5lhmo1_1280.jpg">
                                                    <img alt="image" class="feed-photo" src="img/p1.jpg">
                                                </a>
                                                <a target="_blank"
                                                   href="http://37.media.tumblr.com/9afe602b3e624aff6681b0b51f5a062b/tumblr_n4ef69szs71st5lhmo1_1280.jpg">
                                                    <img alt="image" class="feed-photo" src="img/p3.jpg">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">5小时前</small>
                                            <strong>在水一方Y</strong> 关注了 <strong>那二十年的单身</strong>.
                                            <br>
                                            <small class="text-muted">今天 10:39 来自 iPhone客户端</small>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> 显示更多
                                </button>

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

<!-- Mainly scripts -->
<script src="${pagecontext.request.getcontextpath}/js/jquery-2.1.1.min.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${pagecontext.request.getcontextpath}/s/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pagecontext.request.getcontextpath}/js/hplus.js?v=2.2.0"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/pace/pace.min.js"></script>

<!-- Peity -->
<script src="${pagecontext.request.getcontextpath}/js/plugins/peity/jquery.peity.min.js"></script>

<!-- Peity -->
<script src="${pagecontext.request.getcontextpath}/js/demo/peity-demo.js"></script>

<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script><!--统计代码，可删除-->

</body>

</html>
