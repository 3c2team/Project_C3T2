package com.itwillbs.c3t2.vo;

import java.sql.Date; 

import lombok.Data;

@Data
public class ReservationVO {
	private int reservation_num;
	private Date reservation_date;
	private String reservation_time;
	private String reservation_id;
	private String reservation_person_name;
	private int reservation_person_count;
	private String reservation_person_phone;
	private int reservation_guest_num;
	private int reservation_cancel;
	private int dinning_num;
	private int restaurant_num;
	private String member_name;

}
