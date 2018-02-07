package business;

import mode.Pet;
import util.ConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 10096 on 2018/1/26.
 */
public class PetDAO {
    public static List<Pet> getPet(){
        List<Pet> petlist = new ArrayList<Pet>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = ConnectionManager.getConnection();
            String sql = "Select * from pet_info";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Pet pet = new Pet();
                pet.setPet_id(rs.getLong("pet_id"));
                pet.setPet_name(rs.getString("pet_name"));
                pet.setPet_description(rs.getString("pet_description"));
                pet.setPet_height(rs.getString("pet_height"));
                pet.setPet_type(rs.getString("pet_type"));
                pet.setPet_stock(rs.getString("pet_stock"));
                pet.setPet_sourcearea(rs.getString("pet_sourcearea"));
                pet.setPet_price(rs.getDouble("pet_price"));
                pet.setPet_character(rs.getString("pet_character"));
                pet.setPet_suitable(rs.getString("pet_suitable"));
                pet.setPet_life(rs.getString("pet_life"));
                pet.setPet_image(rs.getString("pet_image"));

                petlist.add(pet);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return petlist;
    }

    public static Pet getpetdetail(String pet_name){
        Pet pet = new Pet();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = ConnectionManager.getConnection();
            String sql = "Select * from pet_info where pet_name=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, pet_name);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                pet.setPet_id(rs.getLong("pet_id"));
                pet.setPet_name(rs.getString("pet_name"));
                pet.setPet_description(rs.getString("pet_description"));
                pet.setPet_height(rs.getString("pet_height"));
                pet.setPet_type(rs.getString("pet_type"));
                pet.setPet_stock(rs.getString("pet_stock"));
                pet.setPet_sourcearea(rs.getString("pet_sourcearea"));
                pet.setPet_price(rs.getDouble("pet_price"));
                pet.setPet_character(rs.getString("pet_character"));
                pet.setPet_suitable(rs.getString("pet_suitable"));
                pet.setPet_life(rs.getString("pet_life"));
                pet.setPet_image(rs.getString("pet_image"));
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return pet;
    }

    public static List<String> getpettype(){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> pettype_list = new ArrayList<String>();
        try{
            con = ConnectionManager.getConnection();
            String sql = "Select DISTINCT(pet_type) from pet_info";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                String s = rs.getString("pet_type");
                pettype_list.add(s);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return pettype_list;
    }

    public static List<String> getpet_bytype(String pet_type){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> petbytype = new ArrayList<String>();
        try{
            con = ConnectionManager.getConnection();
            String sql = "Select pet_name from pet_info where pet_type = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,pet_type);
            rs = pstmt.executeQuery();
            while (rs.next()){
                String s = rs.getString("pet_name");
                petbytype.add(s);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return petbytype;
    }

    public static List<Pet> search(String search_name){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Pet> searchpets = new ArrayList<Pet>();
        try{
            con = ConnectionManager.getConnection();
            String sql = "Select pet_name,pet_life,pet_type,pet_sourcearea,pet_price,pet_image from pet_info where pet_name LIKE '%"+search_name+"%'";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Pet pet = new Pet();

                pet.setPet_name(rs.getString("pet_name"));
                pet.setPet_life(rs.getString("pet_life"));
                pet.setPet_type(rs.getString("pet_type"));
                pet.setPet_sourcearea(rs.getString("pet_sourcearea"));
                pet.setPet_price(rs.getDouble("pet_price"));
                pet.setPet_image(rs.getString("pet_image"));

                searchpets.add(pet);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return searchpets;
    }

    public static Long Addpet_likenum(String pet_name){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Long num = 0l;

        try{
            con = ConnectionManager.getConnection();
            String sql = "SELECT pet_popularity from pets_popularity where pet_name = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,pet_name);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                Long num2 = rs.getLong("pet_popularity");
                num = num2 +1l;
                sql = "UPDATE pets_popularity SET pet_popularity = ? where pet_name = ?";
                PreparedStatement pstmt2 = con.prepareStatement(sql);
                pstmt2.setLong(1,num);
                pstmt2.setString(2,pet_name);
                pstmt2.executeUpdate();
                ConnectionManager.closeStatement(pstmt2);

            }
            else{
                sql = "insert into pets_popularity (pet_name,pet_popularity) VALUES (?,?)" ;
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,pet_name);
                pstmt.setLong(2,1l);
                pstmt.executeUpdate();
                num = 1l;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return num;
    }

    public static Long getpet_popularity(String pet_name){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Long num = 0l;

        try{
            con = ConnectionManager.getConnection();
            String sql = "SELECT pet_popularity from pets_popularity where pet_name = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,pet_name);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                num = rs.getLong("pet_popularity");
            }
            else{
                num = 0l;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return num;
    }

    public static List<String> getpoppets(){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> poppets = new ArrayList<String>();

        try{
            con = ConnectionManager.getConnection();
            String sql = "SELECT pet_name from pets_popularity ORDER BY pet_popularity DESC LIMIT 8 ";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                poppets.add(rs.getString("pet_name"));
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            ConnectionManager.closeConnection(con);
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
        }
        return poppets;
    }
}
