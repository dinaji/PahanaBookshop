package com.pahanabookshop.controller;



import com.pahanabookshop.dao.*;
import com.pahanabookshop.model.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/DisplayCustomerServlet")
public class DisplayCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        CustomerDAO dao = new CustomerDAO();
        try {
            List<Customer> customers = dao.getAllCustomers();
            req.setAttribute("customers", customers);
        } catch (SQLException e) {
            req.setAttribute("error", "Error retrieving customer data: " + e.getMessage());
        }
        req.getRequestDispatcher("display_customers.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }
}
