create table if not exists traffic_db.traffic_table (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    track_id int not null,
    vehicle_type varchar(400) NOT null,
    traveled_d varchar(400) NOT null,
    avg_speed float NOT null,
    lat float NOT null,
    lon float NOT null,
    speed float NOT null,
    loan_acc float NOT null,
    lat_acc float NOT null,
    record_time float NOT null
);
