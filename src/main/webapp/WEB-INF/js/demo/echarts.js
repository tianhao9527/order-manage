$(function () {

    var lineChart = echarts.init(document.getElementById("echarts-line-chart"));
    var lineoption = {
        title: {
            text: '未来一周气温变化'
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
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
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
                data: [11, 11, 15, 13, 12, 13, 10],
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
                data: [1, -2, 2, 5, 3, 2, 0],
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
/*

    var pieChart = echarts.init(document.getElementById("echarts-pie-chart"));
    var pieoption = {
        title: {
            text: '某站点用户访问来源',
            // subtext: '纯属虚构',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: item //['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
        },
        calculable: true,
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: orders/!* [
                   {value: 335, name: '直接访问'},
                    {value: 310, name: '邮件营销'},
                    {value: 234, name: '联盟广告'},
                    {value: 135, name: '视频广告'},
                    {value: 1548, name: '搜索引擎'}
                ]*!/
            }
        ]
    };
    pieChart.showLoading();
    var item =[];
    var orders =[];
    // var sales = [];
    $.post({
       type:"post",
        async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url :"/index/pie",
        data:{},
        dataType : "json",        //返回数据形式为json
        success : function(data) {
           for(var i=0; i<data.length;i++){
               item.push(data[i].typeName);
           }
           for(var i=0; i<data.length;i++){
                orders.push({
                    name : data[i].typeName,
                    value : data[i].sales
                });
                // orders.push(data[i].sales);
           }

        }
    });
    pieChart.setOption(pieoption);
*/

    var radarChart = echarts.init(document.getElementById("echarts-radar-chart"));
    var radaroption = {
        title: {
            text: '预算 vs 开销',
            subtext: '纯属虚构'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            orient: 'vertical',
            x: 'right',
            y: 'bottom',
            data: ['预算分配', '实际开销']
        },
        polar: [
            {
                indicator: [
                    {text: '销售', max: 6000},
                    {text: '管理', max: 16000},
                    {text: '信息技术', max: 30000},
                    {text: '客服', max: 38000},
                    {text: '研发', max: 52000},
                    {text: '市场', max: 25000}
                ]
            }
        ],
        calculable: true,
        series: [
            {
                name: '预算 vs 开销',
                type: 'radar',
                data: [
                    {
                        value: [4300, 10000, 28000, 35000, 50000, 19000],
                        name: '预算分配'
                    },
                    {
                        value: [5000, 14000, 28000, 31000, 42000, 21000],
                        name: '实际开销'
                    }
                ]
            }
        ]
    };

    radarChart.setOption(radaroption);

});
