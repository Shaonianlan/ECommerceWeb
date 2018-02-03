<%@ page import="mode.Customer" %>
<%@ page import="business.CustomerDAO" %><%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/21
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
    <link type="text/css" rel="stylesheet" href="style.css">
</head>
    <body>
    <div class="total_div">
        <%
            Customer Log_user = (Customer)session.getAttribute("user");
            Log_user = CustomerDAO.getLoginInfo(Log_user.getUser_name());
            out.print("用户名："+Log_user.getUser_name()+"<br>");
            out.print("性别："+Log_user.getUser_sex()+"<br>");
            out.print("手机号："+Log_user.getUser_phone()+"<a href='alter_phonenum.jsp'>    修改</a><br>");
            out.print("邮箱："+Log_user.getUser_email()+"<a href='alter_email.jsp'>    修改</a><br>");
            out.print("发货地址："+Log_user.getUser_address()+"<a href='alter_address.jsp'>  修改</a><br>");
        %>
        <a href="alter_password.jsp">修改密码</a><br>
        <a href="home.jsp">返回</a>
    </div>
    </body>
</html>
