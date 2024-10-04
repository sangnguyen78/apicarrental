-- Active: 1717816249310@@127.0.0.1@3306
CREATE DATABASE carrental
    DEFAULT CHARACTER SET = 'utf8mb4';
USE carrental;

CREATE TABLE users (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_reset_token VARCHAR(255)  DEFAULT '', -- Token tạm thời để đặt lại mật khẩu,
  auth_key VARCHAR(32) NOT NULL, -- Dùng cho token xác thực đăng nhập (Login/Logout)
  email_verified_at TIMESTAMP, -- Thời gian xác thực email
  phone_number VARCHAR(60),
  password VARCHAR(255) NOT NULL,
  remember_token VARCHAR(100), -- Token để ghi nhớ người dùng đã đăng nhập (Remember Me)
  token_device TEXT,
  created_at TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);



INSERT INTO users (name, email, password_reset_token, auth_key, email_verified_at, password, remember_token, token_device)
VALUES
('John Doe', 'johndoe@example.com', 'resetToken123', 'authKey12345', '2023-09-01 10:00:00', 'password123', 'rememberMeToken1', 'deviceToken1'),
('Jane Smith', 'janesmith@example.com', 'resetToken124', 'authKey12346', '2023-09-02 11:00:00', 'password124', 'rememberMeToken2', 'deviceToken2'),
('Bob Johnson', 'bobjohnson@example.com', 'resetToken125', 'authKey12347', '2023-09-03 12:00:00', 'password125', 'rememberMeToken3', 'deviceToken3'),
('Alice Brown', 'alicebrown@example.com', 'resetToken126', 'authKey12348', '2023-09-04 13:00:00', 'password126', 'rememberMeToken4', 'deviceToken4'),
('Charlie Davis', 'charliedavis@example.com', 'resetToken127', 'authKey12349', '2023-09-05 14:00:00', 'password127', 'rememberMeToken5', 'deviceToken5'),
('David Wilson', 'davidwilson@example.com', 'resetToken128', 'authKey12350', '2023-09-06 15:00:00', 'password128', 'rememberMeToken6', 'deviceToken6'),
('Emma Miller', 'emmamiller@example.com', 'resetToken129', 'authKey12351', '2023-09-07 16:00:00', 'password129', 'rememberMeToken7', 'deviceToken7'),
('Sophia Moore', 'sophiamoore@example.com', 'resetToken130', 'authKey12352', '2023-09-08 17:00:00', 'password130', 'rememberMeToken8', 'deviceToken8'),
('Liam Taylor', 'liamtaylor@example.com', 'resetToken131', 'authKey12353', '2023-09-09 18:00:00', 'password131', 'rememberMeToken9', 'deviceToken9'),
('Olivia Anderson', 'oliviaanderson@example.com', 'resetToken132', 'authKey12354', '2023-09-10 19:00:00', 'password132', 'rememberMeToken10', 'deviceToken10');

CREATE TABLE cars (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  model VARCHAR(255) NOT NULL,
  brand VARCHAR(255) NOT NULL,
  license_plate VARCHAR(20) UNIQUE NOT NULL,
  seats INT NOT NULL,
  price_per_day DECIMAL(10, 2) NOT NULL, -- Rental price per day
  availability_status BOOLEAN DEFAULT TRUE, -- Available or not
  location VARCHAR(255) DEFAULT NULL, -- Current location of the car
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE rentals (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  car_id INT NOT NULL,
  rental_start_date TIMESTAMP NOT NULL, -- Start date of the rental
  rental_end_date TIMESTAMP NOT NULL, -- End date of the rental
  total_price DECIMAL(10, 2) NOT NULL, -- Total cost of the rental
  rental_status ENUM('booked', 'completed', 'cancelled') NOT NULL DEFAULT 'booked', -- Rental status
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (car_id) REFERENCES cars(id)
);

CREATE TABLE payments (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  rental_id INT NOT NULL,
  user_id INT NOT NULL,
  amount DECIMAL(10, 2) NOT NULL, -- Payment amount
  payment_method ENUM('credit_card', 'paypal', 'bank_transfer') NOT NULL,
  payment_status ENUM('pending', 'paid', 'failed') NOT NULL DEFAULT 'pending',
  transaction_id VARCHAR(255) DEFAULT NULL, -- Optional, depending on payment method
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (rental_id) REFERENCES rentals(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE car_reviews (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  car_id INT NOT NULL,
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5), -- Rating scale from 1 to 5
  review TEXT DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (car_id) REFERENCES cars(id)
);

CREATE TABLE car_images (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  car_id INT NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (car_id) REFERENCES cars(id)
);

CREATE TABLE car_maintenance (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  car_id INT NOT NULL,
  maintenance_type ENUM('regular', 'repair', 'inspection') NOT NULL,
  description TEXT DEFAULT NULL, -- Description of maintenance performed
  maintenance_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  cost DECIMAL(10, 2) DEFAULT 0.00,
  FOREIGN KEY (car_id) REFERENCES cars(id)
);

CREATE TABLE user_sessions (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  ip_address VARCHAR(45) DEFAULT NULL, -- IPv4/IPv6 address
  device_info VARCHAR(255) DEFAULT NULL, -- User device info
  login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  logout_time TIMESTAMP DEFAULT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE rental_feedback (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  rental_id INT NOT NULL,
  user_id INT NOT NULL,
  feedback TEXT DEFAULT NULL, -- Optional feedback from user
  feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (rental_id) REFERENCES rentals(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE locations (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  location_name VARCHAR(255) NOT NULL,
  address TEXT DEFAULT NULL,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  postal_code VARCHAR(10) DEFAULT NULL,
  latitude DECIMAL(10, 8) DEFAULT NULL,
  longitude DECIMAL(11, 8) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE customers (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL, -- Foreign key referring to the users table
  customer_code VARCHAR(50) UNIQUE NOT NULL, -- Unique customer code (optional)
  loyalty_points INT DEFAULT 0, -- Points for customer loyalty programs
  membership_level ENUM('bronze', 'silver', 'gold', 'platinum') DEFAULT 'bronze', -- Membership level
  address TEXT DEFAULT NULL, -- Customer address
  city VARCHAR(255) DEFAULT NULL,
  country VARCHAR(255) DEFAULT NULL,
  postal_code VARCHAR(10) DEFAULT NULL,
  preferred_payment_method ENUM('credit_card', 'paypal', 'bank_transfer') DEFAULT 'credit_card', -- Default payment method
  profile_picture_url VARCHAR(255) DEFAULT NULL, -- URL to customer's profile picture
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
