package com.itwillbs.c3t2.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int order_detail_num;
	private String member_id;
	private int product_num;
	private int product_count;
	private int product_price;
	private int cart_num;
	

}
