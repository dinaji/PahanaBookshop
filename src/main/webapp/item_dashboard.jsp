<%@ page import="java.util.List" %>
<%@ page import="com.pahanabookshop.model.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Item Management Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
           background-image: url('images/background.jpg'); /* 🔽 Replace with your image path */
            color: #333;
        }

        h2, h3 {
            color: #001BB7;
        }

        .container {
            max-width: 960px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
        }

        form {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
         
            margin-top: 20px;
        }

        form input,
        form select {
            flex: 1 1 280px;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: 0.3s ease;
        }

        form input:focus,
        form select:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }

        .btn-group {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        form button {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 8px;
            background: #FF0000;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        

        .message {
            color: #27ae60;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .error {
            color: #e74c3c;
            font-weight: 500;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            font-size: 14px;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ecf0f1;
            text-align: left;
        }

        tr:hover {
            background-color: #f1f9ff;
        }

        @media (max-width: 600px) {
            form {
                flex-direction: column;
            }
        }
        
          .back-btn {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background: #FF0000;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<div class="container">
    <center><h2>Manage Book Items</h2></center>

    <%-- Messages --%>
    <% if (request.getAttribute("message") != null) { %>
        <div class="message"><%= request.getAttribute("message") %></div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="ManageItemServlet" method="post">
        <input type="number" name="item_id" placeholder="Item ID"
               value="<%= request.getAttribute("item") != null ? ((Item)request.getAttribute("item")).getItemId() : "" %>" />

        <input type="text" name="item_name" placeholder="Item Name"
               value="<%= request.getAttribute("item") != null ? ((Item)request.getAttribute("item")).getItemName() : "" %>" />

        <select name="category">
            <option value="">-- Select Category --</option>
            <%
                String[] categories = {"Mystery", "Reference Books", "Children's Fiction", "Romance", "Fantasy"};
                String selectedCategory = (request.getAttribute("item") != null) ? ((Item)request.getAttribute("item")).getCategory() : "";
                for (String cat : categories) {
            %>
                <option value="<%= cat %>" <%= cat.equals(selectedCategory) ? "selected" : "" %>><%= cat %></option>
            <% } %>
        </select>

        <div class="btn-group">
            <button type="submit" name="action" value="Add">Add</button>
            <button type="submit" name="action" value="Update">Update</button>
            <button type="submit" name="action" value="Delete">Delete</button>
            <button type="submit" name="action" value="Search">Search</button>
        </div>
    </form>

   <center> <h3>All Items</h3></center>
    <table>
        <thead>
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Category</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Item> items = (List<Item>) request.getAttribute("itemList");
            if (items != null && !items.isEmpty()) {
                for (Item i : items) {
        %>
        <tr>
            <td><%= i.getItemId() %></td>
            <td><%= i.getItemName() %></td>
            <td><%= i.getCategory() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="3">No items found.</td></tr>
        <% } %>
        </tbody>
    </table>
    
    <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
</div>
</body>
</html>
