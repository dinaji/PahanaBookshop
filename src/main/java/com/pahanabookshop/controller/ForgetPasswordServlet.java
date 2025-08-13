package com.pahanabookshop.controller;


import com.pahanabookshop.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ForgetPasswordServlet")

public class ForgetPasswordServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");

        try {
            String password = new UserDAO().recoverPassword(email);
            if (password != null) {
                req.setAttribute("message", "Your password: " + password);
            } else {
                req.setAttribute("error", "Email not found.");
            }
            req.getRequestDispatcher("forget.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error occurred.");
            req.getRequestDispatcher("forget.jsp").forward(req, res);
        }
    }
}
