package com.itwillbs.c3t2.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_num;
	private String member_id;
	private int product_num;
	private int product_count;
	private int product_price;
	private String product_name;
	private String product_info;
	private String product_main_img_real_file;
}
