package src.java;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import letu.ui.MySystem;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.AccountDAO;
import src.java.model.DAO.PlantDAO;
import src.java.model.DTO.Account;
import src.java.model.DTO.Plant;

public class Test {

    public static class Update {

        public static void Plant() {
            try {
                int id = 3;
                Plant p = PlantDAO.getDetail(id);
                p.setPlantName("plant3");
                p.setCateID(1);

                boolean x = PlantDAO.updatePlant(id, p);
                MySystem.out.message("update plant", x);
            } catch (SQLException ex) {
            }
        }

        public static void Account() {
            try {
                int id = 77;
                Account acc = AccountDAO.getDetail(id);
                acc.setEmail("alo4@gmail.com");

                boolean x = AccountDAO.updateAccount(id, acc);
                MySystem.out.message("update account", x);
            } catch (SQLException ex) {
            }
        }

        public static void Category() {
//            try {
//                int id = 1;
//                
//                boolean x = false;
//                MySystem.out.message("update category", x);
//            } catch (SQLException ex) {}
        }
    }

    public static class Insert {

        public static void Plant() {
            try {
                Plant p = new Plant("plant 6", 600, "./asset/images/plant/see-6.jpg", "alo 6", 1, 1);

                boolean x = PlantDAO.insertPlant(p);
                MySystem.out.message("insert plant", x);
            } catch (SQLException ex) {
            }
        }

        public static void Account() {
            try {
                Account acc = new Account("lethucthanhtu@gmail.com", "456", "buyer 6", Status.ACTIVE, "0984327653", Role.BUYER);

                boolean x = AccountDAO.insertAccount(acc);
                MySystem.out.message("insert account", x);
            } catch (SQLException ex) {
            }
        }

        public static void Category() {
        }

    }

    public static void testMap() {
        // Default Initialization of a
        // Map
        Map<Integer, String> hm1 = new HashMap<>();

        // Initialization of a Map
        // using Generics
        Map<Integer, String> hm2
                = new HashMap<Integer, String>();

        // Inserting the Elements
        hm1.put(1, "Geeks");
        hm1.put(2, "For");
        hm1.put(3, "Geeks");
        hm1.put(3, "Geeks");
        hm1.put(3, "Geeks");

        hm2.put(new Integer(1), "Geeks");
        hm2.put(new Integer(2), "For");
        hm2.put(new Integer(3), "Geeks");

        System.out.println(hm1);
        System.out.println(hm2);
    }

    public static void connect() {
        try {
            List<Plant> list = PlantDAO.getPlants("pl");

            //      System.out.println(AccountDAO.getAccount("lethucthanhtu@gmail.com", "123"));
            //      MySystem.out.table(list);
            System.out.println(list.size());
        } catch (SQLException ex) {
        }
    }

    public static void testIsExist() {

        try {
            boolean isInserted1 = AccountDAO.isExist("alo3@gmail.com");
            boolean isInserted2 = AccountDAO.isExist("alo2@gmail.com");
            System.out.println(isInserted1);
            System.out.println(isInserted2);

//      MySystem.out.table(list);
        } catch (SQLException ex) {
        }
    }

    public static void main(String[] args) {
        //        Update.Plant();
//        Update.Account();
//        Insert.Plant();
        Insert.Account();
//System.out.println(CategoryDAO.getCategories());

    }
}
