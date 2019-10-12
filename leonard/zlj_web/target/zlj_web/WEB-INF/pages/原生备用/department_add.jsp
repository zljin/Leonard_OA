<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门添加</title>
</head>
<body>
<div>
    <h2> 部门添加 </h2>
    <p></p>
</div>


<!--使用springmvc提供的表单-->
<form:form action="/department/add" modelAttribute="department">
<!--springmvc版本的input
path:代替标签id和name  cssPath:代替标签css
    -->

<form:input path="sn" placeholder="编号.."/><br>
<form:input path="name" placeholder="名字.."/><br>
<form:input path="address" placeholder="地址.."/><br>

    <button type="submit" class="button">保存</button>
    <button type="button" class="button" onclick="javascript:window.history.go(-1);">返回</button>
</form:form>

</body>
</html>
