package src.java.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import letu.ui.MySystem;
import src.java.lib.utils.DBUtils;
import src.java.model.DTO.Plant;

public class PlantDAO {
    public static Plant getPlant(String nameSearch) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Plant plant = null;

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" 
                        + "FROM Plants\n" 
                        + "WHERE PName like '%?%' COLLATE Latin1_General_CS_AS";

                pst = cn.prepareStatement(sql);
                pst.setString(1, nameSearch);
                rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    int id  = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price  = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("cateID");
                    
                    plant = new Plant(cateID, name, price, imgPath, description, status, cateID);
                }
            }
        } catch (Exception e) {
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return plant;
    }

    public static List<Plant> getPlants(String nameSearch) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Plant plant = null;
        List<Plant> list = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" 
                        + "FROM Plants\n" 
                        + "WHERE PName like ? COLLATE Latin1_General_CS_AS";

                pst = cn.prepareStatement(sql);
                pst.setString(1,"%"+ nameSearch + "%");
                rs = pst.executeQuery();

                while (rs != null && rs.next()) {
                    int id  = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price  = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("cateID");
                    
                    plant = new Plant(id, name, price, imgPath, description, status, cateID);
                    list.add(plant);
                }
            }
        } catch (Exception e) {
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return list;
    }
    
    public static List<Plant> getPlants() throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Plant plant = null;
        List<Plant> list = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" 
                        + "FROM Plants\n" ;

                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();

                while (rs != null && rs.next()) {
                    int id  = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price  = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("cateID");
                    
                    plant = new Plant(id, name, price, imgPath, description, status, cateID);
                    list.add(plant);
                }
            }
        } catch (Exception e) {
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return list;
    }
    
    public static Plant getDetail(int ID) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Plant plant = null;

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" 
                        + "FROM Plants\n" 
                        + "WHERE PID = ?";

                pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    int id  = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price  = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("cateID");
                    
                    plant = new Plant(id, name, price, imgPath, description, status, cateID);
                }
            }
        } catch (Exception e) {
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return plant;
    }
    
    public static boolean updatePlant(int id, Plant plant) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean isUpdate = false;

        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "UPDATE Plants\n" +
                            "SET PName = ?, price = ?, imgPath = ?,"
                        + "status = ?, CateID = ?, description = ?\n" +
                            "WHERE PID = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, plant.getPlantName());
                pst.setInt(2, plant.getPrice());
                pst.setString(3, plant.getImgPath());
                pst.setInt(4, plant.getStatus());
                pst.setInt(5, plant.getCateID());
                pst.setString(6, plant.getDescription());
                pst.setInt(7, plant.getPlantID());
                
                int affectRow = pst.executeUpdate();
                if (affectRow > 0) isUpdate = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return isUpdate;
    }
    
    public static boolean insertPlant(Plant plant) throws SQLException{
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean isInserted = false;
        
        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "INSERT INTO Plants\n" +
                            "(PName, price, imgPath, description, status, CateID)\n" +
                            "VALUES (?, ?, ?, ?, ?, ?)";

                pst = cn.prepareStatement(sql);
                
                pst.setString(1, plant.getPlantName());
                pst.setInt(2, plant.getPrice());
                pst.setString(3, plant.getImgPath());
                pst.setString(4, plant.getDescription());
                pst.setInt(5, plant.getStatus());
                pst.setInt(6, plant.getCateID());
                
                int affectRow = pst.executeUpdate();
                if (affectRow > 0)
                    isInserted = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        
        return isInserted;
        
    }

}
