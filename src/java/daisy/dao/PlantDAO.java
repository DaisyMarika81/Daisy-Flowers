/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.dao;

import daisy.dto.Plant;
import daisy.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author KIM DUONG
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();

            if (cn != null && searchby != null) {
                String sql = "select PID, PName,price,imgPath,description,status,Plants.CateID as 'CateID', CateName\n"
                        + "from Plants join Categories on Plants.CateID = Categories.CateID\n";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "where Plants.PName like ? ";
                } else {
                    sql = sql + "Where CateName like ? ";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Plant getPlant(int pID) {
        Plant plant = new Plant();
        try {
            Connection cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select pID, PName,price,imgPath,description,status,Plants.CateID as 'CateID', CateName\n"
                        + "from Plants join Categories on Plants.CateID = Categories.CateID\n"
                        + "where pID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pID);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plant;
    }

    public static ArrayList<Plant> getPlants() {
        ArrayList<Plant> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select pID, PName,price,imgPath,description,status,Plants.CateID as 'CateID', CateName\n"
                        + "from Plants join Categories on Plants.CateID = Categories.CateID";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                        list.add(plant);
                    }
                    cn.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
