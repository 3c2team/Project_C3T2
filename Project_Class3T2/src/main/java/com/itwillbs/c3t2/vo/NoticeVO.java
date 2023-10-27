package com.itwillbs.c3t2.vo;



import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_num;
	private String notice_subject;
	private String notice_content;
	private Timestamp notice_date;
	private int notice_readcount;
}
