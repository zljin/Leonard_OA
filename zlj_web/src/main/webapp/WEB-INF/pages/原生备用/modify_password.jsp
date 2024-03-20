<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码界面</title>
</head>
<body>

<form method="post" action="modify_password">
<input type="password" name="old" id="old" placeholder="原始密码..."><br>
<input type="password" name="new1" id="new1" class="gui-input" placeholder="重复密码..."><br>
<input type="password" name="new2" id="new2" class="gui-input" placeholder="重复密码..."><br>
<button type="submit" class="button"> 修改 </button>
<button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
</form>
</body>
</html>
