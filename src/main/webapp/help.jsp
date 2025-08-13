<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Help - Bookshop Admin System</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
           background-image: url('images/background.jpg'); /* 🔽 Replace with your image path */
            color: #333;
        }
        
        
        
        .help-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background: #f9f9f9;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            font-family: Arial;
        }

        .help-container h2 {
            text-align: center;
            color: #001BB7;
            margin-bottom: 20px;
        }

        .help-container h3 {
            color: #FF0000;
        }

        .help-container p {
            font-size: 15px;
            line-height: 1.8;
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

        .back-btn:hover {
            background: #FF0000;
        }
    </style>
</head>
<body>
    <div class="help-container">
        <h2>Help & System Usage Guide</h2>

        <h3> Login</h3>
        <p>Enter your registered email and password to access the admin dashboard. 
           <br>If you've forgotten your password, use the "Forget Password" link.</p>

        <h3>Register New Admin</h3>
        <p>Use the registration page to create a new admin account with valid email and password. <br>The system verifies duplicates automatically.</p>

        <h3>Manage Customer Accounts</h3>
        <p>You can add, update, search, or delete customer information on the customer management page. <br>Enter full details and use the form buttons to perform actions.</p>

        <h3>Manage Item Information</h3>
        <p>Add or update book items name, category, price, stock using the item management section. <br>It supports Create, Read, Update, and Delete (CRUD) operations.</p>

        <h3>Generate & Send Bill to Email</h3>
        <p>Go to the bill section, enter the customer account number, book name, and price per unit. <br>The system calculates the total based on units and emails the bill to the customer.</p>

        <h3>Display Account Details</h3>
        <p>Search for any customer using their account number and view their details instantly.</p>

        <h3>Need More Help</h3>
        <p>If you face issues, please contact the developer at <b>pahanabookshop@gmail.com</b>.</p>

        <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
    </div>
</body>
</html>
