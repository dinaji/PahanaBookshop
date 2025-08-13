package com.pahanabookshop.dao;


import com.pahanabookshop.model.*;

import java.sql.*;
import java.util.*;

public class ItemDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/bookshop_Pahana?useSSL=false";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "uVO18%HseTAPreb";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void addItem(Item item) throws SQLException {
        String sql = "INSERT INTO items (item_name, category) VALUES (?, ?)";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, item.getItemName());
            ps.setString(2, item.getCategory());
            ps.executeUpdate();
        }
    }

    public void updateItem(Item item) throws SQLException {
        String sql = "UPDATE items SET item_name=?, category=? WHERE item_id=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, item.getItemName());
            ps.setString(2, item.getCategory());
            ps.setInt(3, item.getItemId());
            ps.executeUpdate();
        }
    }

    public void deleteItem(int itemId) throws SQLException {
        String sql = "DELETE FROM items WHERE item_id=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, itemId);
            ps.executeUpdate();
        }
    }

    public Item getItem(int itemId) throws SQLException {
        String sql = "SELECT * FROM items WHERE item_id=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, itemId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Item item = new Item();
                item.setItemId(rs.getInt("item_id"));
                item.setItemName(rs.getString("item_name"));
                item.setCategory(rs.getString("category"));
                return item;
            }
        }
        return null;
    }

    public List<Item> getAllItems() throws SQLException {
        List<Item> list = new ArrayList<>();
        String sql = "SELECT * FROM items";
        try (Connection con = getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Item item = new Item();
                item.setItemId(rs.getInt("item_id"));
                item.setItemName(rs.getString("item_name"));
                item.setCategory(rs.getString("category"));
                list.add(item);
            }
        }
        return list;
    }
}
