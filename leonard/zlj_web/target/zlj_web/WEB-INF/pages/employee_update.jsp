<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">员工编辑页面</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">员工编辑</li>
    </ul>
</div>
<!--Forms Sections-->
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <!-- Basic Form-->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-close">
                        <div class="dropdown">
                            <button type="button" id="closeCard1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                            <div aria-labelledby="closeCard1" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                        </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                        <h3 class="h4">员工编辑</h3>
                    </div>
                    <div class="card-body">
                        <p>Tip:请及时修改个人信息</p>
                        <form:form action="/employee/update" modelAttribute="employee">
                            <div class="form-group">
                                <form:input path="sn"  placeholder="员工编号..." class="form-control"/><br>
                            </div>
                            <div class="form-group">
                                <form:input path="name"  placeholder="员工名字..." class="form-control" /><br>
                            </div>
                            <div class="form-group">
                                <form:select path="departmentSn"  items="${dlist}" itemLabel="name" itemValue="sn" placeholder="所属部门" class="form-control"/><br>
                            </div>
                            <div class="form-group">
                                <form:select path="post"  items="${plist}" placeholder="职务" class="form-control"/><br>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">确认修改</button>
                            </div>
                            <div class="form-group">
                                <button type="button" onclick="javascript:window.history.go(-1);" class="btn btn-primary">回退</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>
