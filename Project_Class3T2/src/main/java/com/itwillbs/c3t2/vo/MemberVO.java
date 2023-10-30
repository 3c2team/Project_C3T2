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
	private String member_address1;
	private String member_address2;
	private String member_e_mail;
	private String member_email1;
	private String member_email2;
	private Timestamp member_insert_date;
	private int member_point;
	private String member_phone_num;
	private Date member_birth;
	private String member_gender;
	private String mail_auth_status;
	private int c1;
	private int c2;
	private int c3;
	private int c4;
	private String kakao_id;
}
