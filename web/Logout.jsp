<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/22
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
    <body>
        <%
            session.removeAttribute("user");
            response.sendRedirect("home.jsp");
        %>
    </body>
</html>
