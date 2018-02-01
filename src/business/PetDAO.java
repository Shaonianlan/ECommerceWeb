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
}
