/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.dto;

import daisy.dao.AccountDAO;
import daisy.dao.OrderDAO;
import daisy.dao.PlantDAO;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author KIM DUONG
 */
public class testConnection {

    public static void main(String[] args) {
        //        Account acc = AccountDAO.getAccount("test@gmail.com", "test");
        //        if (acc != null) {
        //            if (acc.getRole() == 1) {
        //                System.out.println("I am an Admin!");
        //            } else {
        //                System.out.println("I am an User!");
        //            }
        //
        //        } else {
        //            System.out.println("Login Fail!");
        //        }
        //        ArrayList<Account> list = AccountDAO.getAccounts();
        //        for (Account account : list) {
        //            System.out.println(account.getAccID());
        //        }        
        //        ArrayList<Order> list = OrderDAO.getOrders("test@gmail.com");
        //        for (Order order : list) {
        //            System.out.println(order.getStatus());
        //        }
        //        ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(1);
        //        for (OrderDetail orderDetail : list) {
        //            System.out.println(orderDetail.getImgPath());
        //        }
        //        if (AccountDAO.updateAccountStatus("admin@gmail.com", 1)) {
        //            System.out.println("Update status successfully!");
        //        } else {
        //            System.out.println("Cannot update status!");
        //        }
        //        if (AccountDAO.updateAccount("test@gmail.com", "999999", "thino", "65432111")) {
        //            System.out.println("Updated profile!");
        //        } else {
        //            System.out.println("Update profile fail!");
        ////        }
        //        if (AccountDAO.insertAccount("test21@gmail.com", "222222", "chi pheo", "123123123", 1, 0)) {
        //            System.out.println("Added new account!");
        //        } else {
        //            System.out.println("Insert a new account fail!");
        //        }
        //        if (OrderDAO.updateOrderStatus(3)) {
        //            System.out.println("Updated Order!");
        //        }
        //        HashMap<String, Integer> numberMapping = new HashMap<>();
        //
        //        // Thêm giá Key-Value vào HashMap
        //        numberMapping.put("One", 1);
        //        numberMapping.put("Two", 2);
        //        numberMapping.put("Three", 3);
        //        if (OrderDAO.insertOrder("test@gmail.com", numberMapping)) {
        //            System.out.println("Nice!");
        //        }
        //        Account acc = AccountDAO.getAccountByEmail("test@gmail.com");
        //        System.out.println(acc.getPhone());
        //        Plant plant = PlantDAO.getPlant(1);
        ArrayList<Order> list = OrderDAO.getOrdersStatus("test@gmail.com", 1);
        for (Order order : list) {
            System.out.println(order.toString());
        }
        
    }
}
