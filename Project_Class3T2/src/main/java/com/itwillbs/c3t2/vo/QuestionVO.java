package com.itwillbs.c3t2.vo;

import java.sql.Date; 

import lombok.Data;

@Data
public class QuestionVO {
	private int question_num;
	private String member_id;
	private int product_num;
	private String question_content;
	private Date review_date;
}
