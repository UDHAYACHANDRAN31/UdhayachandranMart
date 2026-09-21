package com.udhaya.udhayamart.dao;

import com.udhaya.udhayamart.util.DBConnection;
import com.udhaya.udhayamart.model.CartItem;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAO {

    public boolean addToCart(int userId, int productId) {

        String productSql =
                "SELECT stock FROM products WHERE product_id = ?";

        String findCartSql =
                "SELECT cart_id FROM cart WHERE user_id = ?";

        String createCartSql =
                "INSERT INTO cart (user_id) VALUES (?)";

        String findItemSql =
                "SELECT cart_item_id, quantity " +
                "FROM cart_items " +
                "WHERE cart_id = ? AND product_id = ?";

        String updateItemSql =
                "UPDATE cart_items " +
                "SET quantity = ? " +
                "WHERE cart_item_id = ?";

        String insertItemSql =
                "INSERT INTO cart_items " +
                "(cart_id, product_id, quantity) " +
                "VALUES (?, ?, 1)";

        try (Connection connection = DBConnection.getConnection()) {

            // Check product stock
            int stock = 0;

            try (PreparedStatement statement =
                         connection.prepareStatement(productSql)) {

                statement.setInt(1, productId);

                try (ResultSet resultSet =
                             statement.executeQuery()) {

                    if (!resultSet.next()) {
                        return false;
                    }

                    stock = resultSet.getInt("stock");
                }
            }

            if (stock <= 0) {
                return false;
            }

            int cartId = 0;

            // Find user's cart
            try (PreparedStatement statement =
                         connection.prepareStatement(findCartSql)) {

                statement.setInt(1, userId);

                try (ResultSet resultSet =
                             statement.executeQuery()) {

                    if (resultSet.next()) {
                        cartId =
                                resultSet.getInt("cart_id");
                    }
                }
            }

            // Create cart if needed
            if (cartId == 0) {

                try (PreparedStatement statement =
                             connection.prepareStatement(
                                     createCartSql,
                                     PreparedStatement.RETURN_GENERATED_KEYS)) {

                    statement.setInt(1, userId);
                    statement.executeUpdate();

                    try (ResultSet resultSet =
                                 statement.getGeneratedKeys()) {

                        if (resultSet.next()) {
                            cartId =
                                    resultSet.getInt(1);
                        }
                    }
                }
            }

            // Check existing cart quantity
            try (PreparedStatement statement =
                         connection.prepareStatement(findItemSql)) {

                statement.setInt(1, cartId);
                statement.setInt(2, productId);

                try (ResultSet resultSet =
                             statement.executeQuery()) {

                    if (resultSet.next()) {

                        int cartItemId =
                                resultSet.getInt("cart_item_id");

                        int currentQuantity =
                                resultSet.getInt("quantity");

                        // Already reached stock
                        if (currentQuantity >= stock) {
                            return false;
                        }

                        int newQuantity =
                                currentQuantity + 1;

                        try (PreparedStatement updateStatement =
                                     connection.prepareStatement(
                                             updateItemSql)) {

                            updateStatement.setInt(
                                    1,
                                    newQuantity);

                            updateStatement.setInt(
                                    2,
                                    cartItemId);

                            return updateStatement
                                    .executeUpdate() > 0;
                        }

                    } else {

                        // First item in cart
                        try (PreparedStatement insertStatement =
                                     connection.prepareStatement(
                                             insertItemSql)) {

                            insertStatement.setInt(
                                    1,
                                    cartId);

                            insertStatement.setInt(
                                    2,
                                    productId);

                            return insertStatement
                                    .executeUpdate() > 0;
                        }
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    public List<CartItem> getCartItems(int userId) {

        List<CartItem> items =
                new ArrayList<>();

        String sql =
                "SELECT ci.cart_item_id, " +
                "p.product_id, " +
                "p.product_name, " +
                "p.price, " +
                "p.stock, " +
                "ci.quantity, " +
                "p.image " +
                "FROM cart_items ci " +
                "JOIN cart c " +
                "ON ci.cart_id = c.cart_id " +
                "JOIN products p " +
                "ON ci.product_id = p.product_id " +
                "WHERE c.user_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                while (resultSet.next()) {

                    CartItem item =
                            new CartItem();

                    item.setCartItemId(
                            resultSet.getInt(
                                    "cart_item_id"));

                    item.setProductId(
                            resultSet.getInt(
                                    "product_id"));

                    item.setProductName(
                            resultSet.getString(
                                    "product_name"));

                    item.setPrice(
                            resultSet.getDouble(
                                    "price"));

                    item.setQuantity(
                            resultSet.getInt(
                                    "quantity"));

                    item.setImage(
                            resultSet.getString(
                                    "image"));

                    items.add(item);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return items;
    }


    public boolean updateCartQuantity(
            int userId,
            int productId,
            int quantity) {

        if (quantity <= 0) {
            return removeFromCart(
                    userId,
                    productId);
        }

        String stockSql =
                "SELECT stock " +
                "FROM products " +
                "WHERE product_id = ?";

        String updateSql =
                "UPDATE cart_items ci " +
                "JOIN cart c " +
                "ON ci.cart_id = c.cart_id " +
                "SET ci.quantity = ? " +
                "WHERE c.user_id = ? " +
                "AND ci.product_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement stockStatement =
                        connection.prepareStatement(stockSql)
        ) {

            stockStatement.setInt(1, productId);

            int stock;

            try (ResultSet resultSet =
                         stockStatement.executeQuery()) {

                if (!resultSet.next()) {
                    return false;
                }

                stock =
                        resultSet.getInt("stock");
            }

            // Quantity cannot exceed available stock
            if (quantity > stock) {
                return false;
            }

            try (PreparedStatement statement =
                         connection.prepareStatement(
                                 updateSql)) {

                statement.setInt(1, quantity);
                statement.setInt(2, userId);
                statement.setInt(3, productId);

                return statement.executeUpdate() > 0;
            }

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    public boolean removeFromCart(
            int userId,
            int productId) {

        String sql =
                "DELETE ci " +
                "FROM cart_items ci " +
                "JOIN cart c " +
                "ON ci.cart_id = c.cart_id " +
                "WHERE c.user_id = ? " +
                "AND ci.product_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

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


    public boolean removeCartItem(
            int cartItemId) {

        String sql =
                "DELETE FROM cart_items " +
                "WHERE cart_item_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, cartItemId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}