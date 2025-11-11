<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>JSP - Hello World</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username");
%>
<html>
<head>
    <title>RestMan - Quản lý nhà hàng</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
<header>
    <h1>🍽 RestMan - Hệ thống quản lý nhà hàng</h1>
    <nav>
        <a href="index.jsp">Trang chủ</a>
        <a href="#">Món ăn</a>
        <a href="#">Đặt bàn</a>

        <% if (username != null) { %>
        <span class="welcome">Xin chào, <%= username %>!</span>
        <a href="logout.jsp" class="btn">Đăng xuất</a>
        <% } else { %>
        <a href="login.jsp" class="btn">Đăng nhập</a>
        <% } %>
    </nav>
</header>

<main>
    <h2>Chào mừng bạn đến với hệ thống RestMan!</h2>
    <p>Hệ thống quản lý nhà hàng chuyên nghiệp dành cho quản lý, nhân viên và khách hàng.</p>
</main>

<footer>
    © 2025 RestMan | Quản lý nhà hàng chuyên nghiệp
</footer>
</body>
</html>
