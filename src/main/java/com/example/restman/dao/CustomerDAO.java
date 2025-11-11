package com.example.restman.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.example.restman.model.Customer;

public class CustomerDAO {

    // Lưu khách hàng mới vào CSDL và trả về ID
    public static int saveCustomer(Customer customer) {
        int customerId = -1;
        String checkSql = "SELECT id FROM tblCustomer WHERE email = ? OR phoneNumber = ?";

        try (Connection con = DAO.getConnection();
             PreparedStatement checkStmt = con.prepareStatement(checkSql)) {

            checkStmt.setString(1, customer.getEmail());
            checkStmt.setString(2, customer.getPhoneNumber());
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Đã tồn tại -> trả về id cũ
                customerId = rs.getInt("id");
                return customerId;
            }

            // Nếu chưa có, thêm mới
            String insertSql = "INSERT INTO tblCustomer (name, address, email, phoneNumber) VALUES (?, ?, ?, ?)";
            try (PreparedStatement insertStmt = con.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
                insertStmt.setString(1, customer.getName());
                insertStmt.setString(2, customer.getAddress());
                insertStmt.setString(3, customer.getEmail());
                insertStmt.setString(4, customer.getPhoneNumber());
                insertStmt.executeUpdate();

                ResultSet key = insertStmt.getGeneratedKeys();
                if (key.next()) {
                    customerId = key.getInt(1);
                }
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi lưu khách hàng:");
            e.printStackTrace();
        }

        return customerId;
    }

    // Tìm khách hàng theo ID
    public static Customer getCustomerById(int id) {
        Customer customer = null;
        String sql = "SELECT * FROM tblCustomer WHERE id = ?";

        try (Connection con = DAO.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phoneNumber")
                );
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn khách hàng theo ID:");
            e.printStackTrace();
        }

        return customer;
    }
}
