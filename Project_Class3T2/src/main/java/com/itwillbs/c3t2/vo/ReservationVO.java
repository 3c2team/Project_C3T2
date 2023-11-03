package com.itwillbs.c3t2.vo;

import java.sql.Date; 

import lombok.Data;

/*
 * 
CREATE TABLE RESERVATION (
	reservation_num INT PRIMARY KEY AUTO_INCREMENT,
	reservation_date VARCHAR(14) NOT NULL,
	reservation_time VARCHAR(14) NOT NULL,
	reservation_person_name VARCHAR(10) NOT NULL,
	reservation_person_count INT NOT NULL,
	reservation_email VARCHAR(20) NOT NULL, -- 
	reservation_cancel TINYINT NOT NULL, -- 예약취소 딜리트 대신 update 
	reservation_member_id CHAR(1),
	reservation_guest_num int NOT NULL,
	dinning_num INT NOT NULL,
	restaurant_num INT NOT NULL,  -- member_id join 해서 쓰기
	FOREIGN KEY (dinning_num) references DINNING(dinning_num),
	FOREIGN KEY (restaurant_num) references RESTAURANT(restaurant_num)
);
 */


@Data
public class ReservationVO {
	private int reservation_num;
	private String reservation_date;
	private String reservation_time;
	private String reservation_person_name;
	private int reservation_person_count;
	private String reservation_email;
	private String reservation_email1;
	private String reservation_email2;
	private int reservation_cancel;
	private int reservation_is_member;
	private String reservation_guest_num;
	private int dinning_num;
	private int restaurant_num;
}
