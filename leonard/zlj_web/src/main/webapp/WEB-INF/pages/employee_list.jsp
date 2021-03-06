<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">员工管理</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">员工管理</li>
    </ul>
</div>
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
                        <h3 class="h4">员工管理表</h3>
                        <h3 class="h5">
                            (总员工:${pageInfo.total},每页显示${pageInfo.pageSize}条,共${pageInfo.pages}页,当前${pageInfo.pageNum}页)
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>员工编号</th>
                                    <th>员工名称</th>
                                    <th>所属部门</th>
                                    <th>职位</th>
                                    <th>执行操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="emp">
                                <tr>
                                    <th scope="row">#</th>
                                    <td>${emp.sn}</td>
                                    <td>${emp.name}</td>
                                    <td>${emp.departmentSn}</td>
                                    <td>${emp.post}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/employee/to_update?sn=${emp.sn}">员工编辑</a>
                                        <a href="${pageContext.request.contextPath}/employee/remove?sn=${emp.sn}">员工删除</a>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div>
                            <nav class="pagination-outer" aria-label="Page navigation">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/employee/list?pageNum=${pageInfo.prePage}" class="page-link" aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </li>

                                    <c:forEach var="index" begin="1" end="${totalPage}">
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/list?pageNum=${index}">${index}</a></li>
                                    </c:forEach>


                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/employee/list?pageNum=${pageInfo.nextPage}" class="page-link" aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                        <button onclick="javascript:window.location.href='${pageContext.request.contextPath}/employee/to_add;'"  class="btn btn-primary" > 添加员工 </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<jsp:include page="bottom.jsp"/>