package com.itwillbs.c3t2.vo;

import java.sql.Date; 

import lombok.Data;

@Data
public class ReviewVO {
	private int review_num;
    private String review_title;
    private String review_content;
    private int order_num;
    private int product_num;
    private int review_star;
    private int review_lev;
    private int review_ref;
    private Date review_date;
    private int member_num;
}
