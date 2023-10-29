package com.itwillbs.c3t2.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c3t2.handler.GenerateRandomCode;
import com.itwillbs.c3t2.service.ReservationService;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReservationVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	
	//예약 폼 페이지 이동
	@GetMapping("/ReservationForm")
	public String reservationForm() {
		
		return "reservation/reservation_form";
	}
	
	
	
	// 예약 폼 전송, 예약 확인 페이지 이동
	@PostMapping("/ReservationPro")
	public String reservationPro(ReservationVO reservation, HttpSession session, Model model) {
		
		// 랜덤숫자 6자리
		Random random = new Random();	// 랜덤 함수 선언
		int createNum = 0;  			// 1자리 난수
		String ranNum = ""; 			// 1자리 난수 형변환 변수
		int letter = 6;					// 난수 자릿수:6
		String guestNum = "";  		// 결과 난수
		
		for (int i = 0; i < letter; i++) { 
		    		
			createNum = random.nextInt(9);		// 0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum =  Integer.toString(createNum);  // 1자리 난수를 String으로 형변환
			guestNum += ranNum;			// 생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
			reservation.setReservation_guest_num(guestNum);
		}	
		
		int insertCount = service.insertReservation(reservation);
		
		// => 실패 시 "fail_back.jsp" 포워딩(Model 객체의 "msg" 속성값으로 "회원 가입 실패!" 저장)
		if(insertCount > 0) { // 성공
			System.out.println(reservation);
			session.setAttribute("sGuestNum", reservation.getReservation_guest_num());
			return "redirect:/ReservationSuccess";
		} else { // 실패
			model.addAttribute("msg", "예약 실패!");
			return "fail_back";
		}
	}
	
	//예약 성공 이동
	@GetMapping("/ReservationSuccess")
	public String reservationSuccess(ReservationVO reservation, Model model) {
		ReservationVO dbReservation = service.getReservation(reservation);
		dbReservation.setReservation_guest_num(reservation.getReservation_guest_num()); 
		System.out.println(dbReservation);
		model.addAttribute("reservation", dbReservation);
		return "reservation/reservation_success";
	}

	//비회원 예약 검색 페이지 이동
	@GetMapping("/ReservationSearch")
	public String reservationSearch(ReservationVO reservation, HttpSession session, Model model) {
		ReservationVO dbReservation = service.getReservation(reservation);
		System.out.println(dbReservation);
		model.addAttribute("reservation", dbReservation);
		return "reservation/reservation_search";
	}
	
	//비회원 예약 조회 페이지 이동
	@GetMapping("/ReservationSearchInfo")
	public String reservationSearchInfo(ReservationVO reservation, HttpSession session, Model model) {
		System.out.println(reservation);
		ReservationVO dbReservation = service.getReservation(reservation);
		System.out.println(dbReservation);
		
		model.addAttribute("reservation", dbReservation);
		
		return "reservation/reservation_search_info";
	}
	
	// 비회원 예약 정보 수정
	@GetMapping("/ReservationUpdate")
	public String reservationUpdate(ReservationVO reservation, @RequestParam String reservation_guest_num, HttpSession session, Model model) {
		
		ReservationVO dbReservation = service.updateReservation(reservation_guest_num);
		System.out.println(dbReservation);
		
		
		if(reservation_guest_num.equals("")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		
		model.addAttribute("reservation", dbReservation);
		return "reservation/reservation_update";
	}
	
	// 비회원 예약 취소 페이지 이동
	@GetMapping("/ReservationCancel")
	public String reservationcancel(ReservationVO reservation,
			@RequestParam String reservation_guest_num,
			HttpSession session, Model model) {
		ReservationVO dbReservation = service.getReservation(reservation);
		System.out.println(dbReservation);
		
		model.addAttribute("reservation", dbReservation);
		return "reservation/reservation_cancel";
	}
	
	
	
}
