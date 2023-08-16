package src.java.lib.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.function.Function;

public class DBUtils {
    public static Connection makeConnection() throws Exception {
        Connection cn = null;
        String IP = "localhost";
        String instanceName = "SQLEXPRESSLETU";
        String port = "1433";
        String uid = "sa";
        String pwd = "12345";
        String db = "PlantShop";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db
                + ";user=" + uid
                + ";password=" + pwd;
        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;
    }

    public static <T> T DBConnect(Function<Connection, T> callback, String... args) {
        T result = null;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            result = callback.apply(cn);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null)
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
        }

        return result;
    }
}
