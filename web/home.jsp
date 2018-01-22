<%@ page import="mode.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/21
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="business.CustomerDAO" %>
<html>
<head>
    <title>Title</title>
</head>
    <body>
        <%
            Customer Log_user = (Customer) session.getAttribute("user");
            out.print(Log_user.getUser_name()+" ,"+ CustomerDAO.getHello()+"    ");
            out.print("<a href='Alter_userinfo.jsp'>修改个人信息</a>");

        %>
    </body>
</html>
