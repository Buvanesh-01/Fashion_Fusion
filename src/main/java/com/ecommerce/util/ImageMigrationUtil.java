package com.ecommerce.util;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ImageMigrationUtil {
    public static void main(String[] args) {
        String fetchQuery = "SELECT product_id, product_name FROM products WHERE product_id <= 10";
        String updateQuery = "UPDATE products SET images = ? WHERE product_id = ?";
        
        String artifactsDir = "C:/Users/BUVANESH M/.gemini/antigravity-ide/brain/656ffbd3-1d82-4990-857d-fb0d58e336bf/";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement fetchPs = con.prepareStatement(fetchQuery);
             ResultSet rs = fetchPs.executeQuery()) {

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name").toLowerCase();
                
                String filePath = null;
                if (productName.contains("iphone")) {
                    filePath = getLatestFile(artifactsDir, "iphone_15");
                } else if (productName.contains("galaxy")) {
                    filePath = getLatestFile(artifactsDir, "galaxy_s25");
                } else if (productName.contains("pavilion")) {
                    filePath = getLatestFile(artifactsDir, "hp_pavilion");
                } else if (productName.contains("rockerz")) {
                    filePath = getLatestFile(artifactsDir, "boat_rockerz");
                } else if (productName.contains("nike")) {
                    filePath = getLatestFile(artifactsDir, "nike_shoes");
                }

                if (filePath != null) {
                    File imgFile = new File(filePath);
                    if (imgFile.exists()) {
                        System.out.println("Uploading premium image for product: " + productName);
                        try (FileInputStream fis = new FileInputStream(imgFile);
                             PreparedStatement updatePs = con.prepareStatement(updateQuery)) {
                             
                            updatePs.setBlob(1, fis);
                            updatePs.setInt(2, productId);
                            updatePs.executeUpdate();
                            System.out.println("Successfully updated DB for " + productName);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static String getLatestFile(String dirPath, String prefix) {
        File dir = new File(dirPath);
        File[] files = dir.listFiles((d, name) -> name.startsWith(prefix) && name.endsWith(".png"));
        if (files != null && files.length > 0) {
            // Usually there's only one, or we take the first
            return files[0].getAbsolutePath();
        }
        return null;
    }
}
