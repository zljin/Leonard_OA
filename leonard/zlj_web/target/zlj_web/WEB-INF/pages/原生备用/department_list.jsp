<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>部门列表展示</title>
</head>
<body>
<div>
    <h2> 部门列表 </h2>
    <p></p>
</div>


<table>
    <tr>
        <th>Select</th>
        <th>部门编号</th>
        <th>部门名称</th>
        <th>地址</th>
        <th>操作</th>
    </tr>

    <c:forEach items="${list}" var="dept">
        <tr>
            <td>(*)</td>
            <td>${dept.sn}</td>
            <td>${dept.name}</td>
            <td>${dept.address}</td>
            <td>
                <a href="/department/to_update?sn=${dept.sn}">部门编辑</a>
                <a href="/department/remove?sn=${dept.sn}">部门删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<button onclick="javascript:window.location.href='/department/to_add;'"> 添加部门 </button>

</body>
</html>