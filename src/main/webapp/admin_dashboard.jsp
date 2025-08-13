<%@ page import="com.pahanabookshop.model.Customer" %>
<%@ page import="java.util.*, com.pahanabookshop.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-image: url('images/background.jpg'); /* 🔽 Replace with your image path */
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }

        h2 {
            text-align: center;
            color: #001BB7;
            margin-bottom: 30px;
        }

        .success {
            color: green;
            text-align: center;
            font-weight: bold;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
        }

        form input,
        form select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 15px;
        }

        .btn-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 20px;
            justify-content: space-between;
        }

        .btn-group button {
            flex: 1 1 22%;
            padding: 12px;
            background-color: #FF0000;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-group button:hover {
           
            transform: translateX(5px);
        }

        h3 {
            margin-top: 50px;
            color: #444;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #f0f0f0;
            text-align: left;
        }

        @media (max-width: 768px) {
            .btn-group {
                flex-direction: column;
            }

            .btn-group button {
                flex: 1 1 100%;
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
    <h2>Customer Management</h2>

    <% if (request.getAttribute("message") != null) { %>
        <p class="success"><%= request.getAttribute("message") %></p>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <form action="CustomerServlet" method="post">
        <input type="number" name="account_no" placeholder="Account No" required
               value="<%= request.getAttribute("customer") != null ? ((Customer)request.getAttribute("customer")).getAccountNo() : "" %>">

        <input type="text" name="name" placeholder="Name"
               value="<%= request.getAttribute("customer") != null ? ((Customer)request.getAttribute("customer")).getName() : "" %>">

        <input type="text" name="address" placeholder="Address"
               value="<%= request.getAttribute("customer") != null ? ((Customer)request.getAttribute("customer")).getAddress() : "" %>">

        <input type="text" name="phone" placeholder="Phone"
               value="<%= request.getAttribute("customer") != null ? ((Customer)request.getAttribute("customer")).getPhone() : "" %>">

        <input type="email" name="email" placeholder="Email"
               value="<%= request.getAttribute("customer") != null ? ((Customer)request.getAttribute("customer")).getEmail() : "" %>">

        <select name="book_category" required>
            <option value="">-- Select Category --</option>
            <%
                String[] categories = {"Mystery", "Reference Books", "Children's Fiction", "Romance", "Fantasy"};
                String selectedCat = (request.getAttribute("customer") != null) ? ((Customer)request.getAttribute("customer")).getBookCategory() : "";
                for (String cat : categories) {
            %>
            <option value="<%= cat %>" <%= cat.equals(selectedCat) ? "selected" : "" %>><%= cat %></option>
            <% } %>
        </select>

        <input type="text" name="book_name" placeholder="Book Name"
               value="<%= request.getAttribute("customer") != null ? ((Customer)request.getAttribute("customer")).getBookName() : "" %>">

        <input type="number" name="units" placeholder="Units"
               value="<%= request.getAttribute("customer") != null ? ((Customer)request.getAttribute("customer")).getUnits() : "" %>">

        <div class="btn-group">
            <button type="submit" name="action" value="Add">Add</button>
            <button type="submit" name="action" value="Update">Update</button>
            <button type="submit" name="action" value="Delete">Delete</button>
            <button type="submit" name="action" value="Search">Search</button>
        </div>
    </form>

    <h3>All Customers</h3>
    <table>
        <tr>
            <th>Account No</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Category</th>
            <th>Book</th>
            <th>Units</th>
        </tr>
        <%
            List<Customer> list = (List<Customer>) request.getAttribute("customerList");
            if (list != null) {
                for (Customer c : list) {
        %>
        <tr>
            <td><%= c.getAccountNo() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getPhone() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getBookCategory() %></td>
            <td><%= c.getBookName() %></td>
            <td><%= c.getUnits() %></td>
        </tr>
        <% }} %>
    </table>
    
    <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
    
</div>

</body>
</html>
