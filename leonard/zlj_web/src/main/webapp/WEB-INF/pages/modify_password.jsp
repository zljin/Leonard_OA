<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<!-- Page Header-->
<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">请修改密码</h2>
    </div>
</header>
<!-- Breadcrumb-->
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">设置密码</li>
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
                        <p>小可爱,请记住改完后的密码哟(#^.^#)</p>
                        <form method="post" action="modify_password">
                            <div class="form-group">
                                <label class="form-control-label">原始密码</label>
                                <input type="password" name="old" id="old" placeholder="Password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">新的密码</label>
                                <input type="password" name="new1" id="new1" placeholder="Password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">再次输入一遍哟</label>
                                <input type="password" name="new2" id="new2" placeholder="Password" class="form-control">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">确认修改</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="bottom.jsp"/>