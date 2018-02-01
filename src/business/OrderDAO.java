package business;

import mode.Orderdetail;
import mode.Orders;
import util.ConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by 10096 on 2018/2/1.
 */
public class OrderDAO {
    public void createOrder(Orders order) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs =null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "insert into orders(user_name,user_address,user_phone,order_time,order_price)" +
                    "values(?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, order.getUser_name());
            pstmt.setString(2,order.getUser_address());
            pstmt.setString(3,order.getUser_phone());
            pstmt.setString(4,order.getOrder_time());
            pstmt.setDouble(5,order.getOrder_price());
            rs = pstmt.executeQuery();
            rs.next();
            int orderid = rs.getInt(1);
            order.setOrder_id((long)orderid);
            List<Orderdetail> orders = order.getOrderdetail();
            Iterator<Orderdetail> it = orders.iterator();
            while(it.hasNext()){
                //创建Orderdetails
                Orderdetail ods = it.next();
                sql = "INSERT into order_detail(order_id,pet_id,pet_name,quantity,pet_price) " +
                        "values(?,?,?,?,?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,orderid);
                pstmt.setLong(2,ods.getPet_id());
                pstmt.setString(3,ods.getPet_name());
                pstmt.setLong(4,ods.getQuantity());
                pstmt.setDouble(5,ods.getPet_price());
                pstmt.executeQuery();
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
    finally{
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeConnection(con);
        }
    }
}
