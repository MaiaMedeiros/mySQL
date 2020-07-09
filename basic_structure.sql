mysql> USE MYSQLDEV;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+--------------------+
| Tables_in_mysqldev |
+--------------------+
| ADDRESS            |
+--------------------+
1 row in set (0.00 sec)


#### CREATING TABLES

mysql> SHOW CREATE TABLE ADDRESS;

| ADDRESS | CREATE TABLE `ADDRESS` (
  `ADDRESS_ID` int NOT NULL,
  `ADDRESS_LINE1` varchar(100) DEFAULT NULL,
  `ADDRESS_LINE2` varchar(100) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `STATE_CD` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |

1 row in set (0.01 sec)

mysql> CREATE TABLE CUSTOMER ( CUSTOMER_ID INT, FIRST_NAME VARCHAR(100), LAST_NAME VARCHAR(100), EMAIL VARCHAR(100), PHONE VARCHAR(100), DATE_PURCHASED DATE, ADDRESS_ID INT, ORDER_ID INT );

Query OK, 0 rows affected (0.02 sec)

mysql> SHOW CREATE TABLE CUSTOMER;
| Table  | Create Table  |

| CUSTOMER | CREATE TABLE `CUSTOMER` (
  `CUSTOMER_ID` int NOT NULL,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `DATE_PURCHASED` date DEFAULT NULL,
  `ADDRESS_ID` int DEFAULT NULL,
  `ORDER_ID` int DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |

1 row in set (0.00 sec)

mysql> CREATE TABLE ORDERS ( ORDER_ID INT, PRODUCT_CODE VARCHAR(100), PRODUCT_DESCRIPTION VARCHAR(100), TRANSACTION_DATE DATE );
Query OK, 0 rows affected (0.03 sec)

mysql> SHOW CREATE TABLE ORDERS;

| ORDERS | CREATE TABLE `ORDERS` (
  `ORDER_ID` int NOT NULL,
  `PRODUCT_CODE` varchar(100) DEFAULT NULL,
  `PRODUCT_DESCRIPTION` varchar(100) DEFAULT NULL,
  `TRANSACTION_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |

1 row in set (0.00 sec)

mysql> SHOW TABLES;
+--------------------+
| Tables_in_mysqldev |
+--------------------+
| ADDRESS            |
| CUSTOMER           |
| ORDERS             |
+--------------------+
3 rows in set (0.01 sec)

#### PRIMARY_KEYS

ALTER TABLE ADDRESS ADD CONSTRAINT PK_ADDRESS_ID PRIMARY KEY(ADDRESS_ID);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDER_ID PRIMARY KEY(ORDER_ID);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER_ID PRIMARY KEY(CUSTOMER_ID);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

#### FOREIGN_KEYS

mysql> ALTER TABLE ADDRESS ADD INDEX ADDRESS_1_ID(ADDRESS_ID);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE ADDRESS ADD CONSTRAINT FK_ADDRESS FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE ORDERS ADD INDEX ORDER_1_ID(ORDER_ID);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDER_ID FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

#### UNIQUE

mysql> ALTER TABLE CUSTOMER ADD CONSTRAINT UK_EMAIL UNIQUE(EMAIL);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

#### SHOWING FINAL TABLES

mysql> SHOW CREATE TABLE ADDRESS;
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table |
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ADDRESS | CREATE TABLE `ADDRESS` (
  `ADDRESS_ID` int NOT NULL,
  `ADDRESS_LINE1` varchar(100) DEFAULT NULL,
  `ADDRESS_LINE2` varchar(100) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `STATE_CD` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_1_ID` (`ADDRESS_ID`),
  CONSTRAINT `FK_ADDRESS` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SHOW CREATE TABLE ORDERS;
+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table |
+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ORDERS | CREATE TABLE `ORDERS` (
  `ORDER_ID` int NOT NULL,
  `PRODUCT_CODE` varchar(100) DEFAULT NULL,
  `PRODUCT_DESCRIPTION` varchar(100) DEFAULT NULL,
  `TRANSACTION_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `ORDER_1_ID` (`ORDER_ID`),
  CONSTRAINT `FK_ORDER_ID` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SHOW CREATE TABLE CUSTOMER;
+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table  |
+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| CUSTOMER | CREATE TABLE `CUSTOMER` (
  `CUSTOMER_ID` int NOT NULL,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `DATE_PURCHASED` date DEFAULT NULL,
  `ADDRESS_ID` int DEFAULT NULL,
  `ORDER_ID` int DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `UK_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
