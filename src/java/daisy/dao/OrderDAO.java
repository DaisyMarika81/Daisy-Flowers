/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.dao;

import daisy.dto.Order;
import daisy.dto.OrderDetail;
import daisy.util.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author KIM DUONG
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT orderID, ordDate, shipdate, orders.status AS status, orders.AccID as accID\n"
                        + "FROM orders JOIN accounts\n"
                        + "ON orders.AccID = accounts.accID\n"
                        + "Where email = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    Date ordDate = rs.getDate("ordDate");
                    Date shipDate = rs.getDate("shipDate");
                    int status = rs.getInt("status");
                    int accID = rs.getInt("accId");
                    Order ord = new Order(orderID, ordDate, shipDate, status, accID);
                    list.add(ord);
                }
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select DetailId,OrderID,PID,PName,price,imgpath,quantity\n"
                        + "from OrderDetails, Plants\n"
                        + "where OrderID= ? and OrderDetails.FID=Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int detailID = rs.getInt("DetailId");
                        int plantID = rs.getInt("PID");
                        String plantName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail ordd = new OrderDetail(detailID, orderID, plantID, plantName, price, imgPath, quantity);
                        list.add(ordd);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Order> getOrdersStatus(String email, int status) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT orderID, ordDate, shipdate, orders.AccID as accID\n"
                        + "FROM orders JOIN accounts\n"
                        + "ON orders.AccID = accounts.accID\n"
                        + "Where email = ? AND orders.status = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setInt(2, status);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    Date ordDate = rs.getDate("ordDate");
                    Date shipDate = rs.getDate("shipDate");
                    int accID = rs.getInt("accId");
                    Order ord = new Order(orderID, ordDate, shipDate, status, accID);
                    list.add(ord);
                }
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateOrderStatus(int orderID) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "UPDATE Orders\n"
                        + "SET status = 1\n"
                        + "WHERE OrderID = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                int count = pst.executeUpdate();

                if (count == 0) {
                    cn.close();
                    return false;
                } else {
                    cn.close();
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static boolean updateOrderStatus1(int orderID) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "UPDATE Orders\n"
                        + "SET status = 3\n"
                        + "WHERE OrderID = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                int count = pst.executeUpdate();

                if (count == 0) {
                    cn.close();
                    return false;
                } else {
                    cn.close();
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static Order get1OrdersStatus(String email, int status) {
        Order ord = null;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT orderID, ordDate, shipdate, orders.AccID as accID\n"
                        + "FROM orders JOIN accounts\n"
                        + "ON orders.AccID = accounts.accID\n"
                        + "Where email = ? AND orders.status = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setInt(2, status);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    Date ordDate = rs.getDate("ordDate");
                    Date shipDate = rs.getDate("shipDate");
                    int accID = rs.getInt("accId");
                    ord = new Order(orderID, ordDate, shipDate, status, accID);
                }
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ord;
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accID = 0, orderID = 0;
                cn.setAutoCommit(false);
                String sql = "select accID from Accounts where Accounts.email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accID = rs.getInt("accID");
                }
                System.out.println("Account ID: " + accID);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("Order date: " + d);
                sql = "insert Orders(OrdDate, status, AccID) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accID);
                pst.executeUpdate();
                sql = "select top 1 orderID from Orders Order by orderID desc ";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderID = rs.getInt("orderID");
                }
                System.out.println("OrderID: " + orderID);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetails values(?,?,?) ";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderID);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("Can not insert order!");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static ArrayList<Order> getOrdersStatusByDate(String email, Date ordDate1, Date ordDate2) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT orderID, ordDate, shipdate, Orders.status as status, orders.AccID as accID\n"
                        + "FROM orders JOIN accounts\n"
                        + "ON orders.AccID = accounts.accID\n"
                        + "Where email = ? AND ordDate BETWEEN ? AND ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setDate(2, ordDate1);
                pst.setDate(3, ordDate2);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    Date ordDate = rs.getDate("ordDate");
                    Date shipDate = rs.getDate("shipDate");
                    int status = rs.getInt("status");
                    int accID = rs.getInt("accId");
                    Order ord = new Order(orderID, ordDate, shipDate, status, accID);
                    list.add(ord);
                }
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Order> getOrders() {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT a.accID, a.email, OrderID, OrdDate, shipdate, o.status  FROM ORDERS o Join Accounts a \n"
                        + "ON o.AccID = a.accID";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    Date ordDate = rs.getDate("ordDate");
                    Date shipDate = rs.getDate("shipDate");
                    int status = rs.getInt("status");
                    int accID = rs.getInt("accId");
                    Order ord = new Order(orderID, ordDate, shipDate, status, accID);
                    list.add(ord);
                }
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
