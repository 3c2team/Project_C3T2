package com.itwillbs.c3t2.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int member_num;
	private String member_name;
	private String member_id;
	private String member_passwd;
	private String member_address;
	private String member_e_mail;
	private Timestamp member_insert_date;
	private int member_point;
	private String member_phone_num;
	private Date member_birth_day;
	private String member_gender; 
	private int member_private_info_agree;

}