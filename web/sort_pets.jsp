<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/2/13
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.PetDAO" %>
<%@ page import="mode.Customer" %>
<%@ page import="mode.Pet" %>
<%@ page import="java.util.*" %>
<%@ page import="business.OrderDAO" %>
<html>
<head>
    <title>宠物排序</title>
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
    %>
    <div class="home_head">
        <span class="left_float"><a href="home.jsp" class="a_color">Welcome to Happy Pet！</a></span>
        <a href='Shopping_cart.jsp' target='_blank'class='home_a'>购物车</a>
        <a href='index.jsp'class='home_a'>登陆</a>
    </div>
    <%
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
        }
        request.setCharacterEncoding("UTF-8");
        String sortstyle = request.getParameter("sortstyle");
        String sortorder = request.getParameter("sortorder");
        out.print("<div class = 'search_div'>");
        String urldesc = "sort_pets.jsp?sortstyle="+sortstyle+"&sortorder=desc";
        String urlasc = "sort_pets.jsp?sortstyle="+sortstyle+"&sortorder=asc";
        out.print("<div class='search_div2'><a href='"+urlasc+"'>升序排序</a><a href='"+urldesc+"'class='search_div2_a'>降序排序</a></div>");
        out.print("<ul>");
        List<Pet> sortpets = new ArrayList<Pet>();
        if(sortstyle.equals("popularity")){
            if(sortorder.equals("desc")){
                sortpets = PetDAO.getpopsortPet_desc();
            }
            else {
                sortpets = PetDAO.getpopsortPet_asc();
            }
        }
        else if(sortstyle.equals("price")){
            if(sortorder.equals("asc")){
                sortpets = PetDAO.getpricesortPet_asc();
            }
            else {
                sortpets = PetDAO.getpricesortPet_desc();
            }
        }
        else if(sortstyle.equals("sales")){
            if(sortorder.equals("asc")){
                sortpets = PetDAO.getpet_sales_asc();
            }
            else {
                sortpets = PetDAO.getpet_sales_desc();
            }
        }
        Iterator<Pet> sortit = sortpets.iterator();
        while(sortit.hasNext()){
            Pet pet = sortit.next();
    %>
    <li class="search_li">
        <table class="search_table">
            <tr>
                <td rowspan="4"><a href= "pet_detail.jsp?pet_detailname=<%=pet.getPet_name()%>"><img src=<%=pet.getPet_image()+"?t="+Math.random()%> width="200px" height="140px"></a></td>
                <td class="search_td">名  称：<%=pet.getPet_name()%></td>
                <td class="search_tdred">人  气：<%=PetDAO.getpet_popularity(pet.getPet_name())%></td>
                <td class="search_td" rowspan="3">参考价格：<em class="search_em"><%=pet.getPet_price()%>元 </em></td>
            </tr>
            <tr>
                <td class="search_td">种  类：<%=pet.getPet_type()%></td>
            </tr>
            <tr>
                <td class="search_td">原产地：<%=pet.getPet_sourcearea()%></td>
                <td class="search_td">寿  命：<%=pet.getPet_life()%></td>
            </tr>
            <tr>
                <td class="search_td">销  量：<%=PetDAO.getpet_salesbypetname(pet.getPet_name())%></td>
                <td><a href="pet_detail.jsp?pet_detailname=<%=pet.getPet_name()%>">查看详情</a></td>
            </tr>
        </table>
    </li>
    <%
        }
    %>
</div>
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

