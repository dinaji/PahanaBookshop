<%@ page import="com.pahanabookshop.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Bill</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 40px;
           background-image: url('images/background.jpg'); /* 🔽 Replace with your image path */
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
        }

        h2 {
            text-align: center;
            color: #001BB7;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        form input[type="text"] {
            padding: 10px 14px;
            width: 250px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        form input[type="submit"] {
            padding: 10px 18px;
            background: #FF0000;
            border: none;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        form input[type="submit"]:hover {
            background: #FF0000;
        }

        .message {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .message.error {
            color: #e74c3c;
        }

        .message.success {
            color: #27ae60;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 15px;
        }

        th, td {
            text-align: left;
            padding: 12px 16px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ecf0f1;
            color: #2c3e50;
            width: 40%;
        }

        .btn-print {
            margin-top: 30px;
            background: #FF0000;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease;
        }

        
        @media print {
            .btn-print, form, .message {
                display: none;
            }
            body {
                background: white;
                padding: 0;
            }
            .container {
                box-shadow: none;
                padding: 0;
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
    <h2>Customer Bill</h2>

    <form action="<%=request.getContextPath()%>/BillGenerateServlet" method="post">
        <input type="text" name="account_no" required pattern="\d+" placeholder="Enter Account Number">
        <input type="submit" value="Generate Bill" />
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <div class="message error"><%= request.getAttribute("error") %></div>
    <% } %>
    <% if (request.getAttribute("success") != null) { %>
        <div class="message success"><%= request.getAttribute("success") %></div>
    <% } %>
    <% if (request.getAttribute("mailWarning") != null) { %>
        <div class="message" style="color:#e67e22;"><%= request.getAttribute("mailWarning") %></div>
    <% } %>
    <% if (request.getAttribute("dbWarning") != null) { %>
        <div class="message" style="color:#e67e22;"><%= request.getAttribute("dbWarning") %></div>
    <% } %>

    <% if (request.getAttribute("customer") != null) {
        Customer c = (Customer) request.getAttribute("customer");
        int price = (Integer) request.getAttribute("unitPrice");
        int total = (Integer) request.getAttribute("total");
    %>
        <table>
            <tr><th>Account No</th><td><%= c.getAccountNo() %></td></tr>
            <tr><th>Name</th><td><%= c.getName() %></td></tr>
            <tr><th>Email</th><td><%= c.getEmail() %></td></tr>
            <tr><th>Book Category</th><td><%= c.getBookCategory() %></td></tr>
            <tr><th>Book Name</th><td><%= c.getBookName() %></td></tr>
            <tr><th>Units</th><td><%= c.getUnits() %></td></tr>
            <tr><th>Unit Price (LKR)</th><td><%= price %></td></tr>
            <tr><th><strong>Total (LKR)</strong></th><td><strong><%= total %></strong></td></tr>
        </table>

        <button class="btn-print" onclick="window.print()">🖨️ Print Bill</button>
    <% } %>

    <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
</div>
</body>
</html>
