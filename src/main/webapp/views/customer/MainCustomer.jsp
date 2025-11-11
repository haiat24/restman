<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Admin--%>
<%--  Date: 10/29/2025--%>
<%--  Time: 8:26 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%--%>
<%--    String role = (String) session.getAttribute("role");--%>
<%--    String username = (String) session.getAttribute("username");--%>

<%--    if (role == null || !"customer".equals(role)) {--%>
<%--        response.sendRedirect("../../login.jsp");--%>
<%--        return;--%>
<%--    }--%>
<%--%>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>RestMan - Trang khách hàng</title>--%>
<%--    <link rel="stylesheet" href="../../index.css">--%>
<%--    <style>--%>
<%--        main {--%>
<%--            text-align: center;--%>
<%--            margin-top: 50px;--%>
<%--        }--%>
<%--        .action-box {--%>
<%--            display: inline-block;--%>
<%--            width: 280px;--%>
<%--            height: 160px;--%>
<%--            margin: 20px;--%>
<%--            padding: 20px;--%>
<%--            background-color: #fff;--%>
<%--            border-radius: 12px;--%>
<%--            box-shadow: 0 0 10px rgba(0,0,0,0.15);--%>
<%--            transition: transform 0.2s, box-shadow 0.2s;--%>
<%--        }--%>
<%--        .action-box:hover {--%>
<%--            transform: translateY(-5px);--%>
<%--            box-shadow: 0 6px 16px rgba(0,0,0,0.25);--%>
<%--        }--%>
<%--        .action-box a {--%>
<%--            text-decoration: none;--%>
<%--            color: #2c3e50;--%>
<%--            font-size: 18px;--%>
<%--            font-weight: bold;--%>
<%--            display: block;--%>
<%--            margin-top: 40px;--%>
<%--        }--%>
<%--        footer {--%>
<%--            margin-top: 80px;--%>
<%--            text-align: center;--%>
<%--            color: #777;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<header>--%>
<%--    <h1>🍽 RestMan - Khu vực khách hàng</h1>--%>
<%--    <nav>--%>
<%--        <a href="../../index.jsp">Trang chủ</a>--%>
<%--        <a href="FoodMenu.jsp">Thực đơn</a>--%>
<%--        <a href="TableReservation.jsp">Đặt bàn</a>--%>

<%--        <span class="welcome">Xin chào, <%= username %>!</span>--%>
<%--        <a href="../../logout.jsp" class="btn">Đăng xuất</a>--%>
<%--    </nav>--%>
<%--</header>--%>

<%--<main>--%>
<%--    <h2>Chào mừng, <%= username %>!</h2>--%>
<%--    <p>Hãy chọn hành động bạn muốn thực hiện:</p>--%>

<%--    <div class="action-box">--%>
<%--&lt;%&ndash;        <img src="../../assets/food-icon.png" alt="Thực đơn" width="64" height="64">&ndash;%&gt;--%>
<%--        <a href="FoodMenu.jsp"> Xem thực đơn</a>--%>
<%--    </div>--%>

<%--    <div class="action-box">--%>
<%--&lt;%&ndash;        <img src="../../assets/table-icon.png" alt="Đặt bàn" width="64" height="64">&ndash;%&gt;--%>
<%--        <a href="TableReservation.jsp">Đặt bàn ngay</a>--%>
<%--    </div>--%>
<%--</main>--%>

<%--<footer>--%>
<%--    © 2025 RestMan | Quản lý nhà hàng chuyên nghiệp--%>
<%--</footer>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>
<html>
<head>
    <title>RestMan - Trang khách hàng</title>
    <link rel="stylesheet" href="../../index.css">
</head>
<body>
<header>
    <h1>🍽 RestMan - Xin chào, <%= username %>!</h1>
    <nav>
        <a href="../../index.jsp">Trang chủ</a>
        <a href="TableReservation.jsp">Đặt bàn</a>
        <a href="../../logout.jsp" class="btn">Đăng xuất</a>
    </nav>
</header>

<main>
    <h2>Trang khách hàng</h2>
    <p>Chọn menu “Đặt bàn” để đặt chỗ trước tại nhà hàng.</p>
</main>

<footer>
    © 2025 RestMan | Quản lý nhà hàng chuyên nghiệp
</footer>
</body>
</html>
