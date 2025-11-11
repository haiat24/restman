package com.example.restman.dao;

import com.example.restman.model.Food;
import java.sql.*;
import java.util.*;

public class FoodDAO {
    public List<Food> getAllFoods() {
        List<Food> list = new ArrayList<>();
        String sql = "SELECT * FROM restmandb_management.tblfood;";
        try (Connection conn = DAO.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                list.add(new Food(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean saveNewFood(Food food) {
        String sql = "INSERT INTO tblfood(id, name, price, description) VALUES (?, ?, ?, ?)";
        try (Connection conn = DAO.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, food.getId());
            ps.setString(2, food.getName());
            ps.setDouble(3, food.getPrice());
            ps.setString(4, food.getDescription());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
