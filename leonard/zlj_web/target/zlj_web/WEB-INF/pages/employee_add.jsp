<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">添加员工界面</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">添加员工</li>
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
                        <h3 class="h4">Basic Form</h3>
                    </div>
                    <div class="card-body">
                        <p>(#^.^#)欢迎新的成员,默认密码000000,请及时修改</p>
                        <form:form action="${pageContext.request.contextPath}/employee/add" modelAttribute="employee">
                            <div class="form-group">
                                <form:input path="sn"  placeholder="员工编号..." class="form-control"/><br>
                            </div>
                            <div class="form-group">
                                <form:input path="name"  placeholder="员工名字..." class="form-control" /><br>
                            </div>
                            <div class="form-group">
                                <!--
                                    itemLabel:选择下拉菜单的 dlist集合中对象的显示的属性
                                    itemValue:选择后输入dList集合中对象的数学
                                -->
                                <form:select path="departmentSn"  items="${dlist}" itemLabel="name" itemValue="sn" placeholder="所属部门" class="form-control"/><br>
                            </div>
                            <div class="form-group">
                                <form:select path="post"  items="${plist}" placeholder="职务" class="form-control"/><br>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">确认添加</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>



