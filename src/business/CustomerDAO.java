package business;

import mode.Customer;
import util.ConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 10096 on 2018/1/21.
 */
public class CustomerDAO {
    public static String getHello(){
        Date date =new Date();
        SimpleDateFormat sdf =new SimpleDateFormat("HH");
        int time=Integer.parseInt(sdf.format(date));
        String show;
        if(time >= 6 && time < 11){
            show = "上午好";
        }
        else if(time >= 11 && time < 13){
            show = "中午好";
        }
        else if (time >= 13 && time < 18){
            show = "下午好";
        }
        else{
            show = "晚上好";
        }
        return show;
    }
    public static Customer getLoginInfo(String username){
        Connection con = null;
        PreparedStatement pstmt = null;
        Customer customer = null;
        ResultSet rs = null;
        try{
            con = ConnectionManager.getConnection();
            String sql = "select * from user_info where user_name = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()){
                customer = new Customer();
                customer.setUser_id(rs.getString("user_id"));
                customer.setUser_name(rs.getString("user_name"));
                customer.setUser_password(rs.getString("user_password"));
                customer.setUser_sex(rs.getString("user_sex"));
                customer.setUser_phone(rs.getString("user_phone"));
                customer.setUser_email(rs.getString("user_email"));
                customer.setUser_address(rs.getString("user_address"));
                customer.setUser_createtime(rs.getString("user_createtime"));
            }
            con.close();
            pstmt.close();
            rs.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return customer;
    }
}
