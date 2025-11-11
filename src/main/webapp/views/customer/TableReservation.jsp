<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restman.model.Table" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>

<html>
<head>
    <title>RestMan - Đặt bàn</title>
    <link rel="stylesheet" href="../../index.css">
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; margin: 0; padding: 0; }
        header { background: #333; color: #fff; padding: 15px; display: flex; justify-content: space-between; align-items: center; }
        nav a { color: #fff; text-decoration: none; margin-left: 15px; }
        main { max-width: 600px; margin: 30px auto; background: #fff; padding: 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        form { display: flex; flex-direction: column; gap: 10px; }
        label { font-weight: bold; margin-top: 10px; }
        input, select, button { padding: 8px; border: 1px solid #ccc; border-radius: 8px; font-size: 14px; }
        button { background-color: #007bff; color: white; cursor: pointer; border: none; transition: 0.2s; }
        button:hover { background-color: #0056b3; }
        footer { text-align: center; margin-top: 20px; color: #555; }
        .message { margin-top: 10px; text-align: center; font-weight: bold; }
    </style>
</head>
<body>
<header>
    <h1>🍽 RestMan - Đặt bàn</h1>
    <nav>
        <a href="MainCustomer.jsp">Trang khách hàng</a>
        <a href="../../logout.jsp">Đăng xuất</a>
    </nav>
</header>

<main>
    <h2>Đặt bàn</h2>

    <form method="post" action="<%= request.getContextPath() %>/TableReservationServlet">
        <label>Ngày đặt:</label>
        <input type="date" id="date" name="date" required>

        <label>Giờ đặt:</label>
        <select id="timeSlot" name="timeSlot" required>
            <option value="">-- Chọn giờ --</option>
            <option value="11:00">11:00</option>
            <option value="12:00">12:00</option>
            <option value="18:00">18:00</option>
            <option value="19:00">19:00</option>
        </select>

        <label>Chọn bàn trống:</label>
        <select id="table" name="table" required>
            <option value="">-- Chưa chọn ngày & giờ --</option>
        </select>

        <h3>Thông tin khách hàng</h3>
        <label>Họ tên:</label>
        <input type="text" name="name" placeholder="Nhập họ tên..." required>

        <label>Địa chỉ:</label>
        <input type="text" name="address" placeholder="Nhập địa chỉ..." required>

        <label>Email:</label>
        <input type="email" name="email" placeholder="Nhập email...">

        <label>Số điện thoại:</label>
        <input type="text" name="phone" placeholder="Nhập số điện thoại..." required>

        <button type="submit">Xác nhận đặt bàn</button>

        <% if (request.getAttribute("message") != null) { %>
        <p class="message" style="color: <%= request.getAttribute("message").toString().contains("thành công") ? "green" : "red" %>;">
            <%= request.getAttribute("message") %>
        </p>
        <% } %>
    </form>
</main>

<footer>
    © 2025 RestMan
</footer>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const dateInput = document.getElementById("date");
        const timeSlotSelect = document.getElementById("timeSlot");
        const tableSelect = document.getElementById("table");

        async function loadEmptyTables() {
            const date = dateInput.value;
            const timeSlot = timeSlotSelect.value;

            if (!date || !timeSlot) {
                console.log("Date hoặc timeSlot trống, không gọi servlet");
                tableSelect.innerHTML = '<option value="">-- Vui lòng chọn ngày & giờ --</option>';
                return;
            }

            try {
                const contextPath = '<%= request.getContextPath() %>';
                const url = contextPath + '/TableServlet?date=' + encodeURIComponent(date) + '&timeSlot=' + encodeURIComponent(timeSlot);
                console.log("URL gửi đi:", url);

                const response = await fetch(url);

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }

                const html = await response.text();
                tableSelect.innerHTML = html;

            } catch (err) {
                console.error("Lỗi khi tải bàn trống:", err);
                tableSelect.innerHTML = '<option value="">(Không tải được dữ liệu)</option>';
            }
        }

        dateInput.addEventListener("change", function() {
            console.log("Event change trên dateInput được kích hoạt");
            loadEmptyTables();
        });

        timeSlotSelect.addEventListener("change", function() {
            console.log("Event change trên timeSlotSelect được kích hoạt");
            loadEmptyTables();
        });
    });
</script>

</body>
</html>
