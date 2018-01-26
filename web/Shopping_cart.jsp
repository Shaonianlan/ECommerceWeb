<%@ page import="mode.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/26
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
    <body>
        <%
            Customer Log_user = (Customer) session.getAttribute("user");
            if(Log_user == null){
                out.print("<a href='index.jsp'>登陆</a>");
            }
        %>
    </body>
</html>
