
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        if (username.equals("manager") && password.equals("123")) {
            session.setAttribute("role", "manager");
            session.setAttribute("username", username);
            response.sendRedirect("views/manager/MainStaff.jsp");
            return;
        } else if (username.equals("customer") && password.equals("123")) {
            session.setAttribute("role", "customer");
            session.setAttribute("username", username);
            response.sendRedirect("views/customer/MainCustomer.jsp");
            return;
        } else {
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
        }
    }
%>
<html>
<head>
    <title>Đăng nhập RestMan</title>
    <style>
        body { background: #ecf0f1; font-family: Arial; }
        .login-box { width: 340px; margin: 100px auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        input { width: 100%; padding: 8px; margin: 10px 0; }
        button { width: 100%; padding: 10px; background: #2ecc71; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background: #27ae60; }
        .error { color: red; text-align: center; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Đăng nhập hệ thống</h2>
    <form method="post">
        <label>Tên đăng nhập:</label>
        <input type="text" name="username" required>
        <label>Mật khẩu:</label>
        <input type="password" name="password" required>
        <button type="submit">Đăng nhập</button>
    </form>

    <div class="error">
        <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
    </div>
</div>
</body>
</html>
