LOAD DATA INFILE '/var/lib/mysql-files/locationClean.csv' INTO TABLE traffic_table FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;