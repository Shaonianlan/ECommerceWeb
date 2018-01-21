/**
 * Created by 10096 on 2018/1/19.
 */
function check_Reg(){
    var username_flag = true;
    var userpass_flag = true;
    var userpass_flag2 = true;
    var userphonenum_flag = true;
    var useremail_flag = true;
    var useraddress_flag =true;
    var username = document.form_Reg.username.value;
    var password1 = document.form_Reg.password.value;
    var password2 = document.form_Reg.confirmpassword.value;
    var phonenum = document.form_Reg.phonenum.value;
    var email = document.form_Reg.email.value;
    var address = document.form_Reg.address.value;
    if(username == ""){
        document.getElementById("showname").innerHTML="   用户名不能为空";
        username_flag = false;
    }
    else{
        document.getElementById("showname").innerHTML="";
    }
    if(password1 == ""){
        document.getElementById("showpasssword").innerHTML="   密码不能为空";
        userpass_flag = false;
    }
    else{
        document.getElementById("showpasssword").innerHTML="";
    }
    if(password2 != password1){
        document.getElementById("showpassswordd").innerHTML="  两次输入的密码不一致";
        userpass_flag2 = false;
    }
    else{
        document.getElementById("showpassswordd").innerHTML="  ";
    }
    if(phonenum == ""){
        document.getElementById("showphone").innerHTML="   手机号码不能为空";
        userphonenum_flag = false;
    }
    else{
        var myreg = /^1[34578]\d{9}$/;
        if(myreg.test(phonenum)){
            document.getElementById("showphone").innerHTML="   ";
        }
        else{
            userphonenum_flag= false;
            document.getElementById("showphone").innerHTML="   请输入正确格式的手机号";
        }
    }
    if(email == ""){
        document.getElementById("showemail").innerHTML="   邮箱不能为空";
        useremail_flag = false;
    }
    else{
        var myregex = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
        if(myregex.test(email)){
            document.getElementById("showemail").innerHTML="   ";
        }
        else {
            useremail_flag = false;
            document.getElementById("showemail").innerHTML = "  邮箱格式错误";
        }
    }
    if(address == ""){
        document.getElementById("showaddress").innerHTML="   常住地址不能为空";
        useraddress_flag = false;
    }
    else{
        document.getElementById("showaddress").innerHTML=" ";
    }
    if (userpass_flag && username_flag && userpass_flag2 && userphonenum_flag&& useremail_flag){
        return true;
    }
    else{
        return false;
    }
}