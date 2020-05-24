# Create Databases
CREATE DATABASE IF NOT EXISTS `magento_db`;

# Create user and grant rights
FLUSH PRIVILEGES;
CREATE USER 'magento'@'%' IDENTIFIED BY 'secret';
GRANT ALL ON magento_db.* TO 'magento'@'%';
