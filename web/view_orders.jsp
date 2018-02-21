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
        <%
            List<Orders> orderslist = new ArrayList<Orders>();
            orderslist = OrderDAO.getOrdersByuserId(Long.parseLong(Log_user.getUser_id()));
            int orderlist_size = orderslist.size();
            out.print("<div class = 'height'></div>");
            out.print("<div class='view_div'>共查到 "+orderlist_size+" 条订单记录  (订单状态：1:新订单 2:已核对 3:已发货 4:已收货 5:拒收 6:完成)</div>");
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
                                <div>订单状态：<%=order.getOrder_status()%></div>
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
