<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>首页</title>

    <link
            href="${pagecontext.request.getcontextpath}/css/bootstrap.min.css?v=3.4.0"
            rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/animate.css"
          rel="stylesheet">
    <link href="${pagecontext.request.getcontextpath}/css/style.css?v=2.2.0"
          rel="stylesheet">

</head>

<body class="top-navigation">

<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom white-bg">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button aria-controls="navbar" aria-expanded="false"
                            data-target="#navbar" data-toggle="collapse"
                            class="navbar-toggle collapsed" type="button">
                        <i class="fa fa-reorder"></i>
                    </button>
                    <a href="index_4.html#" class="navbar-brand">Hplus</a>
                </div>
                <div class="navbar-collapse collapse" id="navbar">
                    <ul class="nav navbar-nav">
                        <c:forEach items="${menus}" var="menu">
                            <c:if test="${menu.menuName=='收入' || menu.menuName=='支出' || menu.menuName=='其他类型'}">
                                <shiro:hasRole name="user">
                                    <li class="dropdown">
                                        <a aria-expanded="false" role="button" id="${menu.menuId }"
                                           onclick="getCategory('${menu.menuName}',${menu.menuId})"
                                           class="dropdown-toggle" data-toggle="dropdown"> ${menu.menuName }
                                            <span class="caret"></span>
                                        </a>
                                        <ul role="menu" class="dropdown-menu"></ul>
                                    </li>
                                </shiro:hasRole>
                            </c:if>
                            <c:if test="${menu.menuName!='收入' && menu.menuName!='支出' && menu.menuName!='其他类型'}">
                                <li class="dropdown">
                                    <a aria-expanded="false" role="button" id="${menu.menuId }"
                                       onclick="getCategory('${menu.menuName}',${menu.menuId})" class="dropdown-toggle"
                                       data-toggle="dropdown"> ${menu.menuName }
                                        <span class="caret"></span>
                                    </a>
                                    <ul role="menu" class="dropdown-menu"></ul>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="wrapper wrapper-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>饼状图</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="echarts" id="echarts-pie-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>折线图</h5>
                                <form action="/index/weather" method="post">
                                    <div class="pull-right">
                                        请输入城市名称：<input type="text">
                                        <input type="submit" value="确定">
                                    </div>
                                </form>
                            </div>
                            <div class="ibox-content">
                                <div class="echarts" id="echarts-line-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div>
                                    <h3 class="font-bold no-margins">半年收入利润率</h3>
                                </div>
                                <div class="m-t-sm">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div>
                                                <canvas id="lineChart" height="180"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-t-md">
                                    <small class="pull-right"><i class="fa fa-clock-o">
                                    </i> 2015.02.30更新
                                    </small>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>月收入</h5>
                                <div class="ibox-tools">
                                    <span class="label label-primary">2015.02 更新</span>
                                </div>
                            </div>
                            <div class="ibox-content no-padding">
                                <div class="flot-chart m-t-lg" style="height: 50px;">
                                    <div class="flot-chart-content" id="flot-chart1"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>月支出</h5>
                                <div class="ibox-tools">
                                    <span class="label label-primary">2015.02 更新</span>
                                </div>
                            </div>
                            <div class="ibox-content no-padding">
                                <div class="flot-chart m-t-lg" style="height: 50px;">
                                    <div class="flot-chart-content" id="flot-chart1"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>账单预览</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                    <form id="searchOrderForm" action="/order/search" method="post">
                                        <div class="col-sm-3 pull-right">
                                            <div class="input-group">
                                                <input type="text" placeholder="搜索" name="orderName"
                                                       class="input-sm form-control">
                                                <span class="input-group-btn">
													<input type="submit" class="btn btn-sm btn-primary">搜索
                                                    <!-- 													<button type="button" id="searchBtn" class="btn btn-sm btn-primary">搜索</button> -->
												</span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>账单</th>
                                            <th></th>
                                            <shiro:hasRole name="admin">
                                                <th>用户</th>
                                            </shiro:hasRole>
                                            <%--<c:if test="${orders[0].username != null }">
                                                <th>用户</th>
                                            </c:if>--%>
                                            <th></th>
                                            <th>账单时间</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${orders}" var="order" begin="0" end="4">
                                            <tr>
                                                <td>${order.orderName}</td>
                                                <td></td>
                                                <shiro:hasRole name="admin">
                                                    <th>${order.username }</th>
                                                </shiro:hasRole>
                                                    <%-- <c:if test="${order.username != null }">
                                                         <th>${order.username }</th>
                                                     </c:if>--%>
                                                <td></td>
                                                <td>${order.createtime}</td>
                                                <td><a href="/order/order_detail/${order.orderId}">查看详情</a></td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    <a href="/order/search" class="btn btn-primary btn-rounded pull-right">查看所有</a>
                                </div>

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

