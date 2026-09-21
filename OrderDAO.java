package com.udhaya.udhayamart.dao;

import com.udhaya.udhayamart.model.CartItem;
import com.udhaya.udhayamart.model.Order;
import com.udhaya.udhayamart.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class OrderDAO {

    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT o.order_id, o.user_id, o.address_id, " +
                "o.total_amount, o.order_status, o.order_date, " +
                "u.name AS user_name, u.email AS user_email " +
                "FROM orders o " +
                "JOIN users u ON o.user_id = u.user_id " +
                "ORDER BY o.order_id DESC";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Order order = new Order();

                order.setOrderId(
                        resultSet.getInt("order_id"));

                order.setUserId(
                        resultSet.getInt("user_id"));

                order.setAddressId(
                        resultSet.getInt("address_id"));

                order.setTotalAmount(
                        resultSet.getDouble("total_amount"));

                order.setOrderStatus(
                        resultSet.getString("order_status"));

                order.setOrderDate(
                        resultSet.getTimestamp("order_date"));

                order.setUserName(
                        resultSet.getString("user_name"));

                order.setUserEmail(
                        resultSet.getString("user_email"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
    public List<Order> getOrdersByUser(int userId) {

    List<Order> orders = new ArrayList<>();

    String sql =
            "SELECT order_id, user_id, address_id, total_amount, " +
            "order_status, order_date " +
            "FROM orders " +
            "WHERE user_id = ? " +
            "ORDER BY order_id DESC";

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)
    ) {

        statement.setInt(1, userId);

        try (ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Order order = new Order();

                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setAddressId(resultSet.getInt("address_id"));
                order.setTotalAmount(resultSet.getDouble("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
                order.setOrderDate(resultSet.getTimestamp("order_date"));

                orders.add(order);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return orders;
}
    public int placeOrder(
        int userId,
        String fullName,
        String phone,
        String addressLine,
        String city,
        String state,
        String pincode,
        List<CartItem> cartItems) {

    String addressSql =
            "INSERT INTO addresses " +
            "(user_id, full_name, phone, address_line, city, state, pincode, address_type) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, 'Home')";

    String orderSql =
            "INSERT INTO orders " +
            "(user_id, address_id, total_amount, order_status) " +
            "VALUES (?, ?, ?, ?)";

    String orderItemSql =
            "INSERT INTO order_items " +
            "(order_id, product_id, quantity, price) " +
            "VALUES (?, ?, ?, ?)";

    String clearCartSql =
            "DELETE ci FROM cart_items ci " +
            "JOIN cart c ON ci.cart_id = c.cart_id " +
            "WHERE c.user_id = ?";

    try (Connection connection = DBConnection.getConnection()) {

        connection.setAutoCommit(false);

        try {

            // 1. Save address
            int addressId;

            try (PreparedStatement statement =
                         connection.prepareStatement(
                                 addressSql,
                                 PreparedStatement.RETURN_GENERATED_KEYS)) {

                statement.setInt(1, userId);
                statement.setString(2, fullName);
                statement.setString(3, phone);
                statement.setString(4, addressLine);
                statement.setString(5, city);
                statement.setString(6, state);
                statement.setString(7, pincode);

                statement.executeUpdate();

                try (ResultSet resultSet = statement.getGeneratedKeys()) {

                    if (!resultSet.next()) {
                        throw new Exception("Address ID was not generated");
                    }

                    addressId = resultSet.getInt(1);
                }
            }

            // 2. Calculate total
            double totalAmount = 0.0;

            for (CartItem item : cartItems) {
                totalAmount += item.getPrice() * item.getQuantity();
            }

            // 3. Save order
            int orderId;

            try (PreparedStatement statement =
                         connection.prepareStatement(
                                 orderSql,
                                 PreparedStatement.RETURN_GENERATED_KEYS)) {

                statement.setInt(1, userId);
                statement.setInt(2, addressId);
                statement.setDouble(3, totalAmount);
                statement.setString(4, "Order Confirmed");

                statement.executeUpdate();

                try (ResultSet resultSet = statement.getGeneratedKeys()) {

                    if (!resultSet.next()) {
                        throw new Exception("Order ID was not generated");
                    }

                    orderId = resultSet.getInt(1);
                }
            }

            // 4. Save order items
            try (PreparedStatement statement =
                         connection.prepareStatement(orderItemSql)) {

                for (CartItem item : cartItems) {

                    statement.setInt(1, orderId);
                    statement.setInt(2, item.getProductId());
                    statement.setInt(3, item.getQuantity());
                    statement.setDouble(4, item.getPrice());

                    statement.addBatch();
                }

                statement.executeBatch();
            }

            // 5. Clear cart
            try (PreparedStatement statement =
                         connection.prepareStatement(clearCartSql)) {

                statement.setInt(1, userId);
                statement.executeUpdate();
            }

            connection.commit();

            return orderId;

        } catch (Exception e) {

            connection.rollback();
            e.printStackTrace();

            return -1;
        }

    } catch (Exception e) {

        e.printStackTrace();
        return -1;
    }
}

}