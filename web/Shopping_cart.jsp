<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/26
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Customer" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="mode.Pet" %>
<%@ page import="mode.CartItemBean" %>
<html>
<head>
    <title>购物车</title>
</head>
    <body>
        <%
            double total = 0;
            Customer Log_user = (Customer) session.getAttribute("user");
            Map cart = (Map) session.getAttribute("cart");
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
            <div>当前购物车内容：</div>
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
        <%
            }
            if(Log_user != null){
                out.print("<a href='confirm_order.jsp'>生成订单</a>");
            }
            else {
                out.print("<a href='index.jsp'>需要登录后才能生成订单</a>");
            }
        %>
    <a href="home.jsp">返回</a>
    </body>
</html>
