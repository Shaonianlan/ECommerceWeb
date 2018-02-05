<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/18
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="util.ConnectionManager" %>
<%@ page import="business.CustomerDAO" %>
<%@ page import="mode.Customer" %>
<html>
  <head>
    <title>登陆</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
  </head>
  <body>
  <div class="index_div">
    <form action="" method="post" name="form_log" class="index_form" >
        <h2 class="index_h2">Please Login</h2>
        <div class="form_div2">
        <input type="text" name = "username" placeholder="Username" class="form_input" required="required" autofocus=""/>
        <input type="password" name="password" placeholder="Password" class="form_input" required="required"/>
        </div>
        <input type="submit" value="登陆" class="form_button">
        <a href='Register.jsp' class="index_a">注册</a>
        <a href="home.jsp">游客访问</a>
    </form>


  <%
      request.setCharacterEncoding("UTF-8");
      String user_name = request.getParameter("username");
      String userpassword = request.getParameter("password");
      if( user_name != null && userpassword !=null) {
          boolean check = CustomerDAO.check_log(user_name, userpassword);
          if (check) {
              Customer Log_user = CustomerDAO.getLoginInfo(user_name);
              session.setAttribute("user", Log_user);
              response.sendRedirect("home.jsp");
          } else {
              out.print("<script type='text/javascript'>alert('密码错误');</script>");
          }
      }
  %>
  </div>
  </body>
</html>
