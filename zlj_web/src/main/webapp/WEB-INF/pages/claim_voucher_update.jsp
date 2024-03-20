<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">修改报销单界面</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">报销单修改</li>
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
                        <form:form action="${pageContext.request.contextPath}/claim_voucher/update" modelAttribute="info" class="form-horizontal">
                            <form:hidden path="claimVoucher.id"/><!--??????????-->
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">事由</label>
                                <div class="col-sm-9">
                                    <form:input path="claimVoucher.cause" cssClass="form-control" placeholder="事由..."/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">费用明细</label>

                                <div id="items" class="col-sm-9">
                                    <c:forEach items="${info.items}" varStatus="sta">
                                    <div>
                                        <div class="col-md-3" style="float:left;">
                                            <form:hidden path="items[${sta.index}].id"/>
                                            <form:hidden path="items[${sta.index}].claimVoucherId"/>
                                            <form:select path="items[${sta.index}].item" cssClass="form-control" placeholder="花销类型..." items="${items}"/>
                                        </div>
                                        <div class="col-md-5" style="float:left;">
                                            <form:input path="items[${sta.index}].amount" cssClass="form-control money" placeholder="金额..."/>
                                        </div>
                                        <div class="col-md-3" style="float:left;">
                                            <form:input path="items[${sta.index}].comment" cssClass="form-control" placeholder="备注..." />
                                        </div>
                                        <div class="col-md-1" style="float:left;">
                                            <button type="button" class="btn btn-primary"> X </button>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>

                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">总金额</label>
                                <div class="col-sm-9">
                                    <form:input id="totalMoney" path="claimVoucher.totalAmount" cssClass="form-control" readonly="true"/>
                                </div>
                            </div>
                            <button type="button" id="addItemButton" class="btn btn-primary"> + </button>
                            <button type="submit" class="btn btn-primary"> 保存修改 </button>
                            <button type="button" class="btn btn-primary" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>


<!--动态表单传输-->
<script src="${pageContext.request.contextPath}/js/items.js?v=1"></script>