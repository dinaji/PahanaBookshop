<%@ page import="java.util.List" %>
<%@ page import="com.pahanabookshop.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Account Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-image: url('images/background.jpg'); /* 🔽 Replace with your image path */
            color: #333;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
        }

        h2 {
            text-align: center;
            color: #001BB7;
            margin-bottom: 25px;
        }

        .error {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #ecf0f1;
            color: #333;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f9ff;
        }

        tr:nth-child(even) {
            background-color: #fafafa;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            td {
                position: relative;
                padding-left: 50%;
                border: none;
                border-bottom: 1px solid #ddd;
            }

            td::before {
                position: absolute;
                left: 10px;
                top: 12px;
                white-space: nowrap;
                font-weight: bold;
                color: #999;
            }

            td:nth-of-type(1)::before { content: "Account No"; }
            td:nth-of-type(2)::before { content: "Name"; }
            td:nth-of-type(3)::before { content: "Address"; }
            td:nth-of-type(4)::before { content: "Phone"; }
            td:nth-of-type(5)::before { content: "Email"; }
            td:nth-of-type(6)::before { content: "Book Category"; }
            td:nth-of-type(7)::before { content: "Book Name"; }
            td:nth-of-type(8)::before { content: "Units"; }
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
    <h2>Customer Account Details</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <table>
        <thead>
        <tr>
            <th>Account No</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Book Category</th>
            <th>Book Name</th>
            <th>Units</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Customer> customers = (List<Customer>) request.getAttribute("customers");
            if (customers != null && !customers.isEmpty()) {
                for (Customer c : customers) {
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
        <%
                }
            } else {
        %>
        <tr><td colspan="8">No customers found.</td></tr>
        <% } %>
        </tbody>
    </table>
    <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
    
</div>


</body>
</html>
