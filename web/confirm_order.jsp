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
<%@ page import="mode.Pet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="mode.Orders" %>
<html>
<head>
    <title>确认订单</title>
</head>
    <body>
    <div class="total_div">
    <%
        double total = 0;
        Customer Log_user = (Customer) session.getAttribute("user");
        Map cart = (Map) session.getAttribute("cart");
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(cart == null || cart.size() == 0){
            out.print("<p>当前购物车为空。</p>");
        }
        else {
            Set<Integer> cartitems = cart.keySet();
            Iterator<Integer> petit = cartitems.iterator();
            Pet pet;
            CartItemBean cartitem;
            int quantity;
            double price,subtotal;
    %>
        <div>宠物购买清单：</div>
        <form action="create_order.jsp" method="post">
            <table>
                <thead>
                <tr>
                    <th>宠物名称</th>
                    <th>数量</th>
                    <th>价格</th>
                    <th>小计</th>
                    <th></th>
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
                    <td><%=pet.getPet_name()%></td>
                    <td><%=quantity%></td>
                    <td><%=price%></td>
                    <td><%=subtotal%></td>
                    <td><a href='updatecart.jsp?delete=<%=petid%>'>删除</a></td>
                </tr>
    <%
                }
    %>
                <tr>
                    <td colspan='5' align='right'>总计：<%=total%></td>
                </tr>
            </table>
            <div>确认卖家信息</div>
            <table>
                <tr>
                    <td>收货人姓名：</td>
                    <td><input type="text" name="username" value=<%=Log_user.getUser_name()%>></td>
                </tr>
                <tr>
                    <td>收货地址：</td>
                    <td><input type="text" name="address" value=<%=Log_user.getUser_address()%>></td>
                </tr>
                <tr>
                    <td>收货人手机号：</td>
                    <td><input type="text" name="phone" value=<%=Log_user.getUser_phone()%>></td>
                </tr>
                <tr>
                    <td>下单时间：</td>
                    <td><%=sdf.format(dt)%></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="确定"></td>
                </tr>
            </table>
        </form>
    <%
        }
    %>
    </div>
    </body>
</html>
