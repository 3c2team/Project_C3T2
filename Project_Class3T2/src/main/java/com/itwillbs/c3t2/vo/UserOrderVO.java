package com.itwillbs.c3t2.vo;

import java.sql.Timestamp; 

import lombok.Data;

@Data
public class UserOrderVO {
	private int order_num;
	private int member_num;
	private Timestamp order_date;
	private String receiver_address;
	private String receiver_name;
	private String receiver_phone;
	private String receiver_request;
	private int product_num;
	
}
