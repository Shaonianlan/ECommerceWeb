/**
 * Created by 10096 on 2018/1/19.
 */
function check_reg(){
    var userpass_flag = true;
    var userphonenum_flag = true;
    var useremail_flag = true;
    var password1 = document.form_Reg.password.value;
    var password2 = document.form_Reg.confirmpassword.value;
    var phonenum = document.form_Reg.phonenum.value;
    var email = document.form_Reg.email.value;
    if(password2 != password1){
        document.getElementById("showpassswordd").innerHTML=" 请保证两次输入的密码一致";
        userpass_flag = false;
    }
    else{
        document.getElementById("showpassswordd").innerHTML="  ";
    }
    if(phonenum != ""){
        var myreg = /^1[34578]\d{9}$/;
        if(myreg.test(phonenum)){
            document.getElementById("showphone").innerHTML="   ";
        }
        else{
            userphonenum_flag= false;
            document.getElementById("showphone").innerHTML=" 请输入正确格式的手机号";
        }
    }
    if(email != ""){
        var myregex = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if(myregex.test(email)){
            document.getElementById("showemail").innerHTML="   ";
        }
        else {
            useremail_flag = false;
            document.getElementById("showemail").innerHTML = " 邮箱格式错误";
        }
    }
    if (userpass_flag && userphonenum_flag&& useremail_flag){
        return true;
    }
    else{
        return false;
    }
}

function check_newphone() {
    var flag = false;
    var new_phonenum = document.form_newphone.new_phonenum.value;
    if(new_phonenum != null){
        var myreg = /^1[34578]\d{9}$/;
        if(myreg.test(new_phonenum)){
            flag = true;
        }
        else {
            flag = false;
            alert("请输入正确格式的手机号码");
        }
    }
    else {
        flag = false;
        alert("新号码不能为空");
    }
    return flag;
}

function check_newemail() {
    var flag = false;
    var new_email = document.form_newemail.new_email.value;
    if(new_email != null){
        var myregex = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if(myregex.test(new_email)){
            flag = true;
        }
        else {
            lag = false;
            alert("邮箱格式错误");
        }
    }
    else {
        flag = false;
        alert("新邮箱不能为空");
    }
    return flag;
}
