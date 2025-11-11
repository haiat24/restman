<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.example.restman.dao.FoodDAO, com.example.restman.model.Food" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username");

    if (role == null || !"manager".equals(role)) {
        response.sendRedirect("../../login.jsp");
        return;
    }

    FoodDAO dao = new FoodDAO();
    List<Food> foods = dao.getAllFoods();
%>

<html>
<head>
    <title>RestMan - Quản lý món ăn</title>
    <link rel="stylesheet" href="../../index.css">
    <style>
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #34495e;
            color: white;
        }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .btn-sm {
            padding: 5px 10px;
            font-size: 14px;
            text-decoration: none;
        }
        .add-food-container {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<header>
    <h1>🍽 RestMan - Quản lý món ăn</h1>
    <nav>
        <a href="../../index.jsp">Trang chủ</a>
        <a href="MainStaff.jsp">Trang quản lý</a>
        <a href="AddFood.jsp">Thêm món ăn</a>

        <span class="welcome">Xin chào, <%= username %>!</span>
        <a href="../../logout.jsp" class="btn">Đăng xuất</a>
    </nav>
</header>

<main>
    <h2>Danh sách món ăn</h2>

    <table>
        <tr>
            <th>Mã món</th>
            <th>Tên món</th>
            <th>Giá (VNĐ)</th>
            <th>Mô tả</th>
            <th>Thao tác</th>
        </tr>

        <% if (foods != null && !foods.isEmpty()) {
            for (Food f : foods) { %>
        <tr>
            <td><%= f.getId() %></td>
            <td><%= f.getName() %></td>
            <td><%= String.format("%,.0fđ", f.getPrice()) %></td>
            <td><%= f.getDescription() %></td>
            <td>
                <a href="#" class="btn btn-sm">Sửa</a>
                <a href="#" class="btn btn-sm" style="background-color:#e74c3c;">Xóa</a>
            </td>
        </tr>
        <%   }
        } else { %>
        <tr>
            <td colspan="5">Chưa có món ăn nào trong hệ thống.</td>
        </tr>
        <% } %>
    </table>

    <div class="add-food-container">
        <a href="AddFood.jsp" class="btn">Thêm món ăn</a>
    </div>
</main>

<footer>
    © 2025 RestMan | Quản lý nhà hàng chuyên nghiệp
</footer>
</body>
</html>
