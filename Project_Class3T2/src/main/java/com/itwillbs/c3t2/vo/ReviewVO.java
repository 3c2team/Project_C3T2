package com.itwillbs.c3t2.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_num;
    private String review_content;
    private int order_num;
    private int product_num;
    private String member_id;
    private int review_star;
    private Date review_date;
    private String review_img_name;
    private MultipartFile review_img;
    private String product_name;
}
