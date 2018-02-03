<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/21
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.PetDAO" %>
<%@ page import="mode.Customer" %>
<%@ page import="mode.Pet" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Happy Pet</title>
    <link type="text/css" rel="stylesheet" href="style.css">
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
                <span class="left_float">Welcome to Happy Pet！</span>
                <span class="home_a">您的购物车里共有 <%=cartitemsnum%> 种宠物</span>
                <a href='Shopping_cart.jsp' target="_blank" class="home_a">购物车</a>
                <a href='Logout.jsp' class="home_a">注销</a>
                <a href='Alter_userinfo.jsp' class="home_a" ><%=Log_user.getUser_name()%></a><br>
            </div>
        <%
            }
        %>
            <div class="home_div4">所有宠物</div>
            <div class="home_div3">
                <span>小型犬</span>
                <span>中型犬</span>
                <span>大型犬</span>
            </div>
        <%
            List<Pet> petlist = new ArrayList<Pet>();
            petlist = PetDAO.getPet();
            out.print("<div class='home_div2'>");
            for (int i = 0; i < petlist.size(); i++){
                //图片后加随机数，让浏览器以为每次请求不同
        %>
                <dl class="home_dl">
                    <dt class="home_dt"><a href= "pet_detail.jsp?pet_detailname=<%=petlist.get(i).getPet_name()%>" ><img src=<%=petlist.get(i).getPet_image()+"?t="+Math.random()%> width="160px" height="120px"></a> </dt>
                    <dd class="home_dd"><a href= "pet_detail.jsp?pet_detailname=<%=petlist.get(i).getPet_name()%>" ><%=petlist.get(i).getPet_name()%></a> </dd>
                </dl>
        <%
            }
        %>
        </div>
        <div class="clear"></div>
        <div class="height"></div>
        <div>
    </div>
    </body>
</html>
