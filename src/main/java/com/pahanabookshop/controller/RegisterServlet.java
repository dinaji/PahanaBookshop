package com.pahanabookshop.controller;

import com.pahanabookshop.dao.UserDAO;
import com.pahanabookshop.model.User;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        if (password.length() < 6) {
            req.setAttribute("error", "Password must be at least 6 characters long.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
            return;
        }

        // Create user object
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            UserDAO userDAO = new UserDAO();
            boolean success = userDAO.registerUser(user);

            if (success) {
                HttpSession session = req.getSession();
                session.setAttribute("successMessage", "Successfully Registered! Please log in.");
                res.sendRedirect("login.jsp");
            
            } else {
                req.setAttribute("error", "Email already registered or registration failed.");
                req.getRequestDispatcher("register.jsp").forward(req, res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
            req.getRequestDispatcher("register.jsp").forward(req, res);
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}


