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
    <script type="text/javascript" src="jquery-3.3.1.js"></script>
    <script type="text/javascript" src="my_jquery.js"></script>
    <script src="Check.js?ver=1"></script>
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
            <span class="left_float"><a href="home.jsp" class="a_color">Welcome to Happy Pet！</a></span>
            <a href='Shopping_cart.jsp' target='_blank'class='home_aa'>购物车</a>
            <a href='index.jsp'class='home_a'>登陆</a>
        </div>
        <%
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
        <%
            }
            String pet_name = request.getParameter("pet_detailname");
            Pet pet = PetDAO.getpetdetail(pet_name);
            Long num = PetDAO.getpet_popularity(pet_name);
        %>
        <div class="pet_div1">
            <div class="pet_pic">
                <img src=<%=pet.getPet_image()%> width="640px" height="480px">
            </div>
            <div class="pet_div2">
                <div class="pet_div4">
                    <span class="pet_h2" id="petname"><%=pet_name%></span>
                    <ul class="pet_ul">
                        <li id="show_like" class="pet_li"><%=num%></li>
                        <li class="pet_li">人气值</li>
                    </ul>
                </div>
                <div class="pet_div3">
                    <h4>体型身高</h4>
                    <div><%=pet.getPet_height()%></div>
                </div>
                <div class="pet_div3">
                    <h4>类型</h4>
                    <div><%=pet.getPet_type()%></div>
                </div>
                <div class="pet_div3">
                    <h4>寿命</h4>
                    <div><%=pet.getPet_life()%></div>
                </div>
                <div class="pet_div3">
                    <h4>原产地</h4>
                    <div><%=pet.getPet_sourcearea()%></div>
                </div>
                <div class="pet_div3">
                    <h4>参考价格</h4>
                    <div><%=pet.getPet_price()%>RMB</div>
                </div>
                <input type="button" onclick="like_pet();" value="❤" class="pet_button" id="button_like">
                <input type="button" onclick="addtocart();" value="加入购物车" class="pet_button_add" id="button_addcart">
                <a href="addtocart.jsp?pet_name=<%=pet_name%>" class="pet_a">立即购买</a>
                <div id="like_tag"></div>
            </div>
            <div class="clear"></div>
            <div class="pet_div3_first">
                <h4>概述</h4>
                <div><%=pet.getPet_description()%></div>
            </div>
            <div class="pet_div3">
                <h4>性格</h4>
                <div><%=pet.getPet_character()%></div>
            </div>
            <div class="pet_div3">
                <h4>适养人群</h4>
                <div><%=pet.getPet_suitable()%></div>
            </div>
        </div>
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
