<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>报销单填写</title>
    <script src="/js/items.js"></script>
</head>
<body>
<form:form action="/claim_voucher/add" modelAttribute="info">
    <div>
        <form:input path="claimVoucher.cause" cssClass="gui-input" placeholder="事由..."/><br>
    </div>
    <div>
        <span> 费用明细 </span>
    </div>
    <div id="items">
        <div>
            <div class="col-md-3" style="float:left;">
                <form:select path="items[0].item" placeholder="花销类型..." items="${items}"/>
            </div>
            <div class="col-md-3" style="float:left;">
                <form:input path="items[0].amount" class="money" placeholder="金额..."/>
            </div>
            <div class="col-md-5" style="float:left;">
                <form:input path="items[0].comment"  placeholder="备注..." />
            </div>
            <div class="col-md-1" style="float:left;">
                <button type="button" class="button"> X </button>
            </div>
        </div>
    </div>

    <form:input id="totalMoney" path="claimVoucher.totalAmount" placeholder="总金额..." readonly="true"/>

    <button type="button" id="addItemButton"> + </button>

    <br>

    <button type="submit" class="button"> 保存 </button>


    <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
</form:form>

</body>
</html>

<script>
</script>