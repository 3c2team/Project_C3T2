package com.itwillbs.c3t2.vo;

import java.sql.Time;

import lombok.Data;

/*
 * 
CREATE TABLE RESTAURANT (
	restaurant_num INT PRIMARY KEY AUTO_INCREMENT,
	restaurant_name VARCHAR(30) UNIQUE NOT NULL,
	ceo_name VARCHAR(10) NOT NULL,
	restaurant_open_time TIME,
	restaurant_close_time TIME,
	restaurant_address varchar(50) NOT NULL,
	restaurant_call VARCHAR(20) NOT NULL
); 
 */


@Data
public class RestaurantVO {
	private int restaurant_num;
	private String restaurant_name;
	private String ceo_name;
	private String restaurant_open_time;
	private String restaurant_close_time;
	private String restaurant_address;
	private String restaurant_call;

}
