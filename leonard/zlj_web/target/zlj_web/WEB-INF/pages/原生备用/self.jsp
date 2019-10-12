<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/9/30
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功个人信息页面</title>
</head>
<body>

<h2> 工号:${sessionScope.employee.sn} </h2>
<h3> 姓名:${sessionScope.employee.name} </h3>
<h4> 部门名称:${sessionScope.employee.department.name} </h4>
<h5> 部门职位:${sessionScope.employee.post} </h5>



<button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>

<a href="/quit">退出</a>
<a href="/to_modify_password">修改</a>

</body>
</html>
