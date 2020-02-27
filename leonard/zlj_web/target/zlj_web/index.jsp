<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${sessionScope.employee.name}+${sessionScope.employee.sn}</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/claim_voucher/upfile" enctype="multipart/form-data">
    选择文件:<input type="file" name="file" width="120px"><br>
    <input type="text" name="name"><br>
    <button type="submit">提交</button>
</form>
<form method="get" action="/claim_voucher/downfile">
    <button type="submit">下载</button>
</form>
</body>
</html>