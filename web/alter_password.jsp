<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/22
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Customer" %>
<%@ page import="util.ConnectionManager " %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>修改密码</title>
</head>
    <body>
    <h4>*修改成功后需要重新登陆</h4>
    <form action="">
        原密码：
        <input type="text" name="old_password" value=""><br>
        新密码：
        <input type="text" name="new_password" value=""><br>
        <input type="submit" value="修改">
    </form>
    <a href="Alter_userinfo.jsp">返回</a>
    <%
        request.setCharacterEncoding("UTF-8");
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        if(old_password != null && new_password != null) {
            Customer Log_user = (Customer) session.getAttribute("user");
            String username = Log_user.getUser_name();
            //连接数据库
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                con = ConnectionManager.getConnection();
                String sql = "SELECT user_password from user_info where user_name = ? and user_password = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2,old_password);
                rs = pstmt.executeQuery();
                if(rs.next()) {
                    sql = "UPDATE user_info SET user_password = ? where user_name=?";
                    PreparedStatement pstmt2 = con.prepareStatement(sql);
                    pstmt2.setString(1, new_password);
                    pstmt2.setString(2, username);
                    pstmt2.executeUpdate();
                    session.removeAttribute("user");
                    response.sendRedirect("home.jsp");
                }
                else{
                    out.print("<script type='text/javascript'>alert('原密码错误');</script>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            finally {
                ConnectionManager.closeConnection(con);
                ConnectionManager.closeResultSet(rs);
                ConnectionManager.closeStatement(pstmt);
            }

        }
    %>
    </body>
</html>
