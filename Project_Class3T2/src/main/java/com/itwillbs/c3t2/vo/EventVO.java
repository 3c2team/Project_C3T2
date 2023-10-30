package com.itwillbs.c3t2.vo;



import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventVO {
	private int event_num;
	private String event_subject;
	private String event_content;
	private Timestamp event_date;
	private String event_image;
	private int event_num_pre; 
	private int event_num_next;
}
