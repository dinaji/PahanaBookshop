<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Bookshop - Recover Password</title>
    <link rel="stylesheet" href="css/style.css">
    
    <style>
    /* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background-image: url('images/background.jpg'); /* 🔽 Replace with your image path */
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

/* Form Container Styling */
.form-container {
    background-color: #ffffff;
    padding: 40px 30px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 350px;
    text-align: center;
}

/* Form Title */
.form-container h2 {
    margin-bottom: 20px;
    color:  #001BB7;
    font-weight: bold;
}

/* Input Field */
.form-container input[type="email"] {
    width: 100%;
    padding: 12px;
    margin: 10px 0 20px 0;
    border: 1px solid #cccccc;
    border-radius: 5px;
    box-sizing: border-box;
}

/* Submit Button */
.form-container button {
    width: 100%;
    padding: 12px;
    background-color: #FF0000;
    color: white;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.form-container button:hover {
    background-color:#FF0000;
}

/* Link Group */
.link-group {
    margin-top: 20px;
}

.link-group a {
    color: #FF0000;
    text-decoration: none;
    font-weight: bold;
}

.link-group a:hover {
    text-decoration: underline;
}

/* Error Message */
.error {
    color: #dc3545;
    font-weight: bold;
    margin-top: 15px;
}

/* Success Message */
.success {
    color: #28a745;
    font-weight: bold;
    margin-top: 15px;
}
    
    </style>
    
</head>
<body>
<div class="form-container">
    <h2>Recover Your Password</h2>
    <form action="ForgetPasswordServlet" method="post">
        <input type="email" name="email" placeholder="Enter your email" required>
        <button type="submit">Recover Password</button>
        <div class="link-group">
            <a href="login.jsp">Back to Login</a>
        </div>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <% if (request.getAttribute("message") != null) { %>
            <p class="success"><%= request.getAttribute("message") %></p>
        <% } %>
    </form>
</div>
</body>
</html>
