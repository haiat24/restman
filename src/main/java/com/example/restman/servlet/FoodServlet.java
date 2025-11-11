package com.example.restman.servlet;

import java.io.IOException;
import com.example.restman.dao.FoodDAO;
import com.example.restman.model.Food;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/manager/FoodServlet")
public class FoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // hỗ trợ tiếng Việt

        // Lấy dữ liệu từ form
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String priceStr = req.getParameter("price");
        String description = req.getParameter("description");

        String message;

        try {
            double price = Double.parseDouble(priceStr);

            Food food = new Food(id, name, price, description);

            boolean success = FoodDAO.saveNewFood(food);

            if (success) {
                message = "Thêm món ăn thành công!";
            } else {
                message = "Thêm món ăn thất bại. Vui lòng thử lại!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Lỗi: " + e.getMessage();
        }

        // Gửi lại trang AddFood.jsp cùng thông báo
        HttpSession session = req.getSession();
        session.setAttribute("message", message);
        resp.sendRedirect(req.getContextPath() + "/views/manager/AddFood.jsp");
    }
}
