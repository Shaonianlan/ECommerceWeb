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
    public static void DoRegister(String name,String password,String sex,String phone,String email,String address){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "insert into user_info (user_name,user_password,user_sex,user_phone,user_email,user_address,user_createtime) VALUES " +
                    "(?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setString(3, sex);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setString(6, address);
            Date dt = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            pstmt.setString(7, sdf.format(dt));
            pstmt.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
    }

    public static Customer getLoginInfo(String username) {
        Connection con = null;
        PreparedStatement pstmt = null;
        Customer customer = null;
        ResultSet rs = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "select * from user_info where user_name = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public static boolean check_log(String username, String password) {
        boolean check = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT user_name,user_password from user_info where user_name=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (password.equals(rs.getString("user_password"))) {
                    check = true;
                } else {
                    check = false;
                }
            } else {
                check = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return check;
    }

    public static boolean Check_Regname(String username) {
        boolean flag = true;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT user_name from user_info where user_name=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                flag = false;
            }
            else {
                flag = true;
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return flag;
    }
    public static void alter_userphone(String username,String new_phonenum){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ConnectionManager.getConnection();
            String sql = "UPDATE user_info SET user_phone = ? where user_name=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, new_phonenum);
            pstmt.setString(2, username);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
    }
    public static void alter_useremail(String username, String new_email){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "UPDATE user_info SET user_email = ? where user_name=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, new_email);
            pstmt.setString(2, username);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
    }

    public static void alter_useraddress(String username, String new_aadress){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "UPDATE user_info SET user_address = ? where user_name=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, new_aadress);
            pstmt.setString(2, username);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
    }

    public static int alter_userpassword(String username,String old_password, String new_password){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int tag = 0;// 0:未执行 1:原密码错误 2:修改成功

        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT user_password from user_info where user_name = ? and user_password = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2,old_password);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                sql = "UPDATE user_info SET user_password = ? where user_name=?";
                PreparedStatement pstmt2 = con.prepareStatement(sql);
                pstmt2.setString(1, new_password);
                pstmt2.setString(2, username);
                pstmt2.executeUpdate();
                tag = 1;
            }
            else{
                tag = 2;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return tag;
    }
}
