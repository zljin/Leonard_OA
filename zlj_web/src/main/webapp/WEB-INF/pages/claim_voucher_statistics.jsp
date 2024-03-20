<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">统计</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">报销金额统计</li>
    </ul>
</div>

<br>


<div class="col-lg-10">
    <div class="bar-chart-example card">
        <div class="card-close">
            <div class="dropdown">
                <button type="button" id="closeCard6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                <div aria-labelledby="closeCard6" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
            </div>
        </div>
        <div class="card-header d-flex align-items-center">
            <h3 class="h4">部门报销总额统计</h3>
        </div>
        <div class="card-body">
            <div class="chartjs-size-monitor"
                 style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                <div class="chartjs-size-monitor-expand"
                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                </div>
                <div class="chartjs-size-monitor-shrink"
                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                    <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                </div>
            </div>
            <canvas id="barChartExample" width="813" height="406"
                    style="display: block; height: 325px; width: 651px;"></canvas>
        </div>
    </div>
</div>


<jsp:include page="bottom.jsp"/>

<script type="text/javascript">
    $(document).ready(function () {
        let departmentX =${deptname};
        let totaly = ${total};


        var ctx1 = $("canvas").get(0).getContext("2d");
        var gradient1 = ctx1.createLinearGradient(150, 0, 150, 300);
        gradient1.addColorStop(0, 'rgba(133, 180, 242, 0.91)');
        gradient1.addColorStop(1, 'rgba(255, 119, 119, 0.94)');


        var BARCHARTEXMPLE    = $('#barChartExample');
        var barChartExample = new Chart(BARCHARTEXMPLE, {
            type: 'bar',
            options: {
                scales: {
                    xAxes: [{
                        display: true,
                        gridLines: {
                            color: '#eee'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        gridLines: {
                            color: '#eee'
                        }
                    }]
                },
            },
            data: {
                labels: departmentX,
                datasets: [
                    {
                        label: "金额",
                        backgroundColor: [
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1
                        ],
                        hoverBackgroundColor: [
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1
                        ],
                        borderColor: [
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1,
                            gradient1
                        ],
                        borderWidth: 1,
                        data: totaly
                    }
                ]
            }
        });
    })

</script>