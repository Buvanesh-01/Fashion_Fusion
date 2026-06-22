# Fashion Fusion E-Commerce Store

![Fashion Fusion Banner](https://via.placeholder.com/1200x400?text=Fashion+Fusion+Store)

## 1. Introduction
**Fashion Fusion** (formerly the Terracotta Store) is a fully functional, dynamic e-commerce web application. It is designed with a premium, minimalist aesthetic using a curated color palette and modern UI/UX principles. The application is built using a classic enterprise Java stack, ensuring robustness, scalability, and adherence to the MVC (Model-View-Controller) design pattern.

## 2. Technology Stack
*   **Frontend:** HTML5, Vanilla CSS3 (Custom Properties/Variables, Flexbox, CSS Grid), JSP (JavaServer Pages), JSTL (JSP Standard Tag Library).
*   **Backend:** Java Servlets (Jakarta EE).
*   **Database:** MySQL.
*   **Server:** Apache Tomcat.
*   **Build Tool:** Apache Maven.

## 3. Architecture (MVC Pattern)
The application strictly follows the MVC design pattern to separate concerns:
*   **Model:** Represents the data and business logic. It includes Java beans (POJOs) like `User.java`, `Product.java`, and `CartItem.java`. The Data Access Objects (DAOs) like `ProductDAO.java` and `UserDAO.java` handle database interactions.
*   **View:** Responsible for presenting data to the user. This is handled by JSP files (`index.jsp`, `login.jsp`, `register.jsp`, `cart.jsp`). JSTL is used to dynamically loop through data (like products) and render HTML.
*   **Controller:** Java Servlets (`HomeServlet.java`, `CartServlet.java`, `LoginServlet.java`) act as controllers. They intercept HTTP requests from the View, communicate with the DAOs (Model) to fetch/update data, and forward the data back to the appropriate View.

## 4. Key Features & Implementations

### Secure Checkout & Public Storefront
The storefront is fully public, allowing users to browse and filter products dynamically without an account. However, to ensure security and capture user intent, clicking "Add to Cart" seamlessly redirects unauthenticated users directly to the Signup/Login flow before they can purchase. Once signed up, they are automatically authenticated and returned to the store.

### Database & BLOB Image Streaming
Unlike traditional applications that store images as physical files on a server, this project implements an advanced database-driven media architecture. Product images are stored directly inside the MySQL database as binary data (`MEDIUMBLOB`). A dedicated `ImageServlet` is mapped to `/productImage`, which dynamically fetches the binary stream from the database and serves it directly to the browser as an image file. This ensures perfect data integrity and makes database backups complete with all media assets.

### Dynamic Filtering Engine
The homepage features a dynamic filtering system. The application automatically queries the database for unique categories (`SELECT DISTINCT category...`) and renders the navigation bar. Users can filter by these categories or apply a maximum price constraint. The `ProductDAO` uses dynamic SQL query building to fetch only the matching records.

### Advanced CSS & UI Engineering
The frontend uses highly advanced Vanilla CSS techniques:
*   **Flex-Grow & Grid:** Ensures product cards stretch uniformly regardless of variable text length.
*   **Mix-Blend-Mode:** Applied to product images to magically erase white backgrounds, seamlessly blending the products onto the elegant background cards.
*   **CSS Animations:** Smooth `transform: translateY()` animations provide interactive feedback when hovering over products.

## 5. Short Summary
The **Fashion Fusion** E-Commerce project is a secure, dynamic web application built on Java Servlets, JSP, and MySQL. It features user authentication, a cart system, and an advanced BLOB-based image streaming architecture. The frontend boasts a premium, responsive design powered by modern CSS, including dynamic database-driven categories, live price filtering, and elegant hover animations. The architecture adheres strictly to the MVC design pattern, ensuring clean, maintainable, and scalable enterprise code.