<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>报销单修改</title>
</head>
<body>
<form:form action="/claim_voucher/update" modelAttribute="info">
    <form:hidden path="claimVoucher.id"/><!--??-->
    <form:input path="claimVoucher.cause" cssClass="gui-input" placeholder="事由..."/><br>
    <span> 待修改费用明细 </span><br>

    <c:forEach items="${info.items}" varStatus="sta">
        <form:hidden path="items[${sta.index}].id"/>
        <form:hidden path="items[${sta.index}].claimVoucherId"/>
        <form:select path="items[${sta.index}].item" placeholder="花销类型..." items="${items}"/>
        <form:input path="items[${sta.index}].amount" placeholder="金额..."/>
        <form:input path="items[${sta.index}].comment" placeholder="备注..." />
        <form:input id="totalMoney" path="claimVoucher.totalAmount" placeholder="总金额..." readonly="true"/><br>
    </c:forEach>

    <button type="submit" class="button"> 保存 </button>
    <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
</form:form>

</body>
</html>

<script>
</script>