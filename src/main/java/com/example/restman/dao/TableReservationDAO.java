package com.example.restman.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.example.restman.model.TableReservation;

public class TableReservationDAO {

    // Hàm lưu đặt bàn, trả về ID của bản ghi mới (hoặc -1 nếu trùng)
    public static int saveTableReservation(TableReservation tableReservation) throws SQLException {
        int tableReservationID = -1;
        String checkSql = "SELECT id FROM tblTableReservation WHERE timeSlot = ? AND reservationDate = ?";

        try (Connection con = DAO.getConnection();
             PreparedStatement checkStmt = con.prepareStatement(checkSql)) {

            checkStmt.setString(1, tableReservation.getTimeSlot());
            checkStmt.setDate(2, tableReservation.getReservationDate());
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) { // Nếu chưa có đặt bàn cùng thời gian + ngày
                String insertSql = "INSERT INTO tblTableReservation (timeSlot, isCheckIn, bookingType, reservationDate, tblCustomertblUserid) VALUES (?, ?, ?, ?, ?)";

                try (PreparedStatement insertStmt = con.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
                    insertStmt.setString(1, tableReservation.getTimeSlot());
                    insertStmt.setString(2, tableReservation.getIsCheckIn());
                    insertStmt.setString(3, tableReservation.getBookingType());
                    insertStmt.setDate(4, tableReservation.getReservationDate());
                    insertStmt.setInt(5, tableReservation.getCustomerID());

                    insertStmt.executeUpdate();

                    ResultSet key = insertStmt.getGeneratedKeys();
                    if (key.next()) {
                        tableReservationID = key.getInt(1);
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("⚠️ Lỗi khi lưu thông tin đặt bàn:");
            e.printStackTrace();
        }

        return tableReservationID;
    }

    // Lưu chi tiết đặt bàn (bàn nào thuộc đặt bàn nào)
    public static boolean saveTableReservationDetail(int tableId, int tableReservationID) throws SQLException {
        boolean result = false;
        String sql = "INSERT INTO tblTableReservationDetail (tblTableid, tblTableReservationid) VALUES (?, ?)";

        try (Connection con = DAO.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, tableId);
            stmt.setInt(2, tableReservationID);

            stmt.executeUpdate();
            result = true;

        } catch (SQLException e) {
            System.err.println("⚠️ Lỗi khi lưu chi tiết đặt bàn:");
            e.printStackTrace();
        }

        return result;
    }
}
