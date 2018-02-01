package business;

import mode.Customer;
import util.ConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by 10096 on 2018/1/21.
 */
public class CustomerDAO {
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

    public static void DoRegister(){

    }
}
