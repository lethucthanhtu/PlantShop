package src.java.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import src.java.lib.utils.DBUtils;

public class CategoryDAO {
    public static Map<Integer, String> getCategories() throws SQLException{
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Map<Integer, String> cate = new HashMap<>();

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" +
                            "FROM Categories";

                pst = cn.prepareStatement(sql);

                rs = pst.executeQuery();

                while (rs != null && rs.next()) {
                    int id = rs.getInt("CateID");
                    String name = rs.getString("CateName");
                    
                    cate.put(id, name);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return cate;
    }
    
    public static Map<Integer, String> getCategoriesByName(String searchName) throws SQLException{
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Map<Integer, String> cate = new HashMap<>();

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" +
                            "FROM Categories\n" +
                            "WHERE CateName LIKE ?";

                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + searchName + "%");

                rs = pst.executeQuery();

                while (rs != null && rs.next()) {
                    int id = rs.getInt("CateID");
                    String name = rs.getString("CateName");
                    
                    cate.put(id, name);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return cate;
    }
    
    public static boolean updateCategory(int id, String newName) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean isUpdate = false;

        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "UPDATE Categories\n" +
                            "SET CateName = ?\n" +
                            "where CateID = ?";

                pst = cn.prepareStatement(sql);
                
                pst.setString(1, newName);
                pst.setInt(2, id);
                
                int affectRow = pst.executeUpdate();
                if (affectRow > 0)
                    isUpdate = true;
                
            }
        } catch (Exception e) {
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return isUpdate;
    }
    
    public static boolean insertCategory(String name) throws SQLException{
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean isInserted = false;
        
        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "INSERT INTO Categories\n" +
                            "(CateName)\n" +
                            "VALUES (?)";

                pst = cn.prepareStatement(sql);
                
                pst.setString(1, name);
                
                int affectRow = pst.executeUpdate();
                if (affectRow > 0)
                    isInserted = true;
            }
            
        } catch (Exception e) {
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        
        return isInserted;
        
    }
}
