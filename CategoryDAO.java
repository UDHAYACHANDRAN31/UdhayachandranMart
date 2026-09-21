package com.udhaya.udhayamart.dao;

import com.udhaya.udhayamart.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class CategoryDAO {

    public Map<Integer, String> getAllCategories() {

        Map<Integer, String> categories = new LinkedHashMap<>();

        String sql =
                "SELECT category_id, category_name " +
                "FROM categories " +
                "ORDER BY category_name";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            ResultSet resultSet =
                    statement.executeQuery()
        ) {

            while (resultSet.next()) {

                categories.put(
                        resultSet.getInt("category_id"),
                        resultSet.getString("category_name")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }
}