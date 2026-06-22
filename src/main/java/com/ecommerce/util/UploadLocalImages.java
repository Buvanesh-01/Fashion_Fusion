package com.ecommerce.util;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UploadLocalImages {
    public static void main(String[] args) {
        try {
            Connection con = DBConnection.getConnection();
            String updateQuery = "UPDATE products SET images = ? WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            
            String basePath = "C:/software development/e-commerce/e-commerce website/";
            
            // Map the files to their respective product IDs based on the user's intent
            uploadImage(ps, basePath + "hppavilionlaptop.jpeg", 3); // HP Pavilion
            uploadImage(ps, basePath + "download.jpeg", 4);         // Dell Inspiron
            uploadImage(ps, basePath + "samaung.jpeg", 2);          // Samsung Galaxy S25 (assuming phone)
            
            ps.close();
            con.close();
            System.out.println("Finished uploading local images.");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static void uploadImage(PreparedStatement ps, String filePath, int productId) {
        try {
            File file = new File(filePath);
            if (file.exists()) {
                FileInputStream fis = new FileInputStream(file);
                ps.setBlob(1, fis);
                ps.setInt(2, productId);
                ps.executeUpdate();
                System.out.println("Uploaded " + file.getName() + " for Product ID " + productId);
                fis.close();
            } else {
                System.out.println("File not found: " + filePath);
            }
        } catch (Exception e) {
            System.out.println("Error uploading " + filePath + ": " + e.getMessage());
        }
    }
}
