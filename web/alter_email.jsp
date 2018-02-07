<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/22
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Customer" %>
<%@ page import="business.CustomerDAO" %>
<html>
<head>
    <title>修改邮箱</title>
    <script src="Check.js?ver=1"></script>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
    <body>
    <div class="index_form">
        <form action="" name="form_newemail">
            新邮箱：
            <input type="text" name="new_email" required="required" autofocus=""><br>
            <input type="submit" value="修改" onclick="return check_newemail();" class="home_button">
        </form>
        <a href="Alter_userinfo.jsp">返回</a>
    </div>
    <%
        request.setCharacterEncoding("UTF-8");
        String new_email = request.getParameter("new_email");
        if(new_email != null) {
            Customer Log_user = (Customer) session.getAttribute("user");
            String username = Log_user.getUser_name();
            CustomerDAO.alter_useremail(username,new_email);
            response.sendRedirect("Alter_userinfo.jsp");
        }
    %>
    </body>
</html>
