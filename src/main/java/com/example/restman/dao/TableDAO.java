package com.example.restman.dao;

import java.sql.*;
import java.util.ArrayList;
import com.example.restman.model.Table;
public class TableDAO extends DAO {

    public static ArrayList<Integer> getEmptyTables(Date reservationDate, String timeSlot) {
        ArrayList<Integer> emptyTables = new ArrayList<>();

        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            con = DAO.getConnection();

            String sql = "{CALL getEmptyTables(?, ?)}";
            System.out.println("CHECK SQL: " + sql);
            cs = con.prepareCall(sql);
            cs.setDate(1, reservationDate);
            cs.setString(2, timeSlot);

            rs = cs.executeQuery();

            while (rs.next()) {
                int tableNumber = rs.getInt("numberTable");
                emptyTables.add(tableNumber);
            }

        } catch (Exception e) {
            System.err.println("Lỗi khi lấy danh sách bàn trống:");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (cs != null) cs.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return emptyTables;
    }
}
