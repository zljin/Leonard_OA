<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>报销单详情信息</title>
</head>
<body>
<div>事由:${claimVoucher.cause}</div>
<div>
    <div>创建人: ${claimVoucher.creater.name}</div>
    时间:
    <div><spring:eval expression="claimVoucher.createTime"/></div>
</div>
<div>
    <div>待处理人:${claimVoucher.dealer.name}</div>
    <div>状态:${claimVoucher.status}</div>
</div>

<span> 费用明细 </span>

<div>
    <c:forEach items="${items}" var="item">
        <div class="col-md-3">${item.item}</div>
        <div class="col-md-3">${item.amount}</div>
        <div class="col-md-5">${item.comment}</div>
    </c:forEach>
</div>
<div>总金额:${claimVoucher.totalAmount}</div>

<span> 处理流程 </span>
<div>
    <c:forEach items="${records}" var="record">
        <div>${record.dealer.name}</div>
        <div><spring:eval expression="record.dealTime"/></div>
        <div>${record.dealWay}</div>
        <div>${record.dealWay}</div>
        <div>备注：${record.comment}</div>
    </c:forEach>
</div>
<button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>

</body>
</html>
