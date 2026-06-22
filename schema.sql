CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    images VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cart_items (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Insert some dummy products for testing
INSERT IGNORE INTO products (product_name, category, brand, price, stock_quantity, description, images) VALUES 
('Clay Pour-over Coffee Maker', 'Kitchen', 'Fashion Fusion', 45.00, 20, 'Handcrafted unglazed clay.', 'images/clay_coffee_maker.png'),
('Linen Apron', 'Apparel', 'Fashion Fusion', 65.00, 15, '100% organic linen.', 'images/linen_apron.png'),
('Ceramic Mug', 'Kitchen', 'Fashion Fusion', 18.00, 50, 'Perfect for slow mornings.', 'images/ceramic_mug.png');
