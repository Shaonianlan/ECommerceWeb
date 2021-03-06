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
<html>
<head>
    <title>Happy Pet</title>
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
                <a href='Shopping_cart.jsp' target='_blank'class='home_aa'>购物车</a>
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
                            <li class="usermenu_list_li"><a href="view_orders.jsp" target="_blank">查看订单</a></li>
                            <li class="usermenu_list_li"><a href="Alter_userinfo.jsp" target="_blank">个人信息</a></li>
                            <li><a href="Logout.jsp">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        <div class="clear"></div>
        <%
            }
        %>
        <div class="home_menu">
            <ul>
                <li class="home_li3_first"><a href="" class="home_a2">首页</a></li>
                <li class="home_li3"><a href="" class="home_a2">宠物资讯</a></li>
                <li class="home_li3"><a href="" class="home_a2">宠物训练</a></li>
                <li class="home_li3"><a href="" class="home_a2">血统查询</a></li>
                <li class="home_li3"><a href="" class="home_a2">宠物用品</a></li>
                <li class="home_li4"><a href="" class="home_a2">客服通</a></li>
            </ul>
        </div>
        <div class="home_div1">
            <div class="home_divl">
                <div class="height2"></div>
            <h3 class="home_h3">人气榜</h3>
            <ul class="home_ul">
                <%
                    List<String> poppets = new ArrayList<String>();
                    poppets = PetDAO.getpoppets();
                    Iterator<String> popit = poppets.iterator();
                    int tag = 0;
                    while(popit.hasNext()){
                        tag += 1;
                        String temp =popit.next();
                        if(tag <= 3){
                            out.print("<li class='home_li6'><a href= 'pet_detail.jsp?pet_detailname="+temp+"' class='home_a3' target='_blank'>"+temp+"</a></li>");
                        }
                        else {
                            out.print("<li class='home_li6'><a href= 'pet_detail.jsp?pet_detailname="+temp+"' class='home_a3_else' target='_blank'>"+temp+"</a></li>");
                        }
                    }
                %>
            </ul>
            </div>
            <button class="home_btnl" id="left"><</button>
            <div class="home_pic">
                <div class="home_imgbox" id="imgbox">
                    <div class="home_img"><a href="pet_detail.jsp?pet_detailname=金毛" target="_blank"><img src="/image/dog24_1.jpg"></a> </div>
                    <div class="home_img"><a href="pet_detail.jsp?pet_detailname=柴犬" target="_blank"><img src="/image/dog10_1.jpg"></a></div>
                    <div class="home_img"><a href="pet_detail.jsp?pet_detailname=英国斗牛犬" target="_blank"><img src="/image/dog9_1.jpg"></a></div>
                    <div class="home_img"><a href="pet_detail.jsp?pet_detailname=拉布拉多犬" target="_blank"><img src="/image/dog3_1.jpg"></a></div>
                    <div class="home_img"><a href="pet_detail.jsp?pet_detailname=哈士奇" target="_blank"><img src="/image/dog14_1.jpg"></a></div>
                </div>
            </div>
            <button class="home_btnr" id="right">></button>
        </div>
        <div class="clear"></div>
        <div class="height"></div>
        <div class="height2"></div>
        <div class="home_div4">
            <form action="search_result.jsp" target="_blank">
                <span class="home_chap">所有宠物</span>
                <input type="text" name="searchbox" placeholder="宠物的名字" required="required" class="home_input">
                <input type="submit" value="搜索" class="home_button">
            </form>
        </div>
        <div class="home_div">
            <ul>
                <li class="home_li5_first"><a href="sort_pets.jsp?sortstyle=popularity&sortorder=desc">人气排行</a> </li>
                <li class="home_li5"><a href="sort_pets.jsp?sortstyle=sales&sortorder=desc">销量排行</a></li>
                <li class="home_li5"><a href="sort_pets.jsp?sortstyle=price&sortorder=asc">价格排行</a></li>
            </ul>
        </div>
        <div class="home_typediv">
        <ul>
        <%
            pettypelist = PetDAO.getpettype();
            Iterator<String> it = pettypelist.iterator();
            while(it.hasNext()){
                String type = it.next();
                out.print("<li class='home_li'>"+type+"</li>");
                List<String> petbytype = new ArrayList<String>();
                petbytype = PetDAO.getpet_bytype(type);
                Iterator<String> typeit = petbytype.iterator();
                out.print("<ul>");
                while(typeit.hasNext()){
                    String typepet = typeit.next();
                    out.print("<a href= 'pet_detail.jsp?pet_detailname="+typepet+"'class='a_color'><li class='home_li2'>"+typepet+"</li></a>");
                }
                out.print("</ul>");
            }
        %>
            </ul>
            </div>
        <%
            List<Pet> petlist = new ArrayList<Pet>();
            petlist = PetDAO.getPet();
            out.print("<div class='home_div2'>");
            for (int i = 0; i < petlist.size(); i++){
                //图片后加随机数，让浏览器以为每次请求不同(缓存)
        %>
                <dl class="home_dl">
                    <dt class="home_dt"><a href= "pet_detail.jsp?pet_detailname=<%=petlist.get(i).getPet_name()%>" target="_blank"><img src=<%=petlist.get(i).getPet_image()+"?t="+Math.random()%> width="180px" height="120px"></a> </dt>
                    <dd class="home_dd"><a href= "pet_detail.jsp?pet_detailname=<%=petlist.get(i).getPet_name()%>" class="a_color" target="_blank"><%=petlist.get(i).getPet_name()%></a> </dd>
                </dl>
        <%
            }
        %>
        </div>
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
