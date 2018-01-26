<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/20
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="util.ConnectionManager" %>
<html>
<head>
    <title>REGISTER</title>
</head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String user_name = request.getParameter("username");
            String user_password = request.getParameter("password");
            String sex = request.getParameter("sex");
            String phonenum = request.getParameter("phonenum");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                con = ConnectionManager.getConnection();
                String sql = "SELECT user_name from user_info where user_name=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, user_name);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    out.print("用户名已存在，请重新输入");
                    out.print("<a href='Register.jsp'>返回</a>");
                } else {
                    sql = "insert into user_info (user_name,user_password,user_sex,user_phone,user_email,user_address,user_createtime) VALUES " +
                            "(?,?,?,?,?,?,?)";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, user_name);
                    pstmt.setString(2, user_password);
                    pstmt.setString(3, sex);
                    pstmt.setString(4, phonenum);
                    pstmt.setString(5, email);
                    pstmt.setString(6, address);
                    Date dt = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    pstmt.setString(7, sdf.format(dt));
                    pstmt.executeUpdate();
                    out.print("恭喜你，注册成功");
                    out.print("<a href='index.jsp'>登陆</a>");
                }
            }
            catch (SQLException e){
                e.printStackTrace();
            }
            finally {
                ConnectionManager.closeConnection(con);
                ConnectionManager.closeResultSet(rs);
                ConnectionManager.closeStatement(pstmt);
            }
        %>
    </body>
</html>
