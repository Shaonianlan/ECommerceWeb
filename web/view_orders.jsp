<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/2/9
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Customer" %>
<%@ page import="java.util.*" %>
<%@ page import="mode.Orders" %>
<%@ page import="business.OrderDAO" %>
<%@ page import="mode.Orderdetail" %>
<html>
<head>
    <title>查看订单</title>
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
            List<Orders> orderslist = new ArrayList<Orders>();
            orderslist = OrderDAO.getOrdersByuserId(Long.parseLong(Log_user.getUser_id()));
            int orderlist_size = orderslist.size();
            out.print("<div class = 'height'></div>");
            out.print("<div class='view_div'>共查到 "+orderlist_size+" 条订单记录</div>");
            out.print("<ul class='view_ul'>");
            Iterator<Orders> ordersit = orderslist.iterator();
            while(ordersit.hasNext()){
                Orders order = ordersit.next();
            %>
                <li class="view_li">
                    <table>
                        <tr>
                            <td rowspan="6">
                                <div>订单号：<%=order.getOrder_id()%></div>
                                <div>订单时间：<%=order.getOrder_time()%></div>
                                <div>总金额：<%=order.getOrder_price()%>元</div>
                                <div>收货人：<%=order.getUser_name()%></div>
                                <div>收货地址：<%=order.getUser_address()%></div>
                                <div>收货人联系电话：<%=order.getUser_phone()%></div>
                            </td>
                            <td class="view_td">
                                <table class="view_table">
                                    <tr class="view_tr">
                                        <th class="view_tdhead">清单</th>
                                        <th class="view_td2">宠物名称</th>
                                        <th class="view_td2">数量</th>
                                        <th class="view_td2">价格</th>
                                        <th class="view_td2">小计</th>
                                    </tr>
                                    <%
                                        List<Orderdetail> orderdetaillist = new ArrayList<Orderdetail>();
                                        orderdetaillist = OrderDAO.getOrderdetailByorderid(order.getOrder_id());
                                        Iterator<Orderdetail> orderdetailit = orderdetaillist.iterator();
                                        while(orderdetailit.hasNext()){
                                            Orderdetail orderdetail = orderdetailit.next();
                                            String o = orderdetail.getPet_name();
                                    %>
                                    <tr class="view_tr">
                                        <td></td>
                                        <td class="view_td2"><%=orderdetail.getPet_name()%></td>
                                        <td class="view_td2"><%=orderdetail.getQuantity()%></td>
                                        <td class="view_td2"><%=orderdetail.getPet_price()%>元</td>
                                        <td class="view_td2"><%=orderdetail.getQuantity()*orderdetail.getPet_price()%>元</td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </td>
                        </tr>
                        <tr></tr>
                    </table>
                </li>
            <%
            }
        }
        %>
        </ul>
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
