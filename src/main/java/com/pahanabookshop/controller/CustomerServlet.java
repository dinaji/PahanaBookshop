package com.pahanabookshop.controller;




import com.pahanabookshop.dao.*;
import com.pahanabookshop.model.*;




import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Now GET requests will also be handled by doPost()
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        CustomerDAO dao = new CustomerDAO();

        try {
            if ("Add".equals(action)) {
                Customer c = extractCustomerFromRequest(req);
                dao.addCustomer(c);
                req.setAttribute("message", "Customer added successfully!");
            } else if ("Update".equals(action)) {
                Customer c = extractCustomerFromRequest(req);
                dao.updateCustomer(c);
                req.setAttribute("message", "Customer updated successfully!");
            } else if ("Delete".equals(action)) {
                int accountNo = Integer.parseInt(req.getParameter("account_no"));
                dao.deleteCustomer(accountNo);
                req.setAttribute("message", "Customer deleted successfully!");
            } else if ("Search".equals(action)) {
                int accountNo = Integer.parseInt(req.getParameter("account_no"));
                Customer found = dao.getCustomer(accountNo);
                req.setAttribute("customer", found);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Error: " + e.getMessage());
        }

        try {
            List<Customer> customers = dao.getAllCustomers();
            req.setAttribute("customerList", customers);
        } catch (SQLException e) {
            req.setAttribute("error", "Could not load customer list.");
        }

        req.getRequestDispatcher("admin_dashboard.jsp").forward(req, res);
    }
    private Customer extractCustomerFromRequest(HttpServletRequest req) {
        Customer c = new Customer();

        String accountNoStr = req.getParameter("account_no");
        String unitsStr = req.getParameter("units");

        // Validate number fields
        if (accountNoStr == null || accountNoStr.trim().isEmpty()) {
            throw new IllegalArgumentException("Account number is required");
        }

        if (unitsStr == null || unitsStr.trim().isEmpty()) {
            throw new IllegalArgumentException("Units are required");
        }

        c.setAccountNo(Integer.parseInt(accountNoStr.trim()));
        c.setName(req.getParameter("name"));
        c.setAddress(req.getParameter("address"));
        c.setPhone(req.getParameter("phone"));
        c.setEmail(req.getParameter("email"));
        c.setBookCategory(req.getParameter("book_category"));
        c.setBookName(req.getParameter("book_name"));
        c.setUnits(Integer.parseInt(unitsStr.trim()));

        return c;
    }

}
