package com.pahanabookshop.controller;



import com.pahanabookshop.dao.ItemDAO;
import com.pahanabookshop.model.*;



import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/ManageItemServlet")
public class ManageItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        ItemDAO dao = new ItemDAO();

        try {
            if ("Add".equals(action)) {
                String name = req.getParameter("item_name");
                String category = req.getParameter("category");

                if (name == null || name.trim().isEmpty() || category == null || category.trim().isEmpty()) {
                    req.setAttribute("error", "Item Name and Category are required to add.");
                } else {
                    Item item = new Item();
                    item.setItemName(name.trim());
                    item.setCategory(category.trim());
                    dao.addItem(item);
                    req.setAttribute("message", "Item added successfully.");
                }

            } else if ("Update".equals(action)) {
                String idStr = req.getParameter("item_id");
                String name = req.getParameter("item_name");
                String category = req.getParameter("category");

                if (idStr == null || idStr.trim().isEmpty()) {
                    req.setAttribute("error", "Item ID is required to update.");
                } else if (name == null || name.trim().isEmpty() || category == null || category.trim().isEmpty()) {
                    req.setAttribute("error", "Item Name and Category are required to update.");
                } else {
                    int id = Integer.parseInt(idStr.trim());
                    Item item = new Item();
                    item.setItemId(id);
                    item.setItemName(name.trim());
                    item.setCategory(category.trim());
                    dao.updateItem(item);
                    req.setAttribute("message", "Item updated successfully.");
                }

            } else if ("Delete".equals(action)) {
                String idStr = req.getParameter("item_id");
                if (idStr == null || idStr.trim().isEmpty()) {
                    req.setAttribute("error", "Item ID is required to delete.");
                } else {
                    int id = Integer.parseInt(idStr.trim());
                    dao.deleteItem(id);
                    req.setAttribute("message", "Item deleted successfully.");
                }

            } else if ("Search".equals(action)) {
                String idStr = req.getParameter("item_id");
                if (idStr == null || idStr.trim().isEmpty()) {
                    req.setAttribute("error", "Please enter Item ID to search.");
                } else {
                    int id = Integer.parseInt(idStr.trim());
                    Item item = dao.getItem(id);
                    if (item != null) {
                        req.setAttribute("item", item);
                    } else {
                        req.setAttribute("error", "No item found with ID " + id);
                    }
                }
            }
        } catch (SQLException e) {
            req.setAttribute("error", "Database error: " + e.getMessage());
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid number format.");
        }

        try {
            List<Item> list = dao.getAllItems();
            req.setAttribute("itemList", list);
        } catch (SQLException e) {
            req.setAttribute("error", "Error loading items list.");
        }

        req.getRequestDispatcher("item_dashboard.jsp").forward(req, res);
    }
}
