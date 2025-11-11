package com.example.restman.servlet;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.restman.dao.CustomerDAO;
import com.example.restman.dao.TableReservationDAO;
import com.example.restman.model.Customer;
import com.example.restman.model.TableReservation;

@WebServlet("/TableReservationServlet")
public class TableReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TableReservationServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 🧾 Nhận dữ liệu đặt bàn từ form
        String dateStr = request.getParameter("date");       // yyyy-MM-dd
        String timeSlot = request.getParameter("timeSlot");
        String tableStr = request.getParameter("table");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        response.setContentType("text/html; charset=UTF-8");

        try {
            // Chuyển kiểu dữ liệu
            Date reservationDate = Date.valueOf(dateStr);
            int tableId = Integer.parseInt(tableStr);

            // 🧍‍♂️ Lưu khách hàng
            Customer customer = new Customer(name, address, email, phone);
            int customerID = CustomerDAO.saveCustomer(customer);

            if (customerID <= 0) {
                request.setAttribute("message", "Không thể lưu thông tin khách hàng.");
                request.getRequestDispatcher("/WEB-INF/customer/gdDatBan.jsp").forward(request, response);
                return;
            }

            // 🍽️ Tạo đối tượng đặt bàn
            TableReservation tableReservation = new TableReservation(
                    timeSlot, "NO", "online", reservationDate, customerID
            );

            // 🧾 Lưu thông tin đặt bàn
            int reservationID = TableReservationDAO.saveTableReservation(tableReservation);
            boolean isSuccess = false;

            if (reservationID > 0) {
                // 🔗 Lưu chi tiết đặt bàn
                isSuccess = TableReservationDAO.saveTableReservationDetail(tableId, reservationID);
            }

            if (isSuccess) {
                request.setAttribute("message", "Đặt bàn thành công!");
            } else {
                request.setAttribute("message", "Lưu thông tin đặt bàn thất bại.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Có lỗi xảy ra trong quá trình xử lý.");
        }

        // Quay lại giao diện JSP
        request.getRequestDispatcher("/WEB-INF/customer/TableReservation.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/WEB-INF/customer/gdDatBan.jsp");
    }
}
