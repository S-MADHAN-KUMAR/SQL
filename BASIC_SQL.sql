-- CREATE DATABASE name_of_the_db       "To create DB"

-- USE name_of_the_db                   " Select the DB"

-- CREATE TABLE name_of_the_table(
    -- id INT PRIMARY KEY AUTO_INCREMENT,
    -- name VARCHR(10),                                        " to create Table  "
    -- email VARCHAR(30),
    -- create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- )      

-- SHOW DATABASE              "Checking available db"

-- DROP DATABASE name_of_the_db         "Delete the db"

-- DROP TABLE name_of_the_db         "Delete the table"

-- SHOW TABLES                     "Checking available tables"

-- DROP TABLE IF EXISTS name_of_the_table    "Checking if the table exists before drop or delete "

-- =============================================================================================================

-- DESC name_of_the_table;                   "Describe Table Structure"

-- output will be like :

--       +--------+---------------+------+-----+---------+-------+
--       | Field  | Type          | Null | Key | Default | Extra |
--       +--------+---------------+------+-----+---------+-------+
--       | id     | int           | NO   | PRI | NULL    |       |
--       | name   | varchar(10)   | YES  |     | NULL    |       |
--       | salary | decimal(10,2) | YES  |     | NULL    |       |
--       +--------+---------------+------+-----+---------+-------+
--       3 rows in set (0.22 sec)

-- =============================================================================================================

-- TRUNCATE TABLE users;                           "Delete all rows but keep structure"