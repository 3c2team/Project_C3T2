package com.itwillbs.c3t2.vo;

import java.sql.Timestamp;

import lombok.Data;

/*
CREATE TABLE POINT (
	point_num INT PRIMARY KEY AUTO_INCREMENT,
	point_use tinyint NOT NULL,
	point_amount int NOT NULL,
	point_ex VARCHAR(45) NOT NULL,
	point_date DATETIME,
	member_num INT NOT NULL,
    order_detail_num INT,
    FOREIGN KEY (member_num) references MEMBER(member_num) ON DELETE CASCADE,
	FOREIGN KEY (order_detail_num) references ORDER_DETAIL(order_detail_num) ON DELETE CASCADE
);
*/
@Data
public class PointVO {
	private int point_num;
	private int point_use;
	private int point_amount;
	private String point_ex;
	private Timestamp point_date;
	private int member_num;
	private int order_detail_num;
}