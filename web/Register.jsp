<%--
  Created by IntelliJ IDEA.
  User: 10096
  Date: 2018/1/18
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link type="text/css" rel="stylesheet" href="style.css">
    <script src="Check.js?ver=1"></script>
</head>
    <body>
    <h2>注册新用户</h2>
    <h5>*请输入正确的手机号码和邮箱</h5>
        <form action="Register_work.jsp" method="post" name="form_Reg" >
            <p>
                用户名：
                <input type="text" name="username" id="username" value=""><span class="warning" id="showname"></span><br>
            </p>
            <p>
                密码：
                <input type="text" name="password" id="password" value=""><span class="warning" id="showpasssword"></span><br>
            </p>
            <p>
                确认密码：
                <input type="text" name="confirmpassword" id="confirmpassword" value=""><span class="warning" id="showpassswordd"></span><br>
            </p>
            <p>
                性别：
                <input type="radio" name="sex" value="男" checked>男 &nbsp;
                <input type="radio" name="sex" value="女">女<br>
            </p>
            <p>
                手机号码：
                <input type="text" name="phonenum" id="phonenum" value=""><span class="warning" id="showphone"></span><br>
            </p>
            <p>
                邮箱：
                <input type="text" name="email" id="email" value=""><span class="warning" id="showemail"></span><br>
            </p>
            <p>
                常住地址：<br>
                <textarea name="address" id="address" cols="40" rows="5"></textarea>"<span class="warning" id="showaddress"></span>
            </p>
            <input type="submit" value="注册"  onclick="return check_reg();" >
        </form>
        <a href="index.jsp">返回</a>
    </body>
</html>
