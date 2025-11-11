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
    <title>RestMan - Thêm món ăn</title>
    <link rel="stylesheet" href="../../index.css">
    <style>
        form {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            text-align: left;
        }
        label { display: block; margin-top: 10px; font-weight: bold; }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            margin-top: 15px;
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover { background-color: #27ae60; }
    </style>
</head>
<body>
<header>
    <h1>🍽 RestMan - Thêm món ăn</h1>
    <nav>
        <a href="../../index.jsp">Trang chủ</a>
        <a href="MainStaff.jsp">Trang quản lý</a>
        <a href="FoodManagement.jsp">Quản lý món ăn</a>

        <span class="welcome">Xin chào, <%= username %>!</span>
        <a href="../../logout.jsp" class="btn">Đăng xuất</a>
    </nav>
</header>

<main>
    <h2>Thêm món ăn mới</h2>

    <form method="post" action="<%= request.getContextPath() %>/manager/FoodServlet">
        <label for="id">Mã món:</label>
        <input type="text" id="id" name="id" required>

        <label for="name">Tên món:</label>
        <input type="text" id="name" name="name" required>

        <label for="price">Giá (VNĐ):</label>
        <input type="number" id="price" name="price" required>

        <label for="description">Mô tả:</label>
        <textarea id="description" name="description" rows="3"></textarea>

        <button type="submit">Thêm món ăn</button>

        <%
            String msg = (String) session.getAttribute("message");
            if (msg != null) {
        %>
        <p style="margin-top:10px; color:green;"><%= msg %></p>
        <%
                session.removeAttribute("message"); // xóa sau khi hiển thị
            }
        %>
    </form>
</main>

<footer>
    © 2025 RestMan | Quản lý nhà hàng chuyên nghiệp
</footer>
</body>
</html>
