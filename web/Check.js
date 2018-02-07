/**
 * Created by 10096 on 2018/1/19.
 */
//ajax异步验证用户名是否存在
var xmlhttp = new XMLHttpRequest();
var username_flag = false;

function check_username(){
    var name = document.getElementById("username").value;
    if(name != ""){
        var url = "Register_work_checkname.jsp?username="+name+"&time="+new Date().getTime();
        xmlhttp.open("get", url, true);
        xmlhttp.onreadystatechange = callback;
        xmlhttp.send(null);

    }
}
function callback() {
    if(xmlhttp.readyState == 4){
        if(xmlhttp.status == 200){
            if(xmlhttp.responseText == "false"){
                document.getElementById("checkusername").innerHTML = "<span class='warning'>用户名被占用</span>";
                username_flag = false;
            }
            else{
                document.getElementById("checkusername").innerHTML = "<span class='warning2'>用户名可用</span>";
                username_flag = true;
            }

        }
    }
}

//注册验证
function check_reg(){
    var userpass_flag = true;
    var userphonenum_flag = true;
    var useremail_flag = true;
    var password1 = document.form_Reg.password.value;
    var password2 = document.form_Reg.confirmpassword.value;
    var phonenum = document.form_Reg.phonenum.value;
    var email = document.form_Reg.email.value;

    //判断用户名是否可用
    if(!username_flag){
        document.getElementById("checkusername").innerHTML = "<span class='warning'>用户名不可用</span>";
    }

    //判断两次输入的密码是否相同
    if(password2 != password1){
        document.getElementById("showpassswordd").innerHTML=" 请保证两次输入的密码一致";
        userpass_flag = false;
    }
    else{
        document.getElementById("showpassswordd").innerHTML="  ";
    }

    //检查手机号格式
    var myreg = /^1[34578]\d{9}$/;
    if(myreg.test(phonenum)){
        document.getElementById("showphone").innerHTML="   ";
    }
    else{
        userphonenum_flag= false;
        document.getElementById("showphone").innerHTML=" 请输入正确格式的手机号";
    }

    //判断邮箱格式
    var myregex = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
    if(myregex.test(email)){
        document.getElementById("showemail").innerHTML="   ";
    }
    else {
        useremail_flag = false;
        document.getElementById("showemail").innerHTML = " 邮箱格式错误";
    }

    //检查所有要求是否通过
    if (userpass_flag && userphonenum_flag&& useremail_flag && username_flag){
        return true;
    }
    else{
        return false;
    }
}

//检查手机号格式
function check_newphone() {
    var flag = true;
    var new_phonenum = document.form_newphone.new_phonenum.value;
    var myreg = /^1[34578]\d{9}$/;
    if(myreg.test(new_phonenum)){
        flag = true;
    }
    else {
        flag = false;
        alert("请输入正确格式的手机号码");
    }
    return flag;
}

//检查新邮箱格式
function check_newemail() {
    var flag = true;
    var new_email = document.form_newemail.new_email.value;
    var myregex = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
    if(myregex.test(new_email)){
        flag = true;
    }
    else {
        lag = false;
        alert("邮箱格式错误");
    }
    return flag;
}

//增加喜欢数到数据库
function like_pet() {
    document.getElementById("button_like").disabled="disabled";

    var pet_name = document.getElementById("petname").textContent;
    var url = "cal_likenum.jsp?pet_name="+pet_name+"&time="+new Date().getTime();
    xmlhttp.open("get", url, true);
    xmlhttp.onreadystatechange = callback2;
    xmlhttp.send(null);
}
function callback2() {
    if(xmlhttp.readyState == 4){
        if(xmlhttp.status == 200){
            document.getElementById("show_like").innerHTML= xmlhttp.responseText;
            document.getElementById("like_tag").innerHTML= "<span class='pet_liketag'>已喜欢</span>";
        }
        else{
            document.getElementById("show_like").innerHTML= xmlhttp.status;
        }
    }
    else{
        document.getElementById("show_like").innerHTML= xmlhttp.readyState;
    }
}

function addtocart() {
    var pet_name = document.getElementById("petname").textContent;
    var url = "addtocart.jsp?pet_name="+pet_name+"&time="+new Date().getTime();
    xmlhttp.open("get", url, true);
    xmlhttp.onreadystatechange = callback3;
    xmlhttp.send(null);
    alert("添加成功");
}
function callback3() {
    if(xmlhttp.readyState == 4){
        if(xmlhttp.status == 200){

        }
        else{
            document.getElementById("show_like").innerHTML= xmlhttp.status;
        }
    }
    else{
        document.getElementById("show_like").innerHTML= xmlhttp.readyState;
    }
}