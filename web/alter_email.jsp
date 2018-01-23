<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/22
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Customer" %>
<%@ page import="util.ConnectionManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.regex.Pattern" %>
<html>
<head>
    <title>修改邮箱</title>
</head>
    <body>
    <form action="">
        新邮箱：
        <input type="text" name="new_email" value=""><br>
        <input type="submit" value="修改">
    </form>
    <a href="Alter_userinfo.jsp">返回</a>
    <%
        request.setCharacterEncoding("UTF-8");
        String new_email = request.getParameter("new_email");
        //out.print(new_phonenum);
        //String reg = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
        boolean flag = true;
        //flag = Pattern.matches(reg,new_email);
        if(new_email != null) {
            if(flag) {
                Customer Log_user = (Customer) session.getAttribute("user");
                String username = Log_user.getUser_name();
                //连接数据库
                try {
                    Connection con = ConnectionManager.getConnection();
                    String sql = "UPDATE user_info SET user_email = ? where user_name=?";
                    PreparedStatement pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, new_email);
                    pstmt.setString(2, username);
                    pstmt.executeUpdate();
                    //关闭连接
                    pstmt.close();
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("Alter_userinfo.jsp");
            }
            else {
                out.print("<script type='text/javascript'>alert('邮箱格式不正确');</script>");
            }
        }
    %>
    </body>
</html>
