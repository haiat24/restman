<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username");

    if (role == null || !"manager".equals(role)) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>
<html>
<head>
    <title>RestMan - Trang chủ quản lý</title>
    <link rel="stylesheet" href="../../index.css">
</head>
<body>
<header>
    <h1>🍽 RestMan - Hệ thống quản lý nhà hàng</h1>
    <nav>
        <a href="../../index.jsp">Trang chủ</a>
        <a href="FoodManagement.jsp">Quản lý món ăn</a>


        <span class="welcome">Xin chào, <%= username %>!</span>
        <a href="../../logout.jsp" class="btn">Đăng xuất</a>
    </nav>
</header>

<main>
    <h2>Trang chủ quản lý</h2>
    <p>Chọn chức năng bên trên để quản lý món ăn, nguyên liệu, khách hàng, hoặc nhà cung cấp.</p>
</main>

<footer>
    © 2025 RestMan | Quản lý nhà hàng chuyên nghiệp
</footer>
</body>
</html>