<!-- Flot -->
<script
        src="${pagecontext.request.getcontextpath}/js/plugins/flot/jquery.flot.js"></script>
<script
        src="${pagecontext.request.getcontextpath}/js/plugins/flot/jquery.flot.tooltip.min.js"></script>

<!-- ChartJS-->
<script
        src="${pagecontext.request.getcontextpath}/js/plugins/chartJs/Chart.min.js"></script>

<!-- Peity -->
<script
        src="${pagecontext.request.getcontextpath}/js/plugins/peity/jquery.peity.min.js"></script>


<script>
    $(document).ready(function () {


        var d1 = [[1262304000000, 6], [1264982400000, 3057], [1267401600000, 20434], [1270080000000, 31982], [1272672000000, 26602], [1275350400000, 27826], [1277942400000, 24302], [1280620800000, 24237], [1283299200000, 21004], [1285891200000, 12144], [1288569600000, 10577], [1291161600000, 10295]];
        var d2 = [[1262304000000, 5], [1264982400000, 200], [1267401600000, 1605], [1270080000000, 6129], [1272672000000, 11643], [1275350400000, 19055], [1277942400000, 30062], [1280620800000, 39197], [1283299200000, 37000], [1285891200000, 27000], [1288569600000, 21000], [1291161600000, 17000]];

        var data1 = [
            {
                label: "数据1",
                data: d1,
                color: '#17a084'
            },
            {
                label: "数据2",
                data: d2,
                color: '#127e68'
            }
        ];
        $.plot($("#flot-chart1"), data1, {
            xaxis: {
                tickDecimals: 0
            },
            series: {
                lines: {
                    show: true,
                    fill: true,
                    fillColor: {
                        colors: [{
                            opacity: 1
                        }, {
                            opacity: 1
                        }]
                    },
                },
                points: {
                    width: 0.1,
                    show: false
                },
            },
            grid: {
                show: false,
                borderWidth: 0
            },
            legend: {
                show: false,
            }
        });

        var lineData = {
            labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月"],
            datasets: [
                {
                    label: "示例数据",
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 40, 51, 36, 25, 40]
                },
                {
                    label: "示例数据",
                    fillColor: "rgba(26,179,148,0.5)",
                    strokeColor: "rgba(26,179,148,0.7)",
                    pointColor: "rgba(26,179,148,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(26,179,148,1)",
                    data: [48, 48, 60, 39, 56, 37, 30]
                }
            ]
        };

        var lineOptions = {
            scaleShowGridLines: true,
            scaleGridLineColor: "rgba(0,0,0,.05)",
            scaleGridLineWidth: 1,
            bezierCurve: true,
            bezierCurveTension: 0.4,
            pointDot: true,
            pointDotRadius: 4,
            pointDotStrokeWidth: 1,
            pointHitDetectionRadius: 20,
            datasetStroke: true,
            datasetStrokeWidth: 2,
            datasetFill: true,
            responsive: true,
        };


        var ctx = document.getElementById("lineChart").getContext("2d");
        var myNewChart = new Chart(ctx).Line(lineData, lineOptions);

    });
</script>


