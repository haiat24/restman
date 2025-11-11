package com.example.restman.dao;
import com.example.restman.model.Table;
import java.sql.*;
import java.util.ArrayList;

public class TableDAO extends DAO {

    public static ArrayList<Integer> getEmptyTables(Date reservationDate, String timeSlot) {
        ArrayList<Integer> emptyTables = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DAO.getConnection();

            String sql =
                    "SELECT t.numberTable " +
                    "FROM tblTable t " +
                    "WHERE t.id NOT IN ( " +
                    "  SELECT d.tblTableid " +
                    "  FROM tblTableReservationDetail d " +
                    "  JOIN tblTableReservation r ON r.id = d.tblTableReservationid " +
                    "  WHERE r.reservationDate = ? AND r.timeSlot = ? " +
                    ") " +
                    "ORDER BY t.numberTable";

            ps = con.prepareStatement(sql);
            ps.setDate(1, reservationDate);
            ps.setString(2, timeSlot);

            rs = ps.executeQuery();

            while (rs.next()) {
                int tableNumber = rs.getInt("numberTable");

                System.out.println("tableNumber" + tableNumber);
                emptyTables.add(tableNumber);
            }

        } catch (Exception e) {
            System.err.println("Lỗi khi lấy danh sách bàn trống:");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return emptyTables;
    }
}
