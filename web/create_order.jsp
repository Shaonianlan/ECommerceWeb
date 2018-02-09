<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/2/1
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="business.OrderDAO" %>
<html>
<head>
    <title>创建订单</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
    <meta http-equiv="refresh" content="3; url=home.jsp";>
</head>
    <body>
    <div class="total_div">
    <div class="index_form">
        <%
            request.setCharacterEncoding("UTF-8");
            Map<Integer, CartItemBean> cart = (Map<Integer,CartItemBean>)session.getAttribute("cart");
            Customer user = (Customer) session.getAttribute("user");
            String name = request.getParameter("username");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            Date dt = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if(cart != null){
                //生成订单
                Orders order = new Orders();
                order.setUser_id(Long.parseLong(user.getUser_id()));
                order.setUser_name(name);
                order.setUser_address(address);
                order.setUser_phone(phone);
                order.setOrder_time(sdf.format(dt));
                Set<Integer> Petidset = cart.keySet();
                Iterator <Integer> it = Petidset.iterator();
                while(it.hasNext()){
                    int petid = it.next();
                    CartItemBean item = cart.get(petid);
                    Pet pet = item.getpet();
                    Orderdetail orderdetail = new Orderdetail();
                    orderdetail.setPet_id((long)petid);
                    orderdetail.setPet_name(pet.getPet_name());
                    orderdetail.setQuantity((long)item.getQuantity());
                    orderdetail.setPet_price(pet.getPet_price());
                    order.addOrderdetail(orderdetail);
                }
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.createOrder(order);
                //清除购物车
                cart.clear();
                %>
        <div>恭喜你</div>
        <div>订单提交成功，3秒后自动跳转到主页</div>
        <div>或者手动返回<a href="home.jsp">  返回</a></div>
        <%
            }
        %>
    </div>
    </div>
    </body>
</html>
