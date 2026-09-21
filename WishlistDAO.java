package com.udhaya.udhayamart.dao;

import com.udhaya.udhayamart.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class WishlistDAO {

    public boolean addToWishlist(int userId, int productId) {

        String sql =
                "INSERT INTO wishlist (user_id, product_id) " +
                "VALUES (?, ?)";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);
            statement.setInt(2, productId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeFromWishlist(int userId, int productId) {

        String sql =
                "DELETE FROM wishlist " +
                "WHERE user_id = ? AND product_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);
            statement.setInt(2, productId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public java.util.List<com.udhaya.udhayamart.model.Product> getWishlist(int userId) {

    java.util.List<com.udhaya.udhayamart.model.Product> products =
            new java.util.ArrayList<>();

    String sql =
            "SELECT p.product_id, p.product_name, p.price, p.image " +
            "FROM wishlist w " +
            "JOIN products p ON w.product_id = p.product_id " +
            "WHERE w.user_id = ? " +
            "ORDER BY w.wishlist_id DESC";

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement =
                connection.prepareStatement(sql)
    ) {

        statement.setInt(1, userId);

        try (java.sql.ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                com.udhaya.udhayamart.model.Product product =
                        new com.udhaya.udhayamart.model.Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setImage(
                        resultSet.getString("image"));

                products.add(product);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return products;
}
}