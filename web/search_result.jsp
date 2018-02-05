<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/2/5
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.PetDAO" %>
<%@ page import="mode.Customer" %>
<%@ page import="mode.Pet" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>搜索结果</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
</head>
<body>
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
        }
            request.setCharacterEncoding("UTF-8");
            String searchbox = request.getParameter("searchbox");
            List<Pet> searchpets = new ArrayList<Pet>();
            searchpets = PetDAO.search(searchbox);
            int searchs = searchpets.size();
            out.print("<div class = 'search_div'>");
            out.print("<div class='search_div2'>共查到 "+searchs+" 条记录</div>");
            out.print("<ul>");
            Iterator<Pet> searchit = searchpets.iterator();
            while(searchit.hasNext()){
                Pet pet = searchit.next();
                %>
                    <li class="search_li">
                    <table class="search_table">
                        <tr>
                            <td rowspan="4"><a href= "pet_detail.jsp?pet_detailname=<%=pet.getPet_name()%>"><img src=<%=pet.getPet_image()+"?t="+Math.random()%> width="200px" height="140px"></a></td>
                            <td class="search_td" colspan="2">名  称：<%=pet.getPet_name()%></td>
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
                            <td><a href="pet_detail.jsp?pet_detailname=<%=pet.getPet_name()%>">查看详情</a></td>
                        </tr>
                    </table>
                    </li>
                <%
            }
        %>
        </ul>
    </div>
    </body>
</html>
