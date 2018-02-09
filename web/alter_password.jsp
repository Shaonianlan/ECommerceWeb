<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/22
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.CustomerDAO" %>
<%@ page import="mode.Customer" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>修改密码</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
    <body>
    <div class="total_div">
        <%
            Customer Log_user = (Customer) session.getAttribute("user");
            Map cart = (Map)session.getAttribute("cart");
            if (cart == null){
                cart = new HashMap();
                session.setAttribute("cart",cart);
            }
            int cartitemsnum = cart.size();
            List<String> pettypelist = new ArrayList<String>();
            if(Log_user == null){
                response.sendRedirect("home.jsp");
            }
            else {
        %>
        <div class="home_head">
            <span class="left_float">Welcome to Happy Pet！</span>
            <span class="home_a">您的购物车里共有 <%=cartitemsnum%> 种宠物</span>
            <a href='Shopping_cart.jsp' target="_blank" class="home_a">购物车</a>
            <a href='Logout.jsp' class="home_a">注销</a>
            <a href='Alter_userinfo.jsp' class="home_a" ><%=Log_user.getUser_name()%></a><br>
        </div>
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
        }
        %>
        <div class="clear"></div>
        <div class="height2"></div>
        <div class="tail">
            <div class="height"></div>
            <div>本网站仅为课程设计使用，其真实性、合法性本网站不提供任何保证，亦不承担任何法律责任！</div>
        </div>
        <div class="height"></div>
    </div>
    </body>
</html>
