<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/26
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Customer" %>
<%@ page import="java.util.*" %>
<%@ page import="mode.Pet" %>
<%@ page import="mode.CartItemBean" %>
<html>
<head>
    <title>购物车</title>
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
        <div class="cart_div">
        <%
            double total = 0;
            if(cart == null || cart.size() == 0){
                out.print("<h3 class='cart_h3'>当前购物车为空</h3>");
            }
            else {
                Set<Integer> cartitems = cart.keySet();
                Iterator<Integer> petit = cartitems.iterator();
                Pet pet;
                CartItemBean cartitem;
                int quantity;
                double price,subtotal;
        %>
            <div><h3 class="cart_h3">当前购物车内容为：</h3></div>
                <table class="cart_table">
                    <thead>
                        <tr class="cart_table_tr">
                            <th class="cart_table_td_name">宠物名称</th>
                            <th class="cart_table_td_quanity">数量</th>
                            <th class="cart_table_td">价格</th>
                            <th class="cart_table_td">小计</th>
                            <th class="cart_table_td"></th>
                        </tr>
                    </thead>
        <%
            while(petit.hasNext()){
                int petid = petit.next();
                cartitem = (CartItemBean) cart.get(petid);
                pet = cartitem.getpet();
                quantity = cartitem.getQuantity();
                price = pet.getPet_price();
                subtotal = quantity * price;
                total += subtotal;
        %>
                <tr>
                    <td class="cart_table_td_name"><%=pet.getPet_name()%></td>
                    <td class="cart_table_td_quanity"><%=quantity%></td>
                    <td class="cart_table_td"><%=price%>元</td>
                    <td class="cart_table_td"><%=subtotal%>元</td>
                    <td class="cart_table_td"><a href='updatecart.jsp?delete=<%=petid%>'>删除</a></td>
                </tr>
        <%
            }
        %>
                <tr>
                    <td colspan='5' class="cart_table_td">总计：<%=total%>元</td>
                </tr>
            </table>
        <%
            out.print("<div class='cart_div2'>");
            if(Log_user != null){
                out.print("<a href='confirm_order.jsp' class='cart_a'>生成订单</a>");
            }
            else {
                out.print("<a href='index.jsp' class='cart_aa'>需要登录后才能生成订单</a>");
            }
            out.print("</div>");
        }
        %>
        <a href="home.jsp" class="cart_a2">返回</a>
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
