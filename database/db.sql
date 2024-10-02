-- Active: 1717816249310@@127.0.0.1@3306
CREATE DATABASE carrental
    DEFAULT CHARACTER SET = 'utf8mb4';
USE carrental;

CREATE TABLE users (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_reset_token VARCHAR(255) NOT NULL, -- Token tạm thời để đặt lại mật khẩu
  auth_key VARCHAR(32) NOT NULL, -- Dùng cho token xác thực đăng nhập (Login/Logout)
  email_verified_at TIMESTAMP, -- Thời gian xác thực email
  password VARCHAR(255) NOT NULL,
  remember_token VARCHAR(100), -- Token để ghi nhớ người dùng đã đăng nhập (Remember Me)
  token_device TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
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

