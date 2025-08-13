package com.pahanabookshop.controller;


import com.pahanabookshop.dao.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    try {
	        UserDAO userDAO = new UserDAO();  // Or whatever your DAO is called
	        boolean isValid = userDAO.validateUser(email, password);

	        if (isValid) {
	            HttpSession session = request.getSession();
	            session.setAttribute("email", email);
	            session.setAttribute("loginMessage", "Successfully Logged In");
	            response.sendRedirect("dashboard.jsp");
	        
	        } else {
	            // Failed login
	            request.setAttribute("error", "Login failed. Invalid email or password.");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Internal error.");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    }
	}
}


