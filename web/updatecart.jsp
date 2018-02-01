<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/31
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="mode.CartItemBean" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
    <title>Title</title>
</head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            Map<Integer, CartItemBean> cart = (Map<Integer, CartItemBean>) session.getAttribute("cart");
            if (cart == null){
                cart = new HashMap<Integer,CartItemBean>();
                session.setAttribute("cart",cart);
            }
            //购物车删除商品
            String deletepetid = request.getParameter("delete");
            if(deletepetid != null){
                cart.remove(Integer.parseInt(deletepetid));
                response.sendRedirect("Shopping_cart.jsp");
                return;
            }
        %>
    </body>
</html>
