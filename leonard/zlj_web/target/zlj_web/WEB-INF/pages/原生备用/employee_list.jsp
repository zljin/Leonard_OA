<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>员工列表展示</title>
</head>
<body>
<div>
    <h2> 员工列表 </h2>
    <p></p>
</div>


<table>
    <tr>
        <th>Select</th>
        <th>员工编号</th>
        <th>员工名称</th>
        <th>所属部门</th>
        <th>职位</th>
    </tr>

    <c:forEach items="${list}" var="emp">
        <tr>
            <td>(*)</td>
            <td>${emp.sn}</td>
            <td>${emp.name}</td>
            <td>${emp.departmentSn}</td>
            <td>${emp.post}</td>
            <td>
                <a href="/employee/to_update?sn=${emp.sn}">员工编辑</a>
                <a href="/employee/remove?sn=${emp.sn}">员工删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<button onclick="javascript:window.location.href='/employee/to_add;'"> 添加员工 </button>

</body>
</html>
