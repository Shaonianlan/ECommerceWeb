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
    <title>修改手机号</title>
    <script src="Check.js?ver=1"></script>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
    <body>
    <div class="index_form">
        <form action="" name = "form_newphone">
            新手机号码：
            <input type="text" name="new_phonenum" required="required"><br>
            <input type="submit" value="修改" onclick="return check_newphone();" class="home_button">
        </form>
        <a href="Alter_userinfo.jsp">返回</a>
    </div>
    <%
        request.setCharacterEncoding("UTF-8");
        String new_phonenum = request.getParameter("new_phonenum");
        if (new_phonenum != null) {
            Customer Log_user = (Customer) session.getAttribute("user");
            String username = Log_user.getUser_name();
            CustomerDAO.alter_userphone(username,new_phonenum);
            response.sendRedirect("Alter_userinfo.jsp");
        }

    %>
    </body>
</html>
