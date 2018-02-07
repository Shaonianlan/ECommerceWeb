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
    <title>修改密码</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
    <body>
    <div class="index_form">
        <h4>*修改成功后需要重新登陆</h4>
        <form action="">
            原密码：
            <input type="text" name="old_password" required="required"><br>
            新密码：
            <input type="text" name="new_password" required="required"><br>
            <input type="submit" value="修改" class="home_button">
        </form>
        <a href="Alter_userinfo.jsp">返回</a>
    </div>
    <%
        request.setCharacterEncoding("UTF-8");
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        if(old_password != null && new_password != null) {
            Customer Log_user = (Customer) session.getAttribute("user");
            String username = Log_user.getUser_name();
            int tag = 0;// 1:原密码错误 2:修改成功
            tag = CustomerDAO.alter_userpassword(username,old_password,new_password);
            if(tag == 1) {
                session.removeAttribute("user");
                response.sendRedirect("alter_password_work.jsp");
            }
            else{
                out.print("<script type='text/javascript'>alert('原密码错误');</script>");
            }
        }
    %>
    </body>
</html>
