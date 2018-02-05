<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/30
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Pet" %>
<%@ page import="business.PetDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="mode.CartItemBean" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
    <body>
        <%
            String pet_name = request.getParameter("pet_name");
            Pet pet = PetDAO.getpetdetail(pet_name);
            int pet_id = Integer.parseInt(pet.getPet_id().toString());
            Map cart = (Map) session.getAttribute("cart");
            if (pet == null){
                request.getRequestDispatcher("home.jsp");
            }
            if(cart == null){
                cart = new HashMap();
                session.setAttribute("cart",cart);
            }
            CartItemBean cartitem = (CartItemBean) cart.get(pet_id);
            if (cartitem != null){
                cartitem.setQuantity(cartitem.getQuantity()+1);
            }
            else{
                cart.put(pet_id , new CartItemBean(pet , 1));
            }
            response.sendRedirect("Shopping_cart.jsp");
        %>
    </body>
</html>
