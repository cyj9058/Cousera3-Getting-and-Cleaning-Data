create database `electricity market` character set utf8;
use `electricity market`;




CREATE TABLE `power_plant` (
	`id` tinyint not null,
    `연료원` varchar(10),
    `발전형식` varchar(10),
    `발전소명` varchar(10),
    `설비용량` float,
    `대수` tinyint,
    `총설비용량` float,
    primary key(`id`)
);
