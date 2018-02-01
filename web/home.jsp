<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/21
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.PetDAO" %>
<%@ page import="mode.Customer" %>
<%@ page import="mode.Pet" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Happy Pet</title>
</head>
    <body>
        <%
            Customer Log_user = (Customer) session.getAttribute("user");

            Date date =new Date();
            SimpleDateFormat sdf =new SimpleDateFormat("HH");
            int time=Integer.parseInt(sdf.format(date));
            String show;
            if(time >= 6 && time < 11){
                show = "上午好";
            }
            else if(time >= 11 && time < 13){
                show = "中午好";
            }
            else if (time >= 13 && time < 18){
                show = "下午好";
            }
            else{
                show = "晚上好";
            }

            Map cart = (Map)session.getAttribute("cart");
            if (cart == null){
                cart = new HashMap();
                session.setAttribute("cart",cart);
            }
            int cartitemsnum = cart.size();
            if(Log_user == null){
                out.print("<a href='index.jsp'>登陆</a><br>");
                out.print("<a href='Shopping_cart.jsp' target='_blank'>购物车</a><br>");
                out.print("<h4>所有宠物</h4>");
            }
            else {
        %>
            <%=Log_user.getUser_name()%>, <%=show%>
            <a href='Logout.jsp'>注销</a><br>
            <a href='Alter_userinfo.jsp'>修改个人信息</a><br>
            <a href='Shopping_cart.jsp' target="_blank">购物车</a><br>
            <span>您的购物车里共有 <%=cartitemsnum%> 种宠物</span><br><br>
            <h4>所有宠物</h4>
        <%
            }
            List<Pet> petlist = new ArrayList<Pet>();
            petlist = PetDAO.getPet();
            for (int i = 0; i < petlist.size(); i++){
        %>
        <div>
            <dl>
                <dt><a href= "pet_detail.jsp?pet_detailname=<%=petlist.get(i).getPet_name()%>" ><img src=<%=petlist.get(i).getPet_image()%> width="160px" height="120px"></a> </dt>
                <dd><a href= "pet_detail.jsp?pet_detailname=<%=petlist.get(i).getPet_name()%>" ><%=petlist.get(i).getPet_name()%></a> </dd>
            </dl>
        </div>
        <%
            }
        %>
    </body>
</html>
