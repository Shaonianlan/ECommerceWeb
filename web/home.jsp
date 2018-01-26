<%@ page import="mode.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/21
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.CustomerDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionManager" %>
<%@ page import="business.PetDAO" %>
<%@ page import="mode.Pet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Happy Pet</title>
</head>
    <body>
        <%
            Customer Log_user = (Customer) session.getAttribute("user");
            if(Log_user == null){
                out.print("<a href='index.jsp'>登陆</a>");
            }
            else {
                out.print(Log_user.getUser_name() + " ," + CustomerDAO.getHello() + "    ");
                out.print("<a href='Logout.jsp'>注销</a><br>");
                out.print("<a href='Alter_userinfo.jsp'>修改个人信息</a><br>");
                out.print("<a href='Shopping_cart.jsp'>购物车</a>");
            }
            PetDAO getpet = new PetDAO();
            List<Pet> petlist = new ArrayList<Pet>();
            petlist = getpet.getPet();
            for (int i = 0; i < petlist.size(); i++){
                out.print("<div>");
                out.print("<img src="+petlist.get(i).getPet_image()+">");
                out.print("<ul>");
                out.print("<li><strong>编号："+petlist.get(i).getPet_id()+"</li>");
                out.print("<li><strong>名称："+petlist.get(i).getPet_name());
                out.print("<li><strong>简介："+petlist.get(i).getPet_description());
                out.print("<li><strong>高度/体重："+petlist.get(i).getPet_height());
                out.print("<li><strong>原产地："+petlist.get(i).getPet_sourcearea());
                out.print("<li><strong>库存："+petlist.get(i).getPet_stock());
                out.print("<li><strong>类型："+petlist.get(i).getPet_type());
                out.print("<li><strong>品种："+petlist.get(i).getPet_variety());
                out.print("</div>");
            }
        %>
    </body>
</html>
