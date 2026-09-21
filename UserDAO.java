package com.udhaya.udhayamart.dao;

import com.udhaya.udhayamart.model.User;
import com.udhaya.udhayamart.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public boolean registerUser(User user) {

        String sql =
                "INSERT INTO users " +
                "(name, email, password, phone) " +
                "VALUES (?, ?, ?, ?)";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getPhone());

            int result = statement.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    public User loginUser(String email, String password) {

        String sql =
                "SELECT * FROM users " +
                "WHERE email = ? AND password = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                if (resultSet.next()) {

                    User user = new User();

                    user.setUserId(
                            resultSet.getInt("user_id"));

                    user.setName(
                            resultSet.getString("name"));

                    user.setEmail(
                            resultSet.getString("email"));

                    user.setPassword(
                            resultSet.getString("password"));

                    user.setPhone(
                            resultSet.getString("phone"));

                    return user;
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }


    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        String sql =
                "SELECT * FROM users " +
                "ORDER BY user_id DESC";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql);
                ResultSet resultSet =
                        statement.executeQuery()
        ) {

            while (resultSet.next()) {

                User user = new User();

                user.setUserId(
                        resultSet.getInt("user_id"));

                user.setName(
                        resultSet.getString("name"));

                user.setEmail(
                        resultSet.getString("email"));

                user.setPassword(
                        resultSet.getString("password"));

                user.setPhone(
                        resultSet.getString("phone"));

                users.add(user);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return users;
    }


    public int getUserCount() {

        String sql =
                "SELECT COUNT(*) FROM users";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql);
                ResultSet resultSet =
                        statement.executeQuery()
        ) {

            if (resultSet.next()) {

                return resultSet.getInt(1);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }


    public boolean deleteUser(int userId) {

        String sql =
                "DELETE FROM users WHERE user_id = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}