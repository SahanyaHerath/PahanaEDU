package edu.pahana.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.pahana.model.Product;

public class ProductDAO {
    public void addProduct(Product product) throws SQLException {
        String query = "INSERT INTO Product (name, price, description) VALUES (?, ?, ?)";

        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, product.getName());
        statement.setDouble(2, product.getPrice());
        statement.setString(3, product.getDescription());
        statement.executeUpdate();
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product";

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) 
        {
        	int id = resultSet.getInt("product_id");
        	String name = resultSet.getString("name");
        	double price = resultSet.getDouble("price");
        	String desc = resultSet.getString("description");
        	products.add(new Product(id, name, desc, price));
        }

        return products;
    }
    
    public Product getProductById(int productId) throws SQLException {
        String query = "SELECT * FROM Product WHERE product_id = ?";
        Product product = null;
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, productId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            String name = resultSet.getString("name");
            double price = resultSet.getDouble("price");
            String description = resultSet.getString("description");
            product = new Product(productId, name, description, price);
        }
        
        return product;
    }
    
    public boolean updateProduct(Product product) throws SQLException {
        String query = "UPDATE Product SET name = ?, price = ?, description = ? WHERE product_id = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, product.getName());
        statement.setDouble(2, product.getPrice());
        statement.setString(3, product.getDescription());
        statement.setInt(4, product.getProductId());
        
        int rowsUpdated = statement.executeUpdate();
        return rowsUpdated > 0;
    }
    
    public boolean deleteProduct(int productId) throws SQLException {
        String query = "DELETE FROM Product WHERE product_id = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, productId);
        
        int rowsDeleted = statement.executeUpdate();
        return rowsDeleted > 0;
    }
}