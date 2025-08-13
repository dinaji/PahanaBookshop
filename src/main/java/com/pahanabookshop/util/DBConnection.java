package com.pahanabookshop.util;



import java.sql.*;

public class DBConnection {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookshop_Pahana?useSSL=false",
                "root",
                "uVO18%HseTAPreb"
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
