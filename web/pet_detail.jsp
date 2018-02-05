<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/30
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.PetDAO" %>
<%@ page import="mode.Customer" %>
<%@ page import="mode.Pet" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>宠物详情</title>
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
            if(Log_user == null){
        %>
        <div class="home_head">
            <span class="left_float">Welcome to Happy Pet！</span>
            <a href='Shopping_cart.jsp' target='_blank'class='home_a'>购物车</a>
            <a href='index.jsp'class='home_a'>登陆</a><br>
        </div>
        <%
        }
        else {
        %>
        <div class="home_head">
            <span class="left_float">欢迎来到Happy Pet！</span>
            <span class="home_a">您的购物车里共有 <%=cartitemsnum%> 种宠物</span>
            <a href='Shopping_cart.jsp' target="_blank" class="home_a">购物车</a>
            <a href='Logout.jsp' class="home_a">注销</a>
            <a href='Alter_userinfo.jsp' class="home_a" ><%=Log_user.getUser_name()%></a><br>
        </div>
        <%
            }
            String pet_name = request.getParameter("pet_detailname");
            Pet pet = PetDAO.getpetdetail(pet_name);
        %>
        <div class="pet_div1">
            <h2><%=pet.getPet_name()%>介绍</h2>
            <img src=<%=pet.getPet_image()%> width="640px" height="480px">
            <p><%=pet.getPet_description()%></p><br>
            <p>体型身高</p>
            <p><%=pet.getPet_height()%></p><br>
            <p>类型</p>
            <p><%=pet.getPet_type()%></p><br>
            <p>原产地</p>
            <p><%=pet.getPet_sourcearea()%></p><br>
            <p>性格</p>
            <p><%=pet.getPet_character()%></p><br>
            <p>适养人群</p>
            <p><%=pet.getPet_suitable()%></p><br>
            <p>参考价格</p>
            <p><%=pet.getPet_price()%>RMB</p><br>
            <a href="addtocart.jsp?pet_name=<%=pet_name%>">加入购物车</a><br>
            <a href="home.jsp">返回</a><br><br><br>
        </div>
    </div>
    </body>
</html>
