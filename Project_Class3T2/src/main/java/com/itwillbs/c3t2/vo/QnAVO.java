package com.itwillbs.c3t2.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnAVO {
	int question_num;
  	String member_id;
	String question_content;
	int product_num;
	Date question_date;
	int secret;
	int answer_num;
	String answer_content;
	Date answer_date;
}
