<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工添加</title>
</head>
<body>

<form:form action="/employee/add" modelAttribute="employee">
    <form:input path="sn"  placeholder="员工编号..."/><br>
    <form:input path="name"  placeholder="员工名字..." /><br>
    <!--
    itemLabel:选择下拉菜单的 dlist集合中对象的显示的属性
    itemValue:选择后输入dList集合中对象的数学
    -->
    <form:select path="departmentSn"  items="${dlist}" itemLabel="name" itemValue="sn" placeholder="所属部门" /><br>
    <form:select path="post"  items="${plist}" placeholder="职务" /><br>
    <button type="submit">保存</button>
    <button type="button" onclick="javascript:window.history.go(-1);">回退</button>
</form:form>


</body>
</html>
