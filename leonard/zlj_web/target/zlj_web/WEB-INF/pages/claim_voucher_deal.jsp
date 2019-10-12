<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.zlj.global.Contant" %>
<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">待处理报销单</h2>
    </div>
</header>
<!--Sections-->
<section class="tables">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-close">
                        <div class="dropdown">
                            <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                            <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                        </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                        <h3 class="h4">Striped table with hover effect</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>Select</th>
                                    <th>事由</th>
                                    <th>状态</th>
                                    <th>创建人</th>
                                    <th>金额</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="cv">
                                    <tr>
                                        <td>
                                            <label class="option block mn">
                                                <input type="checkbox" name="mobileos" value="FR">
                                                <span class="checkbox mn"></span>
                                            </label>
                                        </td>
                                        <td>${cv.cause}</td>
                                        <td>
                                            <span class="badge badge-warning mr10 fs11">${cv.status}</span>
                                        </td>
                                        <td>${cv.creater.name}</td>
                                        <td>${cv.totalAmount}</td>
                                        <td><spring:eval expression="cv.createTime"/></td>
                                        <td>
                                            <c:if test="${cv.status==Contant.CLAIMVOUCHER_CREATED || cv.status==Contant.CLAIMVOUCHER_BACK}">
                                                <a href="/claim_voucher/to_update?id=${cv.id}">修改</a>
                                                <a href="/claim_voucher/submit?id=${cv.id}">提交</a>
                                            </c:if>
                                            <c:if test="${cv.status==Contant.CLAIMVOUCHER_SUBMIT || cv.status==Contant.CLAIMVOUCHER_RECHECK}">
                                                <a href="/claim_voucher/to_check?id=${cv.id}">审核</a>
                                            </c:if>
                                            <c:if test="${cv.status==Contant.CLAIMVOUCHER_APPROVED}">
                                                <a href="/claim_voucher/to_check?id=${cv.id}">打款</a>
                                            </c:if>
                                            <a href="/claim_voucher/detail?id=${cv.id}">详细信息</a>
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
</section>
<jsp:include page="bottom.jsp"/>
