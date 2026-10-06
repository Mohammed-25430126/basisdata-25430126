-- Environment Initialization Script - Module 1
-- Student Name: Mohammed Abdulalem Abdulsalam
-- Student NIM: 25430126

CREATE DATABASE IF NOT EXISTS kopma_126
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'mhs_126'@'localhost' IDENTIFIED BY 'PASSWORD_PLACEHOLDER';
GRANT ALL PRIVILEGES ON kopma_126.* TO 'mhs_126'@'localhost';

CREATE DATABASE IF NOT EXISTS klinik_126
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'dev_126'@'localhost' IDENTIFIED BY 'PASSWORD_PLACEHOLDER';
GRANT ALL PRIVILEGES ON klinik_126.* TO 'dev_126'@'localhost';

FLUSH PRIVILEGES;