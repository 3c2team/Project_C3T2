package com.itwillbs.c3t2.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int product_num;
	private String product_name;
	private int product_price;
	private String product_info;
	private Date product_release;
	private int product_category_num;
	private String product_main_img;
	private String product_main_img_real_file;
	private int product_count;
}
