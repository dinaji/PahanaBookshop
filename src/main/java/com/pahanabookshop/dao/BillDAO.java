package com.pahanabookshop.dao;

import com.pahanabookshop.model.Bill;
import java.sql.*;

public class BillDAO {

    private static final String DB_URL =
        "jdbc:mysql://localhost:3306/bookshop_Pahana?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "uVO18%HseTAPreb";

    public int saveBill(Bill bill) throws SQLException {
        String sql = "INSERT INTO bills (account_no, name, email, book_category, book_name, units, unit_price, total) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bill.getAccountNo());
            stmt.setString(2, bill.getName());
            stmt.setString(3, bill.getEmail());
            stmt.setString(4, bill.getBookCategory());
            stmt.setString(5, bill.getBookName());
            stmt.setInt(6, bill.getUnits());
            stmt.setInt(7, bill.getUnitPrice());
            stmt.setInt(8, bill.getTotal());

            return stmt.executeUpdate();
        }
    }
}
