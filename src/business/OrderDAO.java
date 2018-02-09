package business;

import mode.Orderdetail;
import mode.Orders;
import util.ConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            String sql = "insert into orders(user_name,user_address,user_phone,order_time,order_price,order_status,user_id)" +
                    "values(?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, order.getUser_name());
            pstmt.setString(2,order.getUser_address());
            pstmt.setString(3,order.getUser_phone());
            pstmt.setString(4,order.getOrder_time());
            pstmt.setDouble(5,order.getOrder_price());
            pstmt.setLong(6,order.getOrder_status());
            pstmt.setLong(7,order.getUser_id());
            pstmt.executeUpdate();
            sql = "SELECT * from orders ORDER BY order_id DESC LIMIT 1";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            Long orderid = 0l;
            if(rs.next()) {
                orderid = rs.getLong("order_id");
                order.setOrder_id(orderid);
                List<Orderdetail> orders = order.getOrderdetail();
                Iterator<Orderdetail> it = orders.iterator();
                while(it.hasNext()){
                    //创建Orderdetails
                    Orderdetail ods = it.next();
                    sql = "INSERT into order_detail(order_id,pet_id,pet_name,quantity,pet_price) " +
                            "values(?,?,?,?,?)";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setLong(1,ods.getOrder_id());
                    pstmt.setLong(2,ods.getPet_id());
                    pstmt.setString(3,ods.getPet_name());
                    pstmt.setLong(4,ods.getQuantity());
                    pstmt.setDouble(5,ods.getPet_price());
                    pstmt.executeUpdate();
                }
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

    //通过用户名获取所有订单
    public static List<Orders> getOrdersByuserId(Long userid){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs =null;
        List<Orders> orderslist = new ArrayList<Orders>();
        
        try {
            con = ConnectionManager.getConnection();
            String sql = "select * from orders where user_id = ?;";
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1,userid);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Orders order = new Orders();
                order.setOrder_id(rs.getLong("order_id"));
                order.setUser_name(rs.getString("user_name"));
                order.setUser_phone(rs.getString("user_phone"));
                order.setUser_address(rs.getString("user_address"));
                order.setOrder_price(rs.getDouble("order_price"));
                order.setOrder_time(rs.getString("order_time"));
                order.setOrder_status(rs.getLong("order_status"));
                orderslist.add(order);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        finally{
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeConnection(con);
        }
        return orderslist;
    }

    //通过订单号获取详细订单
    public static List<Orderdetail> getOrderdetailByorderid(Long orderid){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs =null;
        List<Orderdetail> orderdetaillist = new ArrayList<Orderdetail>();

        try {
            con = ConnectionManager.getConnection();
            String sql = "select * from order_detail where order_id = ?;";
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1,orderid);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setOrder_id(rs.getLong("order_id"));
                orderdetail.setPet_id(rs.getLong("pet_id"));
                orderdetail.setPet_name(rs.getString("pet_name"));
                orderdetail.setQuantity(rs.getLong("quantity"));
                orderdetail.setPet_price(rs.getDouble("pet_price"));

                orderdetaillist.add(orderdetail);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        finally{
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeConnection(con);
        }
        return orderdetaillist;
    }
}
