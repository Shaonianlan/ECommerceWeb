<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/18
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html class="formposition">
  <head>
    <title>登陆</title>
    <link type="text/css" rel="stylesheet" href="style.css">
    <script src="form_log.js?ver=1"></script>
  </head>
  <body>
  <h2>欢迎登陆</h2>
    <form action="" method="post" name="form_log" onsubmit="return check();" >
        <p>
            用户名：
            <input type="text" name = "username" id="username" value=""><span class="warning" id="showname"></span><br>
        </p>
        <p>
            密码：
            <input type="password" name="password" id="password" value=""><span class="warning" id="showpasssword"></span><br>
        </p>
        <input type="submit" value="确认"  onclick="return check();" >
    </form>
    <a href='Register.jsp'>注册</a>

  <%
      request.setCharacterEncoding("UTF-8");
      String user_name = request.getParameter("username");
      String userpassword = request.getParameter("password");
      if(user_name != null) {
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://localhost:3306/ecweb";
          String username = "root";
          String password = "5jiu2DNF";
          Connection con = DriverManager.getConnection(url, username, password);
          String sql = "SELECT user_name,user_password from user_info where user_name=?";
          PreparedStatement pstmt = con.prepareStatement(sql);
          pstmt.setString(1, user_name);
          ResultSet rs = pstmt.executeQuery();
          if (rs.next()) {
              if (userpassword.equals(rs.getString("user_password"))) {
                  response.sendRedirect("1.jsp");
              }
              else {
                  out.print("<script type='text/javascript'>alert('密码错误');</script>");
              }
          }
          else {
              out.print("<script type='text/javascript'>alert('用户名不存在');</script>");
          }
          pstmt.close();
          con.close();
          rs.close();
      }
  %>
  </body>
</html>
