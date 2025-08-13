package com.pahanabookshop.dao;

import com.pahanabookshop.model.User;
import com.pahanabookshop.util.DBConnection;

import java.sql.*;

public class UserDAO {
	public boolean validateUser(String email, String password) throws SQLException {
	    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, email);
	        ps.setString(2, password);
	        ResultSet rs = ps.executeQuery();
	        return rs.next(); // true if user found
	    }
	}

    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            return ps.executeUpdate() > 0;
        }
    }


    public String recoverPassword(String email) throws SQLException {
        String sql = "SELECT password FROM users WHERE email=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getString("password");
            return null;
        }
    }
}

