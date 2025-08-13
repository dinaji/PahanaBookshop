<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Bookshop Login</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            margin: 0;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            display: flex;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
        }

        .image-section {
            flex: 1;
            background: url('images/login.jpg') no-repeat center;
            background-size: cover;
            min-height: 500px;
        }

        .form-section {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-section h2 {
            font-size: 28px;
            margin-bottom: 25px;
            color:  #001BB7;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="email"],
        input[type="password"] {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        button {
            padding: 12px;
            background-color: #FF0000;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #FF0000;
        }

        .link-group {
            margin-top: 15px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .link-group a {
            text-decoration: none;
            color: #FF0000;
            font-size: 14px;
        }

        .link-group a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            margin-top: 10px;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .image-section {
                min-height: 200px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="image-section"></div>
    <div class="form-section">
        <h2> Pahana Bookshop</h2>
        <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>

            <div class="link-group">
                <a href="register.jsp">Don't have an account? Register</a>
                <a href="forget.jsp">Forgot Password?</a>
            </div>

<%
    String successMsg = (String) session.getAttribute("successMessage");
    if (successMsg != null) {
%>
    <p style="color: green;"><%= successMsg %></p>
<%
        session.removeAttribute("successMessage"); // Clear message after showing
    }
%>

            <% if (request.getAttribute("error") != null) { %>
                <p class="error"><%= request.getAttribute("error") %></p>
            <% } %>
        </form>
    </div>
</div>
</body>
</html>
