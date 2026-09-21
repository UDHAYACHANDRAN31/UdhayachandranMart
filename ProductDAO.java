package com.udhaya.udhayamart.dao;

import com.udhaya.udhayamart.model.Product;
import com.udhaya.udhayamart.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products ORDER BY product_id DESC";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setProductId(resultSet.getInt("product_id"));
                product.setCategoryId(resultSet.getInt("category_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getDouble("price"));
                product.setStock(resultSet.getInt("stock"));
                product.setImage(resultSet.getString("image"));

                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    public List<Product> searchProducts(String keyword) {

    List<Product> products = new ArrayList<>();

    String sql =
            "SELECT * FROM products " +
            "WHERE product_name LIKE ? " +
            "ORDER BY product_id DESC";

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement =
                connection.prepareStatement(sql)
    ) {

        statement.setString(1, "%" + keyword + "%");

        try (ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setStock(
                        resultSet.getInt("stock"));

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


    public Product getProductById(int productId) {

        Product product = null;

        String sql = "SELECT * FROM products WHERE product_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, productId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    product = new Product();

                    product.setProductId(resultSet.getInt("product_id"));
                    product.setCategoryId(resultSet.getInt("category_id"));
                    product.setProductName(resultSet.getString("product_name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setStock(resultSet.getInt("stock"));
                    product.setImage(resultSet.getString("image"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }


    // ADD PRODUCT
    public boolean addProduct(Product product) {

        String sql = "INSERT INTO products " +
                     "(category_id, product_name, description, price, stock, image) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, product.getCategoryId());
            statement.setString(2, product.getProductName());
            statement.setString(3, product.getDescription());
            statement.setDouble(4, product.getPrice());
            statement.setInt(5, product.getStock());
            statement.setString(6, product.getImage());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // EDIT PRODUCT
    public boolean updateProduct(Product product) {

        String sql = "UPDATE products SET " +
                     "category_id = ?, " +
                     "product_name = ?, " +
                     "description = ?, " +
                     "price = ?, " +
                     "stock = ?, " +
                     "image = ? " +
                     "WHERE product_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, product.getCategoryId());
            statement.setString(2, product.getProductName());
            statement.setString(3, product.getDescription());
            statement.setDouble(4, product.getPrice());
            statement.setInt(5, product.getStock());
            statement.setString(6, product.getImage());
            statement.setInt(7, product.getProductId());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // DELETE PRODUCT
    public boolean deleteProduct(int productId) {

        String sql = "DELETE FROM products WHERE product_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, productId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Product> getProductsByCategory(int categoryId) {

    List<Product> products = new ArrayList<>();

    String sql =
            "SELECT * FROM products " +
            "WHERE category_id = ? " +
            "ORDER BY product_id DESC";

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement =
                connection.prepareStatement(sql)
    ) {

        statement.setInt(1, categoryId);

        try (ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setStock(
                        resultSet.getInt("stock"));

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


    // PRODUCT COUNT
    public int getProductCount() {

        String sql = "SELECT COUNT(*) FROM products";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {

    List<Product> products = new ArrayList<>();

    String sql =
            "SELECT * FROM products " +
            "WHERE price BETWEEN ? AND ? " +
            "ORDER BY product_id DESC";

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement =
                connection.prepareStatement(sql)
    ) {

        statement.setDouble(1, minPrice);
        statement.setDouble(2, maxPrice);

        try (ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setStock(
                        resultSet.getInt("stock"));

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
public List<Product> filterProducts(
        String keyword,
        Integer categoryId,
        Double minPrice,
        Double maxPrice,
        String sort) {

    List<Product> products = new ArrayList<>();

    StringBuilder sql = new StringBuilder(
            "SELECT * FROM products WHERE 1=1"
    );

    List<Object> params = new ArrayList<>();

    if (keyword != null && !keyword.trim().isEmpty()) {
        sql.append(" AND product_name LIKE ?");
        params.add("%" + keyword.trim() + "%");
    }

    if (categoryId != null) {
        sql.append(" AND category_id = ?");
        params.add(categoryId);
    }

    if (minPrice != null) {
        sql.append(" AND price >= ?");
        params.add(minPrice);
    }

    if (maxPrice != null) {
        sql.append(" AND price <= ?");
        params.add(maxPrice);
    }

    if ("priceLow".equals(sort)) {
    sql.append(" ORDER BY price ASC");
} else if ("priceHigh".equals(sort)) {
    sql.append(" ORDER BY price DESC");
} else {
    sql.append(" ORDER BY product_id DESC");
}

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement =
                connection.prepareStatement(sql.toString())
    ) {

        for (int i = 0; i < params.size(); i++) {
            statement.setObject(i + 1, params.get(i));
        }

        try (ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setStock(
                        resultSet.getInt("stock"));

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