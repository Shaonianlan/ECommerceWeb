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
</head>
    <body>
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
            }
            response.sendRedirect("home.jsp");
        %>
    </body>
</html>
