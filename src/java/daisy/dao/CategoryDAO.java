/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.dao;

import daisy.dto.Category;
import daisy.util.DBUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author KIM DUONG
 */
public class CategoryDAO {

    public static ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT cateid, catename from Categories";

                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int cateId = rs.getInt("cateid");
                        String catenName = rs.getString("catename");
                        Category category = new Category(cateId, catenName);
                        list.add(category);
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
