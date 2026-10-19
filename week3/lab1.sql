mysql> create database beneth;
Query OK, 1 row affected (0.01 sec)

mysql> CREATE DATABASE Beneth
    -> DROP DATABASE Beneth
    -> CREATE DATABASE Beneth;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DROP DATABASE Beneth
CREATE DATABASE Beneth' at line 2
mysql> CREATE DATABASE EDWIN;
Query OK, 1 row affected (0.01 sec)

mysql> DROP DATABASE EDWIN;
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql> CREATE DATABASE sen307_11406;
Query OK, 1 row affected (0.01 sec)

mysql> USE sen307_11406;
Database changed
mysql> SELECT DATABASE();
+--------------+
| DATABASE()   |
+--------------+
| sen307_11406 |
+--------------+
1 row in set (0.00 sec)

mysql> SHOW DATABASE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DATABASE' at line 1
mysql> SHOW DTATABASES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DTATABASES' at line 1
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sen307_11406       |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 8.0.46    |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT CURRENT_USER();
+----------------+
| CURRENT_USER() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT NOW;
ERROR 1054 (42S22): Unknown column 'NOW' in 'field list'
mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-10-19 15:13:05 |
+---------------------+
1 row in set (0.00 sec)

mysql> STATUS;
--------------
mysql  Ver 8.0.46 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          13
Current database:       sen307_11406
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_256_GCM_SHA384
Using delimiter:        ;
Server version:         8.0.46 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    cp850
Conn.  characterset:    cp850
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 39 min 53 sec

Threads: 8  Questions: 90  Slow queries: 0  Opens: 313  Flush tables: 3  Open tables: 229  Queries per second avg: 0.037
--------------

mysql> SHOW VARIABLES LIKE 'port';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| port          | 3306  |
+---------------+-------+
1 row in set (0.01 sec)

mysql> SHOW TABLES;
Empty set (0.00 sec)

mysql>