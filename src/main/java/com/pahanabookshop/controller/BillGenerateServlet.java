package com.pahanabookshop.controller;

import com.pahanabookshop.model.*;
import com.pahanabookshop.dao.*;
import com.pahanabookshop.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/BillGenerateServlet")
public class BillGenerateServlet extends HttpServlet {

    private final Map<String, Integer> categoryPrices = new HashMap<>() {{
        put("Novel", 1000);
        put("Educational", 2000);
        put("Biography", 1500);
        put("Children", 800);
        put("Comics", 1200);
    }};

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String accountNoStr = req.getParameter("account_no");
        if (accountNoStr == null || accountNoStr.isBlank()) {
            req.setAttribute("error", "Please enter the account number.");
            req.getRequestDispatcher("bill.jsp").forward(req, res);
            return;
        }

        int accountNo;
        try {
            accountNo = Integer.parseInt(accountNoStr.trim());
        } catch (NumberFormatException nfe) {
            req.setAttribute("error", "Account number must be digits only.");
            req.getRequestDispatcher("bill.jsp").forward(req, res);
            return;
        }

        try {
            Customer customer = new CustomerDAO().getCustomer(accountNo);
            if (customer == null) {
                req.setAttribute("error", "No customer found with account number " + accountNo);
                req.getRequestDispatcher("bill.jsp").forward(req, res);
                return;
            }

            int pricePerUnit = categoryPrices.getOrDefault(customer.getBookCategory(), 1000);
            int total = pricePerUnit * customer.getUnits();

            Bill bill = new Bill();
            bill.setAccountNo(customer.getAccountNo());
            bill.setName(customer.getName());
            bill.setEmail(customer.getEmail());
            bill.setBookCategory(customer.getBookCategory());
            bill.setBookName(customer.getBookName());
            bill.setUnits(customer.getUnits());
            bill.setUnitPrice(pricePerUnit);
            bill.setTotal(total);

            int rows = 0;
            try {
                rows = new BillDAO().saveBill(bill);
            } catch (SQLException sqle) {
                req.setAttribute("dbWarning", "DB save failed: " + sqle.getMessage());
            }
            if (rows == 0) {
                req.setAttribute("dbWarning", "Bill generated but not saved (0 rows affected).");
            }

            try {
                BillEmailUtil.sendBillEmail(customer, pricePerUnit, total);
                req.setAttribute("success", "Bill generated and emailed to " + customer.getEmail());
            } catch (Exception mailEx) {
                mailEx.printStackTrace();
                req.setAttribute("mailWarning", "Bill generated but email failed: " + mailEx.getMessage());
            }

            req.setAttribute("customer", customer);
            req.setAttribute("unitPrice", pricePerUnit);
            req.setAttribute("total", total);
            req.getRequestDispatcher("bill.jsp").forward(req, res);

        } catch (Exception e) {
            req.setAttribute("error", "Error: " + e.getMessage());
            req.getRequestDispatcher("bill.jsp").forward(req, res);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }
}
