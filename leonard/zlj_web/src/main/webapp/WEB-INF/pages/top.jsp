<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<div class="page">
    <!-- Main Navbar-->
    <header class="header">
        <nav class="navbar">
            <!-- Search Box-->
            <div class="search-box">
                <button class="dismiss"><i class="icon-close"></i></button>
                <form id="searchForm" action="#" role="search">
                    <input type="search" placeholder="What are you looking for..." class="form-control">
                </form>
            </div>
            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <!-- Navbar Header-->
                    <div class="navbar-header">
                        <!-- Navbar Brand --><a href="${pageContext.request.contextPath}/self" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block"><span>Zou </span><strong>lingjin</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>Leonard</strong></div></a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Search-->
                        <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                        <!-- Notifications-->
                        <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red badge-corner">${sessionScope.times}</span></a>
                            <ul aria-labelledby="notifications" class="dropdown-menu">
                                <li><a rel="nofollow" href="#" class="dropdown-item">
                                    <div class="notification">
                                        <div class="notification-content"><i class="fa fa-envelope bg-green"></i>超时的${sessionScope.times}个报销单请尽快处理 </div>
                                        <div class="notification-time"><small>已超时:9 hour ago</small></div>
                                    </div></a></li>
                            </ul>
                        </li>
                        <!-- Languages dropdown    -->
                        <li class="nav-item dropdown">
                            <a rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="${pageContext.request.contextPath}/img/flags/16/CN.png"></a>
                            <ul class="dropdown-menu">
                                <li><a rel="nofollow" href="${pageContext.request.contextPath}/self" class="dropdown-item"> <span class="fa fa-user"></span>个人信息</a></li>
                                <li><a rel="nofollow" href="${pageContext.request.contextPath}/to_modify_password" class="dropdown-item">  <span class="fa fa-gear"></span>设置密码</a></li>
                            </ul>
                        </li>
                        <!-- Logout    -->
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/quit" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <!-- Sidebar Header-->
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar">
                    <img src="${pageContext.request.contextPath}/img/${sessionScope.employee.name}.jpg" alt="..." onerror="this.src='${pageContext.request.contextPath}/img/avatar-11.jpg'" class="img-fluid rounded-circle">
                </div>
                <div class="title">
                    <h1 class="h4">${sessionScope.employee.name}</h1>
                    <p>${sessionScope.employee.post}</p>
                </div>
            </div>
            <!-- Sidebar Navidation Menus--><span class="heading">日常管理</span>
            <ul class="list-unstyled">
                <li><a href="${pageContext.request.contextPath}/claim_voucher/deal"> <i class="icon-home"></i>待处理报销单 </a></li>
                <li><a href="${pageContext.request.contextPath}/claim_voucher/self"> <i class="icon-grid"></i>个人报销单</a></li>
                <li><a href="${pageContext.request.contextPath}/claim_voucher/to_add"> <i class="fa fa-bar-chart"></i>填写报销单</a></li>
            </ul><span class="heading">基础信息管理</span>
            <ul class="list-unstyled">
                <c:choose>
                    <c:when test="${sessionScope.employee.post=='总经理'}">
                        <li> <a href="${pageContext.request.contextPath}/employee/list?pageNum=1"> <i class="icon-flask"></i>员工管理 </a></li>
                        <li> <a href="${pageContext.request.contextPath}/department/list"> <i class="icon-screen"></i>部门管理 </a></li>
                        <li> <a href="${pageContext.request.contextPath}/claim_voucher/statistics"> <i class="icon-mail"></i>统计 </a></li>
                    </c:when>
                    <c:when test="${sessionScope.employee.post=='部门经理'}">
                        <li> <a href="${pageContext.request.contextPath}/employee/listByDepartmentName?pageNum=1"> <i class="icon-flask"></i>${sessionScope.employee.department.name}员工管理 </a></li>
                    </c:when>
                </c:choose>
                <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
            </ul>
        </nav>
        <div class="content-inner">
