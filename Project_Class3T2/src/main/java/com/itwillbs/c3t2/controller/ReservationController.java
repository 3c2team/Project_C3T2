package com.itwillbs.c3t2.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

public class ReservationController {
	
	//예약 성공 이동
    @PostMapping("reservationSuccess")
    public String reservationSuccess() {
    	return "reservation/reservation_success";
    }
    //예약 상세 정보 이동
    @GetMapping("reservationInfo")
    public String reservationInfo() {
    	return "reservation/reservation_info";
    }
}
