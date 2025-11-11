package com.example.restman.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.restman.dao.TableDAO;

@WebServlet("/TableServlet")
public class TableServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String date = request.getParameter("date");
        String timeSlot = request.getParameter("timeSlot");

        System.out.println("data svl:" + date);
        System.out.println("timeSlot svl:" + timeSlot);

        if (date == null || timeSlot == null || date.isEmpty() || timeSlot.isEmpty()) {
            response.getWriter().write("<option value=''>Vui lòng chọn ngày và giờ</option>");
            return;
        }

        try {
            Date sqlDate = Date.valueOf(date);
            ArrayList<Integer> emptyTables = TableDAO.getEmptyTables(sqlDate, timeSlot);

            System.out.println("Gọi getEmptyTable thành công, số bàn trống: " + emptyTables.size());
            for (Integer t : emptyTables) {
                System.out.println("   - Bàn số " + t);
            }

            StringBuilder options = new StringBuilder();

            if (emptyTables != null && !emptyTables.isEmpty()) {
                for (Integer tableNumber : emptyTables) {
                    options.append("<option value='")
                            .append(tableNumber)
                            .append("'>Bàn số ")
                            .append(tableNumber)
                            .append("</option>");
                }
            } else {
                options.append("<option value=''>Không có bàn trống</option>");
            }

            response.getWriter().write(options.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("<option value=''>Lỗi khi tải danh sách bàn</option>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
