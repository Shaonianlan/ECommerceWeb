<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/2/5
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.CustomerDAO" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String username = request.getParameter("username");
            PrintWriter pw = response.getWriter();
            if(CustomerDAO.Check_Regname(username) == true) {
                pw.print(true);
                pw.close();
            }
            else{
                pw.print(false);
                pw.close();
            }
        %>

    </body>
</html>
