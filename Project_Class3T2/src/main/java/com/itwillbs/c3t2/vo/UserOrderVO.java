package com.itwillbs.c3t2.vo;

import java.sql.Timestamp; 

import lombok.Data;

@Data
public class UserOrderVO {
	private int order_num;
	private String member_id;
	private int product_num;
	private String product_name;
	private int product_count;
	private int product_price;
	private String merchant_uid;
	private Timestamp order_date;
	
}
