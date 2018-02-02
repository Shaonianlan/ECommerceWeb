package util;

import java.sql.*;

/**
 * Created by 10096 on 2018/1/21.
 */
public class ConnectionManager {
    public  static Connection getConnection()throws SQLException{
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ecweb?useSSL=false" ;
            String username = "root" ;
            String password = "5jiu2DNF" ;
            con = DriverManager.getConnection(url,username,password);
        }
        catch (Exception e){
            throw new SQLException("不能取得数据库连接！");
        }
        return con;
    }
    public static void closeConnection(Connection con){
        try{
            if(con != null && (!con.isClosed())){
                con.close();
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void closeResultSet(ResultSet res){
        try {
            if (res != null){
                res.close();
                res = null;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void closeStatement(PreparedStatement pStatement){
        try{
            if(pStatement != null){
                pStatement.close();
                pStatement = null;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
}
