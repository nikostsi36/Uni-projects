-- SIMPLE USER
CREATE USER 'simpleuser'@'localhost' IDENTIFIED BY 'simplepassword';
CREATE USER 'simpleuser'@'%' IDENTIFIED BY 'simplepassword';
GRANT SELECT ON mydb.* TO 'simpleuser'@'localhost';
GRANT SELECT ON mydb.* TO 'simpleuser'@'%';

-- INSTITUTION USER
CREATE USER 'institution'@'localhost' IDENTIFIED BY 'institutionpass';
CREATE USER 'institution'@'%' IDENTIFIED BY 'institutionpass';
GRANT SELECT, INSERT, UPDATE ON mydb.* TO 'institution'@'localhost';
GRANT SELECT, INSERT, UPDATE ON mydb.* TO 'institution'@'%';

-- ADMIN
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpass';
GRANT ALL PRIVILEGES ON mydb.* TO 'admin'@'localhost';