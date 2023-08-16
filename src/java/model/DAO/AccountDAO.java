package src.java.model.DAO;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import src.java.model.DTO.Account;
import src.java.lib.utils.DBUtils;

public class AccountDAO implements Serializable {

    public static Account getAccount(String email, String password) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Account acc = null;

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT accID, email, password, fullname, phone, status, role\n"
                        + "FROM Accounts\n"
                        + "WHERE status = 1 AND email = ? AND password = ? COLLATE Latin1_General_CS_AS";

                pst = cn.prepareStatement(sql);
                
                pst.setString(1, email);
                pst.setString(2, password);
                
                rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    int accID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");

                    acc = new Account(accID, Email, Password, Fullname, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return acc;
    }

    // public static Account getAccount(String email, String password) {
    // return DBUtils.DBConnect(cn -> {
    // Account acc = null;
    // String sql = "SELECT accID, email, password, fullname, phone, status, role\n"
    // + "FROM dbo.Accounts\n"
    // + "WHERE status = 1 AND email = ? AND password = ? COLLATE
    // Latin1_General_CS_AS";
    // try (PreparedStatement pst = cn.prepareStatement(sql)) {
    // pst.setString(1, email);
    // pst.setString(2, password);
    // ResultSet rs = pst.executeQuery();
    // while (rs.next()) {
    // int accID = rs.getInt("accID");
    // String Email = rs.getString("email");
    // String Password = rs.getString("password");
    // String Fullname = rs.getString("fullname");
    // int Status = rs.getInt("status");
    // String Phone = rs.getString("phone");
    // int Role = rs.getInt("role");
    // acc = new Account(accID, email, password, Fullname, Status, Phone, Role);
    // }
    // } catch (SQLException e) {
    // e.printStackTrace();
    // }
    // return acc;
    // }, email, password);

    // }

    // public static List<Account> getAccounts() {
    // List<Account> accounts = DBUtils.DBConnect(cn -> {
    // List<Account> list = new ArrayList<>();
    // String sql = "SELECT accID, email, password, fullname, phone, status, role\n"
    // + "FROM dbo.Accounts\n";
    // try (PreparedStatement pst = cn.prepareStatement(sql)) {
    // ResultSet rs = pst.executeQuery();
    // while (rs.next()) {
    // int accID = rs.getInt("accID");
    // String Email = rs.getString("email");
    // String Password = rs.getString("password");
    // String Fullname = rs.getString("fullname");
    // String Phone = rs.getString("phone");
    // int Status = rs.getInt("status");
    // int Role = rs.getInt("role");
    // list.add(new Account(accID, Email, Password, Fullname, Status, Phone, Role));
    // }
    // } catch (SQLException e) {
    // e.printStackTrace();
    // }
    // return list;
    // });

    // return accounts;

    // }

    public static List<Account> getAccounts() throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        ArrayList<Account> list = new ArrayList<>();
        Account acc = null;

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" +
                            "FROM Accounts";

                pst = cn.prepareStatement(sql);

                rs = pst.executeQuery();

                while (rs != null && rs.next()) {
                    int accID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");

                    acc = new Account(accID, Email, Password, Fullname, Status, Phone, Role);
                    list.add(acc);
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

    public static boolean updateAccount(int id, Account acc) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean isUpdate = false;

        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "UPDATE Accounts\n" +
                            "SET email = ?, password = ?, fullname = ?, phone = ?, status = ?, role = ?\n" +
                            "where accID = ?";

                pst = cn.prepareStatement(sql);
                
                pst.setString(1, acc.getEmail());
                pst.setString(2, acc.getPassword());
                pst.setString(3, acc.getFullname());
                pst.setString(4, acc.getPhone());
                pst.setInt(5, acc.getStatus());
                pst.setInt(6, acc.getRole());
                pst.setInt(7, id);
                
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
    
    public static boolean insertAccount(Account acc) throws SQLException{
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean isInserted = false;
        
        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "INSERT INTO Accounts\n" +
                            "(email, password, fullname, phone, role, status)\n" +
                            "VALUES (?, ?, ?, ?, ?, ?)";

                pst = cn.prepareStatement(sql);
                
                pst.setString(1, acc.getEmail());
                pst.setString(2, acc.getPassword());
                pst.setString(3, acc.getFullname());
                pst.setString(4, acc.getPhone());
                pst.setInt(5, acc.getRole());
                pst.setInt(6, acc.getStatus());
                
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
    
    public static boolean deleteAccount(String email) throws SQLException{
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean isDeleted = false;
        
        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "DELETE Accounts\n" +
                            "WHERE email = ?";

                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                rs = pst.executeQuery();

                int affectRow = pst.executeUpdate();
                if (affectRow > 0)
                    isDeleted = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return isDeleted;
    }
    
    public static boolean isExist(String emailOrPhone) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Account acc = null;

        try {
            cn = DBUtils.makeConnection();
            
            if(emailOrPhone.isEmpty()) return false;

            if (cn != null) {
                String sql = "SELECT accID, email, password, fullname, phone, status, role\n"
                        + "FROM Accounts\n"
                        + "WHERE status = 1 AND email = ? OR phone = ? COLLATE Latin1_General_CS_AS";

                pst = cn.prepareStatement(sql);
                pst.setString(1, emailOrPhone);
                pst.setString(2, emailOrPhone);
                rs = pst.executeQuery();

                return !(rs != null && rs.next());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return false;
    }
    
    public static Account getDetail(int ID) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Account acc = null;

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT *\n" 
                        + "FROM Accounts\n" 
                        + "WHERE accID = ?";

                pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    int accID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    
                    acc = new Account(ID, Email, Password, Fullname, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }

        return acc;
    }
}
