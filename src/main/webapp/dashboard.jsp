<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Bookshop Pahana</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: #FF0000;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 30px;
            box-shadow: 2px 0 10px rgba(0,0,0,0.05);
        }

        .sidebar img.logo {
            width: 250px;
            height: auto;
            margin-bottom: 5px;
            border-radius: 10px;
        }

        .sidebar h2 {
            font-size: 22px;
            margin-bottom: 30px;
        }

        .sidebar a {
            text-decoration: none;
            color: #001BB7;
            background: white;
            padding: 12px 20px;
            margin: 8px 0;
            width: 80%;
            text-align: center;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .sidebar a:hover {
           
            transform: translateX(5px);
        } 

        .sidebar a.exit {
            background-color:#001BB7;
            color: white;
        }

     /*   .sidebar a.exit:hover {
            background-color: #4bb7f3;
        } */

        /* Main content */
        .main-content {
            flex: 1;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('images/background.jpg'); /* 🔽 Replace with your image path */
            background-size: cover;
            background-position: center;
        }

        /* Overlay */
        .main-content::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(255, 255, 255, 0.8); /* semi-transparent overlay */
            z-index: 1;
        }

        .dashboard-box {
            position: relative;
            z-index: 2;
            background: white;
            padding: 50px 80px;
            border-radius: 16px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
            text-align: center;
        }

        .dashboard-box h1 {
            font-size: 30px;
            color: #222;
        }

        .dashboard-box span {
            color: #001BB7;
        }

        .dashboard-box p {
            font-size: 16px;
            color: #555;
            margin-top: 12px;
        }
        
    .success-message {
    background-color: #FF0000;       /* Soft green */
    color: #0f5132;                  /* Dark green text */
    padding: 50px 12px;               /* ↓ Less vertical and horizontal padding */
    border-radius: 6px;
    border: 1px solid #badbcc;
    font-weight: 500;
    margin: 10px auto 0;             /* Center horizontally and add top margin */
    text-align: center;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
    font-size: 20px;                 /* ↓ Slightly smaller font */
    width: fit-content;              /* Keeps it tight around the text */
}
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <img src="images/logo.png" alt="Logo" class="logo">
    <a href="CustomerServlet">Manage Customers</a>
    <a href="ManageItemServlet">Manage Items</a>
    <a href="DisplayCustomerServlet">View Accounts</a>
    <a href="BillGenerateServlet">Print Bill</a>
    <a href="help.jsp">Help</a>
    <a href="LogoutServlet" class="exit" onclick="return confirm('Are you sure you want to exit the system?')">Exit</a>
</div>

<!-- Main Area -->
<div class="main-content">
    <div class="dashboard-box">
        <h1>Admin Dashboard - <span> Pahana Bokshop</span></h1>
        <p>Welcome! Please select an option from the sidebar.</p>
    </div>
</div>

<%
    String loginMsg = (String) session.getAttribute("loginMessage");
    if (loginMsg != null) {
%>
    <div class="success-message"><%= loginMsg %></div>
<%
        session.removeAttribute("loginMessage");
    }
%>

<script>
    setTimeout(() => {
        const msg = document.querySelector('.success-message');
        if (msg) {
            msg.style.transition = 'opacity 1s ease';
            msg.style.opacity = '0';
            setTimeout(() => msg.remove(), 1000);
        }
    }, 3000); // 3 seconds
</script>


</body>
</html>
