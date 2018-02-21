<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/21
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.CustomerDAO" %>
<%@ page import="mode.Customer" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>修改个人信息</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
    <script type="text/javascript" src="jquery-3.3.1.js"></script>
    <script type="text/javascript" src="my_jquery.js"></script>
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
            <ul class="home_ulhead">
                <li class="left_float"><a href="home.jsp" class="a_color">Welcome to Happy Pet！</a></li>
                <li class="home_aa">您的购物车里共有 <%=cartitemsnum%> 种宠物</li>
                <li class="home_a"><a href='Shopping_cart.jsp' target="_blank">购物车</a></li>
                <li class="home_at" id="user_menu">
                    <a href='Alter_userinfo.jsp' ><%=Log_user.getUser_name()%></a>
                    <ul class="usermenu_list">
                        <li class="usermenu_list_li"><a href="view_orders.jsp">查看订单</a></li>
                        <li class="usermenu_list_li"><a href="Alter_userinfo.jsp">个人信息</a></li>
                        <li><a href="Logout.jsp">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="index_form">
            <%
                Log_user = CustomerDAO.getLoginInfo(Log_user.getUser_name());
                out.print("<div>用户名："+Log_user.getUser_name()+"</div>");
                out.print("<div>性别："+Log_user.getUser_sex()+"</div>");
                out.print("<div>注册时间:"+Log_user.getUser_createtime()+"</div>");
                out.print("<div>手机号："+Log_user.getUser_phone()+"<a href='alter_phonenum.jsp'>    修改</a></div>");
                out.print("<div>邮箱："+Log_user.getUser_email()+"<a href='alter_email.jsp'>    修改</a></div>");
                out.print("<div>发货地址："+Log_user.getUser_address()+"<a href='alter_address.jsp'>  修改</a></div>");
            %>
            <div><a href="alter_password.jsp">修改密码</a></div>
            <a href="home.jsp">返回</a>
        </div>
        <%
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
