package src.java.model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import src.java.model.DTO.Order;
import src.java.lib.utils.Config.*;
import src.java.lib.utils.DBUtils;

public class OrderDAO {
    public static boolean insertOrder(int id, Map<Integer, Integer> cart) throws Exception {
        int kq = 0;
        boolean isInserted= false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            cn.setAutoCommit(false);
            String sql = "insert Orders(OrdDate,status,AccID) values(?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            Date d = new Date(System.currentTimeMillis());
            pst.setDate(1, d);
            pst.setInt(2, Status.PENDING);
            pst.setInt(3, id);
            kq = pst.executeUpdate();
            if (kq > 0) {
                sql = "select top 1 OrderID\n"
                        + "from Orders\n"
                        + "order by OrderID desc";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int orderid = rs.getInt("OrderID");
                    if (cart != null && !cart.isEmpty()) 
                        for (int pdID : cart.keySet()) {
                            int quantity = cart.get(pdID);
                            sql = "insert OrderDetails(OrderID,FID,quantity) values(?,?,?)";
                            pst = cn.prepareStatement(sql);
                            pst.setInt(1, orderid);
                            pst.setInt(2, pdID);
                            pst.setInt(3, quantity);
                            kq = pst.executeUpdate();
                        }
                }
                
                isInserted = true;
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return isInserted;
    }

    public static boolean updateOrderStatus(int orderID, int status) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean success = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                if(status == Status.PENDING){
                    String sql = "UPDATE dbo.Orders\n"
                            + "SET status = ?, OrdDate = ?\n"
                            + "WHERE OrderID = ?";

                    pst = cn.prepareStatement(sql);

                    pst.setInt(1, status);
                    pst.setDate(2, new Date(System.currentTimeMillis()));
                    pst.setInt(3, orderID);

                    success = pst.executeUpdate() == 1;
                }else{
                    String sql = "UPDATE dbo.Orders\n"
                            + "SET status = ?\n"
                            + "WHERE OrderID = ?";

                    pst = cn.prepareStatement(sql);

                    pst.setInt(1, status);
                    pst.setInt(2, orderID);

                    success = pst.executeUpdate() == 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        return success;
    }

    public static boolean deleteOrderByID(int orderId) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        boolean success = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "delete from dbo.OrderDetails\n"
                        + " where OrderID = ?\n";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, orderId);
                success = pst.executeUpdate() > 0;
                if (success) {
                    sql = "delete from dbo.Orders\n"
                            + " where OrderID = ?\n";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderId);
                    success = pst.executeUpdate() > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        return success;
    }

    public static List<Order> getOrdersByAccID(int id) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        ArrayList<Order> orders = new ArrayList<>();
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, status, AccID\n"
                        + "from dbo.Orders where AccID = ?\n";
                
                pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                
                rs = pst.executeQuery();
                
                if (rs != null) 
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date ordDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        order = new Order(orderID, ordDate, shipDate, status, accID);
                        orders.add(order);
                    }
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        return orders;
    }
    
    public static List<Order> getOrders() throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        ArrayList<Order> orders = new ArrayList<>();
        Order order = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, status, AccID\n"
                        + "from dbo.Orders\n";
                pst = cn.prepareStatement(sql);
                
                rs = pst.executeQuery();
                
                if (rs != null) 
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date ordDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        order = new Order(orderID, ordDate, shipDate, status, accID);
                        orders.add(order);
                    }
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        return orders;
    }

    public static Map<Integer, Integer> getOrderDetailByOrderID(String id) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        Map<Integer, Integer> orderDetail = new HashMap<>();
        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "select FID, quantity\n"
                        + "from dbo.OrderDetails where OrderID = ?\n";
                
                pst = cn.prepareStatement(sql);
                pst.setInt(1, Integer.parseInt(id));
                
                rs = pst.executeQuery();
                if (rs != null) 
                    while (rs.next()) {
                        int FID = rs.getInt("FID");
                        int quantity = rs.getInt("quantity");
                        orderDetail.put(FID, quantity);
                    }
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        return orderDetail;
    }
    
    public static List<Order> getOrdersByOrderDate(Date dateFrom, Date dateTo) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        List<Order> list = new ArrayList<>();
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            
            if (cn != null) {
                String sql = "select OrderID, OrdDate, shipdate, status, AccID\n"
                        + "from dbo.Orders where OrdDate between ? and ?\n";
                
                pst = cn.prepareStatement(sql);
                pst.setDate(1, dateFrom);
                pst.setDate(2, dateTo);
                
                rs = pst.executeQuery();
                
                if (rs != null)
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        Date ordDate = rs.getDate("OrdDate");
                        Date shipDate = rs.getDate("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        order = new Order(orderID, ordDate, shipDate, status, accID);
                        list.add(order);
                    }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }
        
        return list;
    }
    
    public static int getCurrentOrderID() throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        int ret = -1;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select Top 1 OrderID from Orders order by OrderID desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    ret = rs.getInt("OrderID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null) cn.close();
            if(rs != null) rs.close();
            if(pst != null) pst.close();
        }        
        
        return ret;
    }
    
}
