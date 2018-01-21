/**
 * Created by 10096 on 2018/1/19.
 */
function check(){
    var username_flag = true;
    var userpass_flag = true;
    var username = document.form_log.username.value;
    var password = document.form_log.password.value;
    if(username == ""){
        document.getElementById("showname").innerHTML="   用户名不能为空";
        username_flag = false;
    }
    else{
        document.getElementById("showname").innerHTML="";
    }
    if(password == ""){
        document.getElementById("showpasssword").innerHTML="   密码不能为空";
        userpass_flag = false;
    }
    else{
        document.getElementById("showpasssword").innerHTML="";
    }
    if (userpass_flag && username_flag){
        return true;
    }
    else{
        return false;
    }
}