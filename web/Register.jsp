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
    <div class="index_div">
        <form action="Register_work.jsp" method="post" name="form_Reg" class="index_form">
            <div>
                <h2 class="index_h2">Register</h2>
                <h5 class="Register_h5">请输入正确的手机号码和邮箱</h5>
                <input type="text" name="username" id="username" placeholder="用户名" required="required" class="Register_input" autofocus="">
                <input type="text" name="password" id="password" placeholder="密码" required="required" class="Register_input">
                <input type="text" name="confirmpassword" id="confirmpassword" placeholder="确认密码" required="required" class="Register_input"><span class="warning" id="showpassswordd"></span>
                <div class="Register_div">
                性别：
                <input type="radio" name="sex" value="男" checked>男
                <input type="radio" name="sex" value="女">女
                </div>
                <input type="text" name="phonenum" id="phonenum" placeholder="手机号" required="required" class="Register_input"><span class="warning" id="showphone"></span>
                <input type="text" name="email" id="email" placeholder="邮箱" required="required" class="Register_input"><span class="warning" id="showemail"></span>
                <textarea name="address" id="address" cols="40" rows="5" placeholder="收货地址" required="required" class="Register_textarea"></textarea>
                <input type="submit" value="注册"  onclick="return check_reg();" class="form_button">
                <a href="index.jsp">返回</a>
            </div>
        </form>
    </div>
    </body>
</html>
