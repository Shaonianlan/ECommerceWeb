<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/2/1
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.CartItemBean" %>
<%@ page import="mode.Customer" %>
<%@ page import="mode.Orders" %>
<%@ page import="mode.Pet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>确认订单</title>
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
        <%
            }
        out.print("<div class='cart_div'>");
        double total = 0;
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(cart != null || cart.size() != 0) {
            Set<Integer> cartitems = cart.keySet();
            Iterator<Integer> petit = cartitems.iterator();
            Pet pet;
            CartItemBean cartitem;
            int quantity;
            double price,subtotal;
    %>
        <div class="cart_h3">宠物购买清单：</div>
        <form action="create_order.jsp" method="post" >
            <table class="cart_table">
                <thead>
                <tr class="cart_table_tr">
                    <th class="cart_table_td_name">宠物名称</th>
                    <th class="cart_table_td_quanity">数量</th>
                    <th class="cart_table_td">价格</th>
                    <th class="cart_table_td">小计</th>
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
            Orders order = new Orders();
            order.setOrder_price(total);
    %>
                <tr>
                    <td class="cart_table_td_name"><%=pet.getPet_name()%></td>
                    <td class="cart_table_td_quanity"><%=quantity%></td>
                    <td class="cart_table_td"><%=price%>元</td>
                    <td class="cart_table_td"><%=subtotal%>元</td>
                </tr>
    <%
                }
    %>
                <tr>
                    <td colspan='4' class="cart_table_td">总计：<%=total%>元</td>
                </tr>
            </table>
            <div class="height"></div>
            <div class="order_div">确认卖家信息:</div>
            <table class="order_user_table">
                <tr>
                    <td>收货人姓名：</td>
                    <td><input type="text" name="username" value=<%=Log_user.getUser_name()%> class="order_user_table_tr"></td>
                </tr>
                <tr>
                    <td>收货地址：</td>
                    <td><input type="text" name="address" value=<%=Log_user.getUser_address()%> class="order_user_table_tr"></td>
                </tr>
                <tr>
                    <td>收货人手机号：</td>
                    <td><input type="text" name="phone" value=<%=Log_user.getUser_phone()%> class="order_user_table_tr" id="new_phone"></td>
                </tr>
                <tr>
                    <td>下单时间：</td>
                    <td><%=sdf.format(dt)%></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="确定" class="order_submit" onclick="return check_newphone();"></td>
                </tr>
            </table>
        </form>
    <%
        }
    %>
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
