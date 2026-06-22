package com.ecommerce.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.imageio.ImageIO;

public class CropDBImages {
    public static void main(String[] args) {
        try {
            Connection con = DBConnection.getConnection();
            String selectQuery = "SELECT product_id, images FROM products";
            String updateQuery = "UPDATE products SET images = ? WHERE product_id = ?";
            
            PreparedStatement selectPs = con.prepareStatement(selectQuery);
            PreparedStatement updatePs = con.prepareStatement(updateQuery);
            
            ResultSet rs = selectPs.executeQuery();
            
            int croppedCount = 0;
            
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                InputStream is = rs.getBinaryStream("images");
                
                if (is != null) {
                    BufferedImage img = ImageIO.read(is);
                    
                    if (img != null) {
                        // The grid slices are exactly 170x204.
                        // We target images smaller than 300px to remove their border lines.
                        if (img.getWidth() < 300 && img.getHeight() < 300) {
                            
                            int crop = 4; // Shave 4 pixels off all edges
                            
                            // Ensure we don't crop too much
                            if (img.getWidth() > 2 * crop && img.getHeight() > 2 * crop) {
                                BufferedImage croppedImg = img.getSubimage(crop, crop, img.getWidth() - 2 * crop, img.getHeight() - 2 * crop);
                                
                                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                                ImageIO.write(croppedImg, "png", baos);
                                byte[] newImageBytes = baos.toByteArray();
                                
                                ByteArrayInputStream bais = new ByteArrayInputStream(newImageBytes);
                                updatePs.setBlob(1, bais);
                                updatePs.setInt(2, productId);
                                updatePs.executeUpdate();
                                
                                System.out.println("Cropped ugly border lines from product ID: " + productId);
                                croppedCount++;
                            }
                        }
                    }
                }
            }
            
            rs.close();
            selectPs.close();
            updatePs.close();
            con.close();
            
            System.out.println("Finished! Cropped border lines from " + croppedCount + " images.");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
