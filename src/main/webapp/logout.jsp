<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/29/2025
  Time: 8:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();  // Xóa session
    response.sendRedirect("index.jsp"); // Quay về trang chủ (không cần login)
%>
