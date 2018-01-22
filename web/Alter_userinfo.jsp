<%@ page import="mode.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/21
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Alter</title>
</head>
    <body>
        <%
            Customer Log_user = (Customer)session.getAttribute("user");
            out.print("用户名："+Log_user.getUser_name()+"<br>");
            out.print("性别："+Log_user.getUser_sex()+"<br>");
            out.print("手机号："+Log_user.getUser_phone()+"<br>");
            out.print("邮箱："+Log_user.getUser_email()+"<br>");
            out.print("发货地址："+Log_user.getUser_address()+"<br>");
        %>
        修改密码<br>
        原密码：<input type="text" name="old_password" value=""><br>
        新密码：<input type="text" name="new_password" value=""><br>
        <a href="home.jsp">返回</a>
    </body>
</html>
