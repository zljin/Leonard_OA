<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">部门管理界面</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">部门管理</li>
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
                        <h3 class="h4">部门管理表</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>部门编号</th>
                                    <th>部门名称</th>
                                    <th>地址</th>
                                    <th>执行操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="dept">
                                    <tr>
                                        <th scope="row">#</th>
                                        <td>${dept.sn}</td>
                                        <td>${dept.name}</td>
                                        <td>${dept.address}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/department/to_update?sn=${dept.sn}">部门编辑</a>
                                            <a href="${pageContext.request.contextPath}/department/remove?sn=${dept.sn}">部门删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <button onclick="javascript:window.location.href='${pageContext.request.contextPath}/department/to_add;'" class="btn btn-primary"> 添加部门 </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>