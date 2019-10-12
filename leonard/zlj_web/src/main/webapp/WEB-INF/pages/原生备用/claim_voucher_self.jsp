<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人所有报销单</title>
</head>
<body>
<table id="message-table">
    <thead>
    <tr>
<%--        <th>Select</th>--%>
        <th>事由</th>
        <th>状态</th>
        <th>创建人</th>
        <th>金额</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="cv">
        <tr>
            <td>${cv.cause}</td>
            <td>${cv.status}</td>
            <td>${cv.creater.name}</td>
            <td>${cv.totalAmount}</td>
            <td><spring:eval expression="cv.createTime"/></td>
            <td><a href="/claim_voucher/detail?id=${cv.id}">详细信息</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
