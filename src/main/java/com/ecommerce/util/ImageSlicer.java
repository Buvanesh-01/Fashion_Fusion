package com.ecommerce.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.imageio.ImageIO;

public class ImageSlicer {
    public static void main(String[] args) {
        try {
            // Read the master grid image
            File inputFile = new File("C:/software development/e-commerce/e-commerce website/ChatGPT Image Jun 22, 2026, 01_34_14 AM.png");
            if (!inputFile.exists()) {
                System.out.println("Could not find the file: " + inputFile.getAbsolutePath());
                return;
            }
            
            BufferedImage masterImage = ImageIO.read(inputFile);
            
            int cols = 9;
            int rows = 5;
            
            int cellWidth = masterImage.getWidth() / cols;
            int cellHeight = masterImage.getHeight() / rows;
            
            // We'll crop 4 pixels off each side of the cell to completely eliminate 
            // any grey border grid lines that might have been caught in the slice.
            int cropMargin = 4;
            
            System.out.println("Master image: " + masterImage.getWidth() + "x" + masterImage.getHeight());
            System.out.println("Cell size: " + cellWidth + "x" + cellHeight);

            Connection con = DBConnection.getConnection();
            String updateQuery = "UPDATE products SET images = ? WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            
            int productId = 1;
            
            for (int y = 0; y < rows; y++) {
                for (int x = 0; x < cols; x++) {
                    // Extract the sub-image for the current cell, shaving off the margins
                    BufferedImage cellImage = masterImage.getSubimage(
                        x * cellWidth + cropMargin, 
                        y * cellHeight + cropMargin, 
                        cellWidth - (2 * cropMargin), 
                        cellHeight - (2 * cropMargin)
                    );
                    
                    // Convert the sub-image to a byte array
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    ImageIO.write(cellImage, "png", baos);
                    byte[] imageBytes = baos.toByteArray();
                    
                    // Update database for the corresponding product
                    ByteArrayInputStream bais = new ByteArrayInputStream(imageBytes);
                    ps.setBlob(1, bais);
                    ps.setInt(2, productId);
                    
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        System.out.println("Uploaded cleaned slice for product ID: " + productId);
                    }
                    
                    productId++;
                    if (productId > 42) {
                        // We only have 42 products, stop extracting
                        break;
                    }
                }
                if (productId > 42) {
                    break;
                }
            }
            
            ps.close();
            con.close();
            System.out.println("Successfully sliced the image and updated all 42 products in the database!");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
