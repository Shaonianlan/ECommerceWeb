<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/22
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Customer" %>
<%@ page import="business.CustomerDAO" %>
<html>
<head>
    <title>修改收货地址</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
    <body>
    <div class="index_form">
        <form action="">
            新收货地址：
            <input type="text" name="new_address" required="required"><br>
            <input type="submit" value="修改" class="home_button">
        </form>
        <a href="Alter_userinfo.jsp">返回</a>
    </div>
    <%
        request.setCharacterEncoding("UTF-8");
        String new_aadress = request.getParameter("new_address");
        if(new_aadress != null) {
            Customer Log_user = (Customer) session.getAttribute("user");
            String username = Log_user.getUser_name();
            CustomerDAO.alter_useraddress(username,new_aadress);
            response.sendRedirect("Alter_userinfo.jsp");
        }
    %>
    </body>
</html>
