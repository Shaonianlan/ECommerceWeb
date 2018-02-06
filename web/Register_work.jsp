<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/20
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" import="java.text.SimpleDateFormat" %>
<%@ page import="business.CustomerDAO" %>
<html>
<head>
    <title>REGISTER</title>
    <link type="text/css" rel="stylesheet" href="style/style.css">
    <meta http-equiv="refresh" content="3; url=index.jsp";>
    <script language="javascript">
        //防止页面后退
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
    </script>
</head>
    <body>
    <div class="index_form">
        <%
            request.setCharacterEncoding("UTF-8");
            String user_name = request.getParameter("username");
            String user_password = request.getParameter("password");
            String sex = request.getParameter("sex");
            String phonenum = request.getParameter("phonenum");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            CustomerDAO.DoRegister(user_name,user_password,sex,phonenum,email,address);
        %>
        <div>恭喜你</div>
        <div>注册成功，3秒后自动跳转到登陆界面。</div>
        <div>或者手动登陆<a href="index.jsp">  登陆</a></div>
    </div>
    </body>
</html>
