package com.pahanabookshop.dao;

import com.pahanabookshop.model.*;
import com.pahanabookshop.util.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    public boolean addCustomer(Customer c) throws SQLException {
        String sql = "INSERT INTO customers VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, c.getAccountNo());
            ps.setString(2, c.getName());
            ps.setString(3, c.getAddress());
            ps.setString(4, c.getPhone());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getBookCategory());
            ps.setString(7, c.getBookName());
            ps.setInt(8, c.getUnits());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateCustomer(Customer c) throws SQLException {
        String sql = "UPDATE customers SET name=?, address=?, phone=?, email=?, book_category=?, book_name=?, units=? WHERE account_no=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getName());
            ps.setString(2, c.getAddress());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getEmail());
            ps.setString(5, c.getBookCategory());
            ps.setString(6, c.getBookName());
            ps.setInt(7, c.getUnits());
            ps.setInt(8, c.getAccountNo());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteCustomer(int accountNo) throws SQLException {
        String sql = "DELETE FROM customers WHERE account_no=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, accountNo);
            return ps.executeUpdate() > 0;
        }
    }

    public Customer getCustomer(int accountNo) throws SQLException {
        String sql = "SELECT * FROM customers WHERE account_no=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, accountNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setAccountNo(rs.getInt("account_no"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                c.setEmail(rs.getString("email"));
                c.setBookCategory(rs.getString("book_category"));
                c.setBookName(rs.getString("book_name"));
                c.setUnits(rs.getInt("units"));
                
            
                return c;
            }
        }
        return null;
    }

    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM customers";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Customer c = new Customer();
                c.setAccountNo(rs.getInt("account_no"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                c.setEmail(rs.getString("email"));
                c.setBookCategory(rs.getString("book_category"));
                c.setBookName(rs.getString("book_name"));
                c.setUnits(rs.getInt("units"));
                list.add(c);
            }
        }
        return list;
    }
}
