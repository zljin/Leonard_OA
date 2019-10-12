<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">报销单详细信息界面</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">报销单详细信息</li>
    </ul>
</div>

<!-- Forms Section-->
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-close">
                        <div class="dropdown">
                            <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                            <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                        </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                        <h3 class="h4">报销单详情信息</h3>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">事由</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${claimVoucher.cause}" class="form-control" readonly="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">创建人</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${claimVoucher.creater.name}" class="form-control" readonly="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">时间</label>
                                <div class="col-sm-9">
                                    <input type="text" value='<spring:eval expression="claimVoucher.createTime"/>' class="form-control" readonly="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">待处理人</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${claimVoucher.dealer.name}" class="form-control" readonly="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">状态</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${claimVoucher.status}" class="form-control" readonly="true">
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-3 form-control-label">费用明细</label>
                                <div class="col-sm-9">
                                <c:forEach items="${items}" var="item">
                                    <div class="form-group-material">
                                        <input type="text" value="${item.item}" required class="input-material" readonly="true">
                                        <input type="text" value="${item.amount}" required class="input-material" readonly="true">
                                        <input type="text" value="${item.comment}" required class="input-material" readonly="true">
                                    </div>
                                </c:forEach>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">总金额</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${claimVoucher.totalAmount}" class="form-control" readonly="true">
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-sm-3 form-control-label">处理流程</label>
                                <div class="col-sm-9">
                                    <c:forEach items="${records}" var="record">
                                        <div class="form-group-material">
                                            <input type="text" value="处理人:${record.dealer.name}" required class="input-material" readonly="true">
                                            <input type="text" value='处理时间:<spring:eval expression="record.dealTime"/>' required class="input-material" readonly="true">
                                            <input type="text" value="处理方式:${record.dealWay}" required class="input-material" readonly="true">
                                            <input type="text" value="备注:${record.comment}" required class="input-material" readonly="true">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" onclick="javascript:window.history.go(-1);"> 返回 </button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="bottom.jsp"/>