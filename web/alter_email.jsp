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
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Pattern" %>
<html>
<head>
    <title>修改邮箱</title>
    <script src="Check.js?ver=1"></script>
</head>
    <body>
    <form action="" name="form_newemail">
        新邮箱：
        <input type="text" name="new_email" value=""><br>
        <input type="submit" value="修改" onclick="return check_newemail();">
    </form>
    <a href="Alter_userinfo.jsp">返回</a>
    <%
        request.setCharacterEncoding("UTF-8");
        String new_email = request.getParameter("new_email");
        if(new_email != null) {
            Customer Log_user = (Customer) session.getAttribute("user");
            String username = Log_user.getUser_name();
            //连接数据库
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                con = ConnectionManager.getConnection();
                String sql = "UPDATE user_info SET user_email = ? where user_name=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, new_email);
                pstmt.setString(2, username);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            finally {
                ConnectionManager.closeConnection(con);
                ConnectionManager.closeResultSet(rs);
                ConnectionManager.closeStatement(pstmt);
            }
            response.sendRedirect("Alter_userinfo.jsp");
        }
    %>
    </body>
</html>
