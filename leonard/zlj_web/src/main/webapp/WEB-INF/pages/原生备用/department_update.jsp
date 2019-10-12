<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门更新</title>
</head>
<body>

<form:form action="/department/update" modelAttribute="department">
    <form:input path="sn"  placeholder="编号..." readonly="true"/><br>
    <form:input path="name"  placeholder="名字..." /><br>
    <form:input path="address"  placeholder="地址..." /><br>

    <button type="submit">保存</button>
    <button type="button" onclick="javascript:window.history.go(-1);">回退</button>
</form:form>


</body>
</html>