<script src="${pagecontext.request.getcontextpath}/js/plugins/echarts/echarts-all.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pagecontext.request.getcontextpath}/js/hplus.js?v=2.2.0"></script>
<script src="${pagecontext.request.getcontextpath}/js/plugins/pace/pace.min.js"></script>

<!-- ECharts demo data -->
<%--<script src="${pagecontext.request.getcontextpath}/js/demo/echarts.js"></script>--%>

</body>
<script type="text/javascript">
    function getCategory(menuname, id) {
        var ul = $("#" + id + "").next();
        ul.empty();
        $.post("/index/getCategory", {"menuname": menuname, id: id}, function (data) {
            for (var i = 0; i < data.data.length; i++) {
                var industry = data.data[i];
                if (data.msg == "category") {
                    // ul.append("<li><a href='category/"+industry.id+"'>"+industry.categoryName+"</a></li>");

                    ul.append("<li><form method='post' action='category/" + industry.id + "'><input class='btn btn-w-m btn-link' width='158px' height='35px' type='submit' value='" + industry.categoryName + "'></input></form></li>");
                } else {
                    if (industry.menuName == "账单管理") {
                        ul.append("<shiro:hasRole name='user'>" + "<li><form method='post' action='" + industry.menuUrl + "'><input class='btn btn-w-m btn-link'  type='submit' value='" + industry.menuName + "'></input></form></li>" + "</shiro:hasRole>");
                    }
                    ul.append("<li><form method='post' action='" + industry.menuUrl + "'><input class='btn btn-w-m btn-link'  type='submit' value='" + industry.menuName + "'></input></form></li>");
                    //ul.append("<li><a href="+industry.menuUrl+">"+industry.menuName+"</a></li>");
                }
            }
        }, "json")
    }
</script>


<script type="text/javascript">
    var categoryres = [];
    var salesres = [];
    $.ajax({
        type: 'post',
        async : false, //同步执行
        url: '/index/pie', //web.xml中注册的Servlet的url-pattern
        data: {}, //无参数
        dataType: 'json', //返回数据形式为json
        success: function (result) {
            for (var i = 0; i < result.length; i++) {
                categoryres.push(result[i].typeName);
                salesres.push(result[i].sales);
            }
            var TypeSalesChart = echarts.init(document.getElementById('echarts-pie-chart'));
            var option = {
                title: {
                    title: "用户账单"
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data: categoryres
                },
                series: [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: (function () {
                            var res = [];
                            var len = result.length;
                            for (var i = 0, size = len; i < size; i++) {
                                res.push({
                                    //通过把result进行遍历循环来获取数据并放入Echarts中
                                    name: result[i].typeName,
                                    value: result[i].sales
                                });
                            }
                            return res;
                        })()
                    }
                ]
            };
            // 为echarts对象加载数据
            TypeSalesChart.setOption(option);
        }
    }); //ajax

    var xAxisres = [];
    var highres = [];
    var lowres = [];
    $.ajax({
        type: 'post',
        // async : false, //同步执行
        url: '/index/weather', //web.xml中注册的Servlet的url-pattern
        data: {"localName": "北京"}, //无参数
        dataType: 'json', //返回数据形式为json
        success: function (result) {
            for (var i = 0; i < result.length; i++) {
                xAxisres.push(result[i].date);
                highres.push(result[i].high);
                lowres.push(result[i].low);
            }
            var lineChart = echarts.init(document.getElementById("echarts-line-chart"));
            var lineoption = {
                title: {
                    text: '气温变化'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['最高气温', '最低气温']
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: xAxisres
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisLabel: {
                            formatter: '{value} °C'
                        }
                    }
                ],
                series: [
                    {
                        name: '最高气温',
                        type: 'line',
                        data: highres,
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    },
                    {
                        name: '最低气温',
                        type: 'line',
                        data: lowres,
                        markPoint: {
                            data: [
                                {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                            ]
                        },
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    }
                ]
            };
            lineChart.setOption(lineoption);
        }
    }); //ajax

</script>
</html>