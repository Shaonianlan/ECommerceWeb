<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/30
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mode.Pet" %>
<%@ page import="business.PetDAO" %>
<html>
<head>
    <title>宠物详情</title>
    <link type="text/css" rel="stylesheet" href="style.css">
</head>
    <body>
        <%
            String pet_name = request.getParameter("pet_detailname");
            Pet pet = PetDAO.getpetdetail(pet_name);
        %>
        <h2><%=pet.getPet_name()%>介绍</h2>
        <img src=<%=pet.getPet_image()%> width="640px" height="480px">
        <p><%=pet.getPet_description()%></p><br>
        <p>体型身高</p>
        <p><%=pet.getPet_height()%></p><br>
        <p>类型</p>
        <p><%=pet.getPet_type()%></p><br>
        <p>原产地</p>
        <p><%=pet.getPet_sourcearea()%></p><br>
        <p>性格</p>
        <p><%=pet.getPet_character()%></p><br>
        <p>适养人群</p>
        <p><%=pet.getPet_suitable()%></p><br>
        <p>参考价格</p>
        <p><%=pet.getPet_price()%>RMB</p><br>
        <a href="addtocart.jsp?pet_name=<%=pet_name%>">加入购物车</a><br>
        <a href="home.jsp">返回</a><br><br><br>
    </body>
</html>
