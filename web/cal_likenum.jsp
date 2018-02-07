<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/2/6
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.PetDAO" %>

<html>
<head>
    <title>Title</title>
</head>
    <body>
    <%
        request.setCharacterEncoding("UTF-8");
        String pet_name = request.getParameter("pet_name");
        Long f =PetDAO.Addpet_likenum(pet_name);
        out.print(f);
    %>
    </body>
</html>
